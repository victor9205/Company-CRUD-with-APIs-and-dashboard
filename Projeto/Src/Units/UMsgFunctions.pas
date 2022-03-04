unit UMsgFunctions;

interface

uses Windows, Classes;

type
  TMsgFunctions = class
  private
   class procedure MessageButtonClick(Sender: TObject);
  published
   class procedure Atention(const Message: String);
   class procedure AtentionFmt(const Message: string; const Args: array of const);
   class procedure Error(const Message: String);
   class procedure ErrorFmt(const Message: string; const Args: array of const);
   class function MessageButton(const Message: String; Botoes: array of string;
     TamanhoBotao : Integer = 105; const ShowMessageInTitle: boolean = True) : Integer;
   class function Question(const Message: String; Flags: integer = MB_ICONQUESTION + MB_DEFBUTTON2): boolean;
   class function ListChoice(const Items: TStringList; const FormCaption, RdgCaption: string; const DefaultIndex: integer = 0): integer;
   class function ListChoice2(Items: TStrings; const ACaption, ALabel: string; const AItemIndex: integer = 0; const MultiSel: boolean = false; const MultiSelSeparator: char = ' '): string;
   class function ListChoice3(Items: TStrings; const ACaption, ALabel: string; const AItemIndex: integer = 0): integer;
  end;

implementation

uses Vcl.Forms, SysUtils, StrUtils, Vcl.StdCtrls, Vcl.Controls, Vcl.ExtCtrls, Math, Vcl.Graphics,
  cxRadioGroup, UStringFunctions;

{ TMsgFunctions }

class procedure TMsgFunctions.Atention(const Message: String);
begin
  Application.MessageBox(PChar(Message), PChar(Format('%s - Atenção', [Application.Title])), MB_ICONWARNING + MB_OK);
end;

class procedure TMsgFunctions.AtentionFmt(const Message: string;
  const Args: array of const);
begin
  Self.Atention(Format(Message, Args));  
end;

class procedure TMsgFunctions.Error(const Message: String);
begin
  Application.MessageBox(PChar(Message), PChar(Format('%s - Erro', [Application.Title])), MB_ICONERROR + MB_OK);
end;

class procedure TMsgFunctions.ErrorFmt(const Message: string;
  const Args: array of const);
begin
  Self.Error(Format(Message, Args));
end;

class function TMsgFunctions.MessageButton(const Message: String;
  Botoes: array of string; TamanhoBotao: Integer; const ShowMessageInTitle: boolean): Integer;
var
  objForm : TForm;
  objBotao : TButton;
  objLbl   : TLabel;
  iPosBot, iTopBot, iQteBot, i : integer;
  objBevel : TBevel;
begin
  iQteBot := Length(Botoes);

  objForm             := TForm.Create(nil);

  try
   objForm.BorderIcons := [biSystemMenu];
   objForm.BorderStyle := bsDialog;
   objForm.Font.Name   := 'Arial';
   objForm.Icon        := Application.Icon;
   objForm.KeyPreview  := True;
   objForm.Position    := poScreenCenter;
   objForm.Tag         := -1;
   objForm.Width       := (iQteBot * (TamanhoBotao + 12)) + 10;
   iPosBot             := 10;
   objBevel            := TBevel.Create(objForm);
   objBevel.Align      := alClient;
   objBevel.Parent     := objForm;

   objForm.Caption     := IfThen(ShowMessageInTitle, Message, Application.Title);

   if ShowMessageInTitle then
    begin
     objForm.Height := 80;
     iTopBot        := 16;
    end
   else
    begin
     objLbl            := TLabel.Create(objForm);
     objLbl.Parent     := objForm;
     objLbl.ParentFont := True;
     objLbl.WordWrap   := True;
     objLbl.SetBounds(10, 4, objForm.Width - 20, 16);
     objLbl.Height     := objLbl.Canvas.TextHeight(Message);
     objLbl.Caption    := Message;
     objForm.Height    := objLbl.Height + 90;
     iTopBot           := objForm.Height - 65;
    end;

   for i := 0 to iQteBot - 1 do
    begin
     objBotao         := TButton.Create(objForm);
     objBotao.Parent  := objForm;
     objBotao.Tag     := i;
     objBotao.Caption := Botoes[i];
     objBotao.OnClick := MessageButtonClick;

     objBotao.SetBounds(iPosBot, iTopBot, TamanhoBotao, 25);

     iPosBot          := iPosBot + objBotao.Width + 10;
    end;

   Result := IfThen(objForm.ShowModal = mrOK, objForm.Tag, -1);
  finally
   objForm.Free;
  end;
end;

class procedure TMsgFunctions.MessageButtonClick(Sender: TObject);
var
  objButton: TButton;
begin
  if Sender is TButton then
   begin
    objButton           := TButton(Sender);
    objButton.Owner.Tag := objButton.Tag;
    (objButton.Owner as TForm).ModalResult := mrOK;
   end;
end;

class function TMsgFunctions.Question(const Message: String;
  Flags: integer): boolean;
begin
  Result := Application.MessageBox(PChar(Message), PChar(Format('%s - Pergunta', [Application.Title])), MB_YESNO + Flags) = ID_YES;
end;

//******************************************************************************
// Funcao.....: ListChoice
// Adaptacao..: 07/05/2021
// Tecnico....: Flavio Ribeiro
// Descricao..: Mostra janela com Items de RadioButton, e retorna o índice selecionado
//******************************************************************************
class function TMsgFunctions.ListChoice(const Items: TStringList; const FormCaption, RdgCaption: string; const DefaultIndex: integer = 0): integer;
var
  Lista: TStringList;
  AForm: TForm;
  rdg: TcxRadioGroup;
  btnOK, btnCancelar: TButton;
  Qt, i: integer;

begin
  Lista := Items;
  Qt := Lista.Count;

  AForm := TForm.Create(Application);
  with AForm do
  begin
    BorderIcons := [biSystemMenu];
    BorderStyle := bsSingle;
    Font.Name   := 'Arial';
    Position := poScreenCenter;
    Height := IfThen(Lista.Count > 1, (Qt * IfThen(Lista.Count >= 5, 25, 40)) + 48, 100);
    Width := 300;
    Icon := Application.Icon;
    KeyPreview := true;
    Caption := IfThen(FormCaption <> '', FormCaption, 'Seleção de Itens');
  end;

  rdg := TcxRadioGroup.Create(Application);

  with rdg do
  begin
    Parent := AForm;
    SetBounds(4, 2, AForm.Width - 14, AForm.Height - 68);

    for i := 0 to Lista.Count - 1 do
     Properties.Items.Add.Caption := Lista[i];

    ItemIndex := DefaultIndex;
    Caption := ' ' + RdgCaption + ' ';
  end;

  btnOK := TButton.Create(AForm);
  with btnOK do
  begin
    Parent := AForm;
    Default := true;
    Caption := 'O&K';
    SetBounds(87, rdg.Height + 5, 75, 25);
    ModalResult := mrOK;
  end;

  btnCancelar := TButton.Create(AForm);
  with btnCancelar do
  begin
    Parent := AForm;
    Cancel := true;
    Caption := '&Cancelar';
    SetBounds(165, rdg.Height + 5, 75, 25);
    ModalResult := mrCancel;
  end;

  Result := -1;
  if AForm.ShowModal = mrOK then
    Result := rdg.ItemIndex;

  btnOK.Free;
  AForm.Free;
end;

//******************************************************************************
// Funcao.....: ListChoice3
// Adaptacao..: 01/07/2021
// Tecnico....: Leandro Alves da Silva
// Descricao..: Mostra janela com Items Checklist, e retorna o índice selecionado
//******************************************************************************
class function TMsgFunctions.ListChoice3(Items: TStrings; const ACaption, ALabel: string; const AItemIndex: integer): integer;
var
  AForm: TForm;
  AListBox: TListBox;
  TheLabel: TLabel;
  btnOK, btnCancelar: TButton;
  i: integer;
begin
  AForm := TForm.Create(Application);
  with AForm do
  begin
    BorderIcons := [biSystemMenu];
    BorderStyle := bsSingle;
    Position := poScreenCenter;
    Height := 255;
    Width := 272;
    Icon := Application.Icon;
    KeyPreview := true;
    Caption := IfThen(TStringFunctions.Cheio(ACaption), ACaption, 'Seleção de Itens');
  end;

  btnOK := TButton.Create(AForm);
  with btnOK do
  begin
    Parent := AForm;
    Default := true;
    Caption := 'O&K';
    SetBounds(110, 202, 75, 25);
    ModalResult := mrOK;
  end;

  btnCancelar := TButton.Create(AForm);
  with btnCancelar do
  begin
    Parent := AForm;
    Cancel := true;
    Caption := '&Cancelar';
    SetBounds(188, 202, 75, 25);
    ModalResult := mrCancel;
  end;

  AListBox := TListBox.Create(AForm);
  with AListBox do
  begin
    Parent := AForm;
    SetBounds(2, 21, 260, 175);
  end;

  TheLabel := TLabel.Create(AForm);
  with TheLabel do
  begin
    Parent := AForm;
    Left := 3;
    Top := 6;
    FocusControl := AListBox;
    Caption := IfThen(TStringFunctions.Cheio(ALabel), ALabel, '&Selecione um dos itens abaixo e clique em OK:');
  end;

  AListBox.Items := Items;
  if (AItemIndex > -1) and (AItemIndex < AListBox.Items.Count) then
    AListBox.ItemIndex := AItemIndex;

  Result := -1;
  AForm.ActiveControl := AListBox;
  if (AForm.ShowModal = mrOK) and (AListBox.ItemIndex > -1) then
    for i := 0 to AListBox.Items.Count - 1 do
      if AListBox.Selected[i] then
       begin
        Result := i;
        Exit;
       end;

  btnOK.Free;
  AForm.Free;
end;

//******************************************************************************
// Funcao.....: ListChoice2
// Adaptacao..: 07/05/2021
// Tecnico....: Flavio Ribeiro
// Descricao..: Mostra janela com Items de RadioButton ou Checklist, e retorna o índice selecionado
//******************************************************************************
class function TMsgFunctions.ListChoice2(Items: TStrings; const ACaption, ALabel: string; const AItemIndex: integer = 0; const MultiSel: boolean = false; const MultiSelSeparator: char = ' '): string;
var
  AForm: TForm;
  AListBox: TListBox;
  TheLabel: TLabel;
  btnOK, btnCancelar: TButton;
  i: integer;
begin
  AForm := TForm.Create(Application);
  with AForm do
  begin
    BorderIcons := [biSystemMenu];
    BorderStyle := bsSingle;
    Position := poScreenCenter;
    Height := 255;
    Width := 272;
    Icon := Application.Icon;
    KeyPreview := true;
    Caption := IfThen(TStringFunctions.Cheio(ACaption), ACaption, 'Seleção de Itens');
  end;

  btnOK := TButton.Create(AForm);
  with btnOK do
  begin
    Parent := AForm;
    Default := true;
    Caption := 'O&K';
    SetBounds(110, 202, 75, 25);
    ModalResult := mrOK;
  end;

  btnCancelar := TButton.Create(AForm);
  with btnCancelar do
  begin
    Parent := AForm;
    Cancel := true;
    Caption := '&Cancelar';
    SetBounds(188, 202, 75, 25);
    ModalResult := mrCancel;
  end;

  AListBox := TListBox.Create(AForm);
  with AListBox do
  begin
    Parent := AForm;
    SetBounds(2, 21, 260, 175);
    MultiSelect := MultiSel;
  end;

  TheLabel := TLabel.Create(AForm);
  with TheLabel do
  begin
    Parent := AForm;
    Left := 3;
    Top := 6;
    FocusControl := AListBox;
    Caption := IfThen(TStringFunctions.Cheio(ALabel), ALabel, '&Selecione um dos itens abaixo e clique em OK:');
  end;

  AListBox.Items := Items;
  if (AItemIndex > -1) and (AItemIndex < AListBox.Items.Count) then
    AListBox.ItemIndex := AItemIndex;

  Result := '';
  AForm.ActiveControl := AListBox;
  if (AForm.ShowModal = mrOK) and (AListBox.ItemIndex > -1) then
    for i := 0 to AListBox.Items.Count - 1 do
      if AListBox.Selected[i] then
        Result := Result + AListBox.Items[i] + MultiSelSeparator;

  if TStringFunctions.LastChar(Result) = MultiSelSeparator then Result := TStringFunctions.CopyNoLast(Result);

  btnOK.Free;
  AForm.Free;
end;

end.
