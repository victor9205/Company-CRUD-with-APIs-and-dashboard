unit UAppFunctions;

interface

uses Windows, Classes, Messages, SysUtils, ShellAPI;

type
  TAppFunctions = class(TPersistent)
  private
  published
    class function AppFullName: string;
    class function AppName: string;
    class function AppPath: string;
    class function AppDir: string;
    class function AppVersion: string;
    {$IFNDEF SERVICO}
    class procedure BroadcastMessage(const Message: Cardinal;
      const wParam: Cardinal = 0; const lParam: Cardinal = 0;
      const BySend: Boolean = False);
    {$ENDIF}
    class procedure Finalize;
    class function GetDosOutput(const CommandLine: string; Log: TStrings; const ClearLog: boolean): integer;
    class function RunAndWait(const Prog: string; const WindowType: cardinal = SW_SHOWNORMAL): boolean;
    class function RunHide(const FileToRun: string): boolean;
    class function RunNormal(const FileToRun: string): boolean;
    class function Run(const FileToRun: String; parametros: String = ''): boolean;
    class function SendKeys(SendKeysString : PChar; Wait : Boolean) : Boolean;
    class function IsWindowsService: boolean;
    class function IsCloud: boolean;
    class function GetCloudDocumentsFolder(const SubFolder: string = ''): string;
  end;

implementation

uses StrUtils, UTronException, UFileFunctions, IOUtils, UStringFunctions, URegFunctions,
    {$IFDEF SERVICO} SvcMgr {$ELSE} Vcl.Forms {$ENDIF};

{ TAppFunctions }

class function TAppFunctions.AppDir: string;
begin
  Result := ExtractFileDir(ParamStr(0));
end;

class function TAppFunctions.AppFullName: string;
begin
  Result := ParamStr(0);
end;

class function TAppFunctions.AppName: string;
begin
  Result := ExtractFileName(ParamStr(0));
end;

class function TAppFunctions.AppPath: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
end;

{ Executa 'Prog' e espera o final de sua execução para retornar. Use WindowType para definir
  como a janela será exibida: SW_HIDE, SW_SHOWNORMAL, SW_MAXIMIZED, SW_MINIMIZED }
class function TAppFunctions.AppVersion: string;
begin
  Result := TFileFunctions.GetFileVersion(ParamStr(0)).ToString();
end;

{$IFNDEF SERVICO}
class procedure TAppFunctions.BroadcastMessage(const Message, wParam,
  lParam: Cardinal; const BySend: Boolean);
var
  i: integer;
begin
  for i := Screen.FormCount - 1 downto 0 do
   if BySend then
    SendMessage(Screen.Forms[i].Handle, Message, wParam, lParam)
   else PostMessage(Screen.Forms[i].Handle, Message, wParam, lParam);
end;
{$ENDIF}

class procedure TAppFunctions.Finalize;
begin
  {$IFNDEF SERVICO}
  Application.ShowMainForm := False;
  Application.Terminate;
  {$ENDIF}
end;

class function TAppFunctions.GetCloudDocumentsFolder(const SubFolder: string): string;
begin
  Result := TPath.Combine(TAppFunctions.AppPath, '..\Documentos');

  if TStringFunctions.IsFull(SubFolder) then
   Result := TPath.Combine(Result, SubFolder);
end;

class function TAppFunctions.GetDosOutput(const CommandLine: string;
  Log: TStrings; const ClearLog: boolean): Integer;
var
  SA: TSecurityAttributes;
  SI: TStartupInfo;
  PI: TProcessInformation;
  StdOutPipeRead, StdOutPipeWrite: THandle;
  WasOK: Boolean;
  Buffer: array[0..255] of AnsiChar;
  BytesRead: Cardinal;
  WorkDir: String;
  iLines: Integer;
  iCode: Cardinal;
begin
  if ClearLog then
   Log.Clear;

  iLines := 0;

  {$IFNDEF SERVICO}
  Application.ProcessMessages;
  {$ENDIF}

  with SA do
   begin
    nLength := SizeOf(SA);
    bInheritHandle := True;
    lpSecurityDescriptor := nil;
  end;

  // create pipe for standard output redirection
  CreatePipe(StdOutPipeRead, // read handle
             StdOutPipeWrite, // write handle
             @SA, // security attributes
             0 // number of bytes reserved for pipe - 0 default
             );
  try
   // Make child process use StdOutPipeWrite as standard out,
   // and make sure it does not show on screen.
   with SI do
    begin
     FillChar(SI, SizeOf(SI), 0);
     cb := SizeOf(SI);
     dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
     wShowWindow := SW_HIDE;
     hStdInput := GetStdHandle(STD_INPUT_HANDLE); // don't redirect stdinput
     hStdOutput := StdOutPipeWrite;
     hStdError := StdOutPipeWrite;
    end;

   // launch the command line compiler
   WorkDir := '';
   WasOK := CreateProcess(nil, PChar(CommandLine), nil, nil, True, 0, nil, nil, SI, PI);

   // Now that the handle has been inherited, close write to be safe.
   // We don't want to read or write to it accidentally.
   CloseHandle(StdOutPipeWrite);
   // if process could be created then handle its output
   if not WasOK then
    raise Exception.Create('Could not execute command line!')
   else
    try
     repeat
      // read block of characters (might contain carriage returns and line feeds)
      WasOK := ReadFile(StdOutPipeRead, Buffer, 255, BytesRead, nil);

      // has anything been read?
      if BytesRead > 0 then
       begin
        // finish buffer to PChar
        Buffer[BytesRead] := #0;
        // combine the buffer with the rest of the last run
        Log.Add(Buffer);

        if iLines = 300 then
         begin
          iLines := 0;
          {$IFNDEF SERVICO}
          Application.ProcessMessages;
          Application.BringToFront;
          {$ENDIF}
         end
        else Inc(iLines);
       end;
      until not WasOK or (BytesRead = 0);

      // wait for console app to finish (should be already at this point)
      WaitForSingleObject(PI.hProcess, INFINITE);

      GetExitCodeProcess(PI.hProcess, iCode);
      Result := iCode;
    finally
     // Close all remaining handles
     CloseHandle(PI.hThread);
     CloseHandle(PI.hProcess);
    end;
  finally
   CloseHandle(StdOutPipeRead);
  end;
end;

class function TAppFunctions.IsCloud: boolean;
begin
  Result := FindCmdLineSwitch('CLOUD', ['-', '/'], True) or TRegFunctions.ReadRegisterBool(HKEY_LOCAL_MACHINE, 'Software\Tron\TronServer', 'Cloud', False);
end;

class function TAppFunctions.IsWindowsService: boolean;
begin
  Result := FindCmdLineSwitch('SERVICE', ['-', '/'], True);
end;

class function TAppFunctions.RunNormal(const FileToRun: string): boolean;
begin
  Result := WinExec(PAnsiChar(FileToRun), sw_ShowNormal) > 31;
end;

class function TAppFunctions.Run(const FileToRun: String; parametros: String = ''): boolean;
begin
  Result := (ShellExecute(0, 'open', PChar(FileToRun), PChar(parametros), '', SW_SHOWNORMAL) > 32);
end;

class function TAppFunctions.RunHide(const FileToRun: string): boolean;
begin
  Result := WinExec(PAnsiChar('command.com /c ' + FileToRun), sw_Hide) > 31;
end;

class function TAppFunctions.RunAndWait(const Prog: string; const WindowType: cardinal): boolean;
var
  StartupInfo: TStartupinfo;
  ProcessInfo: TProcessInformation;
  sDir: string;
  iCode: cardinal;
begin
  sDir := IfThen(DirectoryExists(ExtractFileDir(Prog)), ExtractFileDir(Prog), TAppFunctions.AppPath);
  FillChar(Startupinfo, Sizeof(TStartupinfo), 0);
  Startupinfo.cb := Sizeof(TStartupInfo);
  Startupinfo.dwFlags := STARTF_USESHOWWINDOW;
  Startupinfo.wShowWindow := WindowType;
  if CreateProcess(nil, PChar(Prog), nil, nil, false, HIGH_PRIORITY_CLASS, nil,
                   PChar(sDir), Startupinfo, ProcessInfo) then
   begin
    WaitForSingleObject(Processinfo.hProcess, INFINITE);
    GetExitCodeProcess(Processinfo.hProcess, iCode);
    Result := iCode = 0;
    CloseHandle(ProcessInfo.hProcess);
   end
  else Result := false;
end;

(*
Converte um nome de tecla para um evento de teclado (Pressiona uma Tela)

Exemplo:

SendKeys('abc123{left}{left}{left}def{end}456{left 6}ghi{end}789', True);

*)
class function TAppFunctions.SendKeys(SendKeysString : PChar; Wait : Boolean): Boolean;
  type
    THKeys = array[0..pred(MaxLongInt)] of byte;

    WBytes = array[0..pred(SizeOf(Word))] of Byte;

    TSendKey = record
      Name : ShortString;
      VKey : Byte;
    end;

  const
    {Array of keys that SendKeys recognizes.

    If you add to this list, you must be sure to keep it sorted alphabetically
    by Name because a binary search routine is used to scan it.}

    MaxSendKeyRecs = 41;
    SendKeyRecs : array[1..MaxSendKeyRecs] of TSendKey =
    (
     (Name:'BACKSPACE';       VKey:VK_BACK),
     (Name:'BKSP';            VKey:VK_BACK),
     (Name:'BREAK';           VKey:VK_CANCEL),
     (Name:'BS';              VKey:VK_BACK),
     (Name:'CAPSLOCK';        VKey:VK_CAPITAL),
     (Name:'CLEAR';           VKey:VK_CLEAR),
     (Name:'DEL';             VKey:VK_DELETE),
     (Name:'DELETE';          VKey:VK_DELETE),
     (Name:'DOWN';            VKey:VK_DOWN),
     (Name:'END';             VKey:VK_END),
     (Name:'ENTER';           VKey:VK_RETURN),
     (Name:'ESC';             VKey:VK_ESCAPE),
     (Name:'ESCAPE';          VKey:VK_ESCAPE),
     (Name:'F1';              VKey:VK_F1),
     (Name:'F10';             VKey:VK_F10),
     (Name:'F11';             VKey:VK_F11),
     (Name:'F12';             VKey:VK_F12),
     (Name:'F13';             VKey:VK_F13),
     (Name:'F14';             VKey:VK_F14),
     (Name:'F15';             VKey:VK_F15),
     (Name:'F16';             VKey:VK_F16),
     (Name:'F2';              VKey:VK_F2),
     (Name:'F3';              VKey:VK_F3),
     (Name:'F4';              VKey:VK_F4),
     (Name:'F5';              VKey:VK_F5),
     (Name:'F6';              VKey:VK_F6),
     (Name:'F7';              VKey:VK_F7),
     (Name:'F8';              VKey:VK_F8),
     (Name:'F9';              VKey:VK_F9),
     (Name:'HELP';            VKey:VK_HELP),
     (Name:'HOME';            VKey:VK_HOME),
     (Name:'INS';             VKey:VK_INSERT),
     (Name:'LEFT';            VKey:VK_LEFT),
     (Name:'NUMLOCK';         VKey:VK_NUMLOCK),
     (Name:'PGDN';            VKey:VK_NEXT),
     (Name:'PGUP';            VKey:VK_PRIOR),
     (Name:'PRTSC';           VKey:VK_PRINT),
     (Name:'RIGHT';           VKey:VK_RIGHT),
     (Name:'SCROLLLOCK';      VKey:VK_SCROLL),
     (Name:'TAB';             VKey:VK_TAB),
     (Name:'UP';              VKey:VK_UP)
    );

    {Extra VK constants missing from Delphi's Windows API interface}
    VK_NULL=0;
    VK_SemiColon=186;
    VK_Equal=187;
    VK_Comma=188;
    VK_Minus=189;
    VK_Period=190;
    VK_Slash=191;
    VK_BackQuote=192;
    VK_LeftBracket=219;
    VK_BackSlash=220;
    VK_RightBracket=221;
    VK_Quote=222;
    VK_Last=VK_Quote;

    ExtendedVKeys : set of byte =
    [VK_Up,
     VK_Down,
     VK_Left,
     VK_Right,
     VK_Home,
     VK_End,
     VK_Prior,  {PgUp}
     VK_Next,   {PgDn}
     VK_Insert,
     VK_Delete];

  const
   INVALIDKEY = $FFFF {Unsigned -1};
   VKKEYSCANSHIFTON = $01;
   VKKEYSCANCTRLON = $02;
   VKKEYSCANALTON = $04;
   UNITNAME = 'SendKeys';
   WorkBufLen = 40;
  var
   UsingParens, ShiftDown, ControlDown, AltDown, FoundClose : Boolean;
   PosSpace : Byte;
   I, L : Integer;
   NumTimes, MKey : Word;
   KeyString : String[20];
   WorkBuf : array[0..WorkBufLen] of Char;
   AllocationSize : integer;

  procedure DisplayMessage(Message : PChar);
  begin
   MessageBox(0,Message,UNITNAME,0);
  end;

  function BitSet(BitTable, BitMask : Byte) : Boolean;
  begin
   Result:=ByteBool(BitTable and BitMask);
  end;

  procedure SetBit(var BitTable : Byte; BitMask : Byte);
  begin
   BitTable:=BitTable or Bitmask;
  end;

  procedure KeyboardEvent(VKey, ScanCode : Byte; Flags : Longint);
  var
   KeyboardMsg : TMsg;
  begin
   keybd_event(VKey, ScanCode, Flags,0);
   if (Wait) then
    While (PeekMessage(KeyboardMsg,0,WM_KEYFIRST, WM_KEYLAST, PM_REMOVE)) do
    begin
     TranslateMessage(KeyboardMsg);
     DispatchMessage(KeyboardMsg);
    end;
  end;

  procedure SendKeyDown(VKey: Byte; NumTimes : Word; GenUpMsg : Boolean);
  var
   Cnt : Word;
   ScanCode : Byte;
   NumState : Boolean;
   KeyBoardState : TKeyboardState;
  begin
    if (VKey=VK_NUMLOCK) then
     begin
      NumState:=ByteBool(GetKeyState(VK_NUMLOCK) and 1);
      GetKeyBoardState(KeyBoardState);

      if NumState then
       KeyBoardState[VK_NUMLOCK]:=(KeyBoardState[VK_NUMLOCK] and not 1)
      else
       KeyBoardState[VK_NUMLOCK]:=(KeyBoardState[VK_NUMLOCK] or 1);

      SetKeyBoardState(KeyBoardState);
      exit;
     end;

    ScanCode:=Lo(MapVirtualKey(VKey,0));
    for Cnt := 1 to NumTimes do
     if (VKey in ExtendedVKeys) then
      begin
       KeyboardEvent(VKey, ScanCode, KEYEVENTF_EXTENDEDKEY);
       if (GenUpMsg) then
        KeyboardEvent(VKey, ScanCode, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP)
      end
      else
      begin
       KeyboardEvent(VKey, ScanCode, 0);
       if (GenUpMsg) then KeyboardEvent(VKey, ScanCode, KEYEVENTF_KEYUP);
      end;
  end;

  procedure SendKeyUp(VKey: Byte);
  var
   ScanCode : Byte;
  begin
   ScanCode:=Lo(MapVirtualKey(VKey,0));
   if (VKey in ExtendedVKeys)then
    KeyboardEvent(VKey, ScanCode, KEYEVENTF_EXTENDEDKEY and KEYEVENTF_KEYUP)
   else KeyboardEvent(VKey, ScanCode, KEYEVENTF_KEYUP);
  end;

  procedure SendKey(MKey: Word; NumTimes : Word; GenDownMsg : Boolean);
  begin
   if (BitSet(Hi(MKey),VKKEYSCANSHIFTON)) then SendKeyDown(VK_SHIFT,1,False);
   if (BitSet(Hi(MKey),VKKEYSCANCTRLON)) then SendKeyDown(VK_CONTROL,1,False);
   if (BitSet(Hi(MKey),VKKEYSCANALTON)) then SendKeyDown(VK_MENU,1,False);
   SendKeyDown(Lo(MKey), NumTimes, GenDownMsg);
   if (BitSet(Hi(MKey),VKKEYSCANSHIFTON)) then SendKeyUp(VK_SHIFT);
   if (BitSet(Hi(MKey),VKKEYSCANCTRLON)) then SendKeyUp(VK_CONTROL);
   if (BitSet(Hi(MKey),VKKEYSCANALTON)) then SendKeyUp(VK_MENU);
  end;

  {Implements a simple binary search to locate special key name strings}

  function StringToVKey(KeyString : ShortString) : Word;
  var
   Found, Collided : Boolean;
   Bottom, Top, Middle : Byte;
  begin
   Result:=INVALIDKEY;
   Bottom:=1;
   Top:=MaxSendKeyRecs;
   Found:=false;
   Middle:=(Bottom+Top) div 2;
   Repeat
    Collided:=((Bottom=Middle) or (Top=Middle));
    if (KeyString=SendKeyRecs[Middle].Name) then
     begin
      Found:=True;
      Result:=SendKeyRecs[Middle].VKey;
     end
     else
     begin
      if (KeyString>SendKeyRecs[Middle].Name) then
       Bottom:=Middle
      else
       Top:=Middle;

      Middle:=(Succ(Bottom+Top)) div 2;
     end;
    Until (Found or Collided);
    if (Result=INVALIDKEY) then
     DisplayMessage('Invalid Key Name');
  end;

  procedure PopUpShiftKeys;
  begin
   if (not UsingParens) then
   begin
    if ShiftDown then SendKeyUp(VK_SHIFT);
    if ControlDown then SendKeyUp(VK_CONTROL);
    if AltDown then SendKeyUp(VK_MENU);
    ShiftDown:=false;
    ControlDown:=false;
    AltDown:=false;
   end;
  end;
begin
  AllocationSize := MaxInt;
  Result:=false;
  UsingParens:=false;
  ShiftDown:=false;
  ControlDown:=false;
  AltDown:=false;
  I:=0;
  L:=StrLen(SendKeysString);
  If (L>AllocationSize) then L:=AllocationSize;
  If (L=0) then Exit;

  While (I < L) do
  begin
   case SendKeysString[I] of
    '(' : begin
           UsingParens:=True;
           Inc(I);
          end;
    ')' : begin
           UsingParens:=False;
           PopUpShiftKeys;
           Inc(I);
          end;
    '%' : begin
           AltDown:=True;
           SendKeyDown(VK_MENU,1,False);
           Inc(I);
          end;
    '+' :  begin
            ShiftDown:=True;
            SendKeyDown(VK_SHIFT,1,False);
            Inc(I);
           end;
    '^' :  begin
            ControlDown:=True;
            SendKeyDown(VK_CONTROL,1,False);
            Inc(I);
           end;
    '{' : begin
            NumTimes:=1;
            if (SendKeysString[Succ(I)] = '{') then
            begin
             MKey:=VK_LEFTBRACKET;
             SetBit(Wbytes(MKey)[1],VKKEYSCANSHIFTON);
             SendKey(MKey,1,True);
             PopUpShiftKeys;
             Inc(I,3);
             Continue;
            end;

            KeyString:='';
            FoundClose:=False;
            While (I <= L) do
            begin
             Inc(I);
             If (SendKeysString[I] = '}') then
             begin
              FoundClose:=True;
              Inc(I);
              Break;
             end;

             KeyString := KeyString + Upcase(SendKeysString[I]);
            end;

            if (not FoundClose) then
            begin
             DisplayMessage('No Close');
             Exit;
            end;

            if (SendKeysString[I] = '}') then
            begin
             MKey:=VK_RIGHTBRACKET;
             SetBit(Wbytes(MKey)[1],VKKEYSCANSHIFTON);
             SendKey(MKey,1,True);
             PopUpShiftKeys;
             Inc(I);
             Continue;
            end;

            PosSpace:=Pos(' ',KeyString);

            if (PosSpace<>0) then
            begin
             NumTimes:=StrToInt(Copy(KeyString,Succ(PosSpace),Length(KeyString)-PosSpace));
             KeyString:=Copy(KeyString,1,Pred(PosSpace));
            end;

            if (Length(KeyString) = 1) then
             MKey:=vkKeyScan(Char(KeyString[1]))
            else MKey:=StringToVKey(KeyString);

            If (MKey <> INVALIDKEY) then
            begin
             SendKey(MKey,NumTimes,True);
             PopUpShiftKeys;
             Continue;
            end;
          end;
    '~' : begin
           SendKeyDown(VK_RETURN,1,True);
           PopUpShiftKeys;
           Inc(I);
          end;
    else
     begin
      MKey:=vkKeyScan(SendKeysString[I]);
      if (MKey <> INVALIDKEY) then begin
       SendKey(MKey,1,True);
       PopUpShiftKeys;
      end
      else DisplayMessage('Invalid KeyName');

      Inc(I);
     end;
   end;
  end;

  Result := true;
  PopUpShiftKeys;
end;

end.
