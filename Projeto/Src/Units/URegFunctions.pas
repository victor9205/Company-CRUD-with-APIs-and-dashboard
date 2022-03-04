unit URegFunctions;

interface

uses Registry, Windows;

type
  TRegFunctions = class
  private
   class procedure OpenRegistry(var Registry: TRegistry; Root: HKey; const Key: string; const CanCreate: boolean = true; const ReadOnly: boolean = true);
  public
   class function ItemExists(Root: HKEY; const Key, Item: string): boolean;
   class function DelRegisterItem(Root: HKey; const Key, Item: string): boolean;
   class function ReadRegisterBool(Root: HKEY; const Key, Item: string; const DefaultReturn: boolean = false; const CanCreate: boolean = false): boolean;
   class function ReadRegisterInt(Root: HKEY; const Key, Item: string; const DefaultReturn: integer = 0; const CanCreate: boolean = false): integer;
   class function ReadRegisterStr(Root: HKey; const Key, Item: string; const DefaultReturn: string = ''; const CanCreate: boolean = False): string;
   class function ReadRegisterDouble(Root: HKEY; const Key, Item: string; const DefaultReturn: double = 0; const CanCreate: boolean = false): double;
   class function WriteRegisterBool(Root: HKey; const Key, Item: string; const Value: boolean): boolean;
   class function WriteRegisterInt(Root: HKey; const Key, Item: string; const Value: integer): boolean;
   class function WriteRegisterStr(Root: HKey; const Key, Item, Value: string): boolean;
   class function WriteRegisterDouble(Root: HKey; const Key, Item: string; const Value: double): boolean;
  end;


implementation

uses UStringFunctions, SysUtils;

{ TRegFunctions }

class function TRegFunctions.DelRegisterItem(Root: HKey; const Key,
  Item: string): boolean;
var
  Registry: TRegistry;
begin
  Registry := nil;
  OpenRegistry(Registry, Root, Key, False, False);

  Result := Registry.DeleteValue(Item);
end;

class function TRegFunctions.ItemExists(Root: HKEY; const Key,
  Item: string): boolean;
var
  Registry: TRegistry;
begin
  Registry := nil;

  try
   OpenRegistry(Registry, Root, Key, False);

   Result := Registry.ValueExists(Item);

   Registry.CloseKey;

   FreeAndNil(Registry);
  except
   on E:Exception do
    begin
     Result := False;
     if Assigned(Registry) then
      FreeAndNil(Registry);
    end;
  end;
end;

class procedure TRegFunctions.OpenRegistry(var Registry: TRegistry;
  Root: HKey; const Key: string; const CanCreate: boolean; const ReadOnly: boolean);
begin
  if not Assigned(Registry) then
   Registry := TRegistry.Create;

  Registry.RootKey := Root;

  if ReadOnly then
   Registry.OpenKeyReadOnly(Key)
  else Registry.OpenKey(Key, CanCreate);
end;

class function TRegFunctions.ReadRegisterBool(Root: HKEY; const Key,
  Item: string; const DefaultReturn, CanCreate: boolean): boolean;
var
  Registry: TRegistry;
begin
  Registry := nil;

  try
   OpenRegistry(Registry, Root, Key, CanCreate);
   Result := Registry.ReadBool(Item);

   Registry.CloseKey;

   FreeAndNil(Registry);
  except
   Result := DefaultReturn;
   if Assigned(Registry) then
    FreeAndNil(Registry);
  end;
end;

class function TRegFunctions.ReadRegisterDouble(Root: HKEY; const Key,
  Item: string; const DefaultReturn: double;
  const CanCreate: boolean): double;
var
  Registry: TRegistry;
begin
  Registry := nil;

  try
   OpenRegistry(Registry, Root, Key, CanCreate);
   Result := Registry.ReadFloat(Item);

   Registry.CloseKey;

   FreeAndNil(Registry);
  except
   Result := DefaultReturn;
   if Assigned(Registry) then
    FreeAndNil(Registry);
  end;

end;

class function TRegFunctions.ReadRegisterInt(Root: HKEY; const Key,
  Item: string; const DefaultReturn: integer;
  const CanCreate: boolean): integer;
var
  Registry: TRegistry;
begin
  Registry := nil;

  try
   OpenRegistry(Registry, Root, Key, CanCreate);
   Result := Registry.ReadInteger(Item);

   Registry.CloseKey;

   FreeAndNil(Registry);
  except
   Result := DefaultReturn;
   if Assigned(Registry) then
    FreeAndNil(Registry);
  end;
end;

class function TRegFunctions.ReadRegisterStr(Root: HKey; const Key, Item: string;
  const DefaultReturn: string; const CanCreate: Boolean): string;
var
  Registry: TRegistry;
begin
  Registry := nil;

  try
   OpenRegistry(Registry, Root, Key, CanCreate);
   Result := Registry.ReadString(Item);

   Registry.CloseKey;

   FreeAndNil(Registry);
  except
   on E:Exception do
    begin
     Result := '';
     if Assigned(Registry) then
      FreeAndNil(Registry);
    end;
  end;

  if TStringFunctions.IsEmpty(Result) then
   Result := DefaultReturn;
end;

class function TRegFunctions.WriteRegisterBool(Root: HKey; const Key,
  Item: string; const Value: boolean): boolean;
var
  Registry: TRegistry;
begin
  Registry := nil;

  try
   OpenRegistry(Registry, Root, Key, True, False);

   Registry.WriteBool(Item, Value);
   Registry.CloseKey;

   FreeAndNil(Registry);

   Result := True;
  except
   Result := False;

   if Assigned(Registry) then
    FreeAndNil(Registry);
  end;
end;

class function TRegFunctions.WriteRegisterDouble(Root: HKey; const Key,
  Item: string; const Value: double): boolean;
var
  Registry: TRegistry;
begin
  Registry := nil;

  try
   OpenRegistry(Registry, Root, Key, False, False);

   Registry.WriteFloat(Item, Value);
   Registry.CloseKey;

   FreeAndNil(Registry);

   Result := True;
  except
   Result := False;

   if Assigned(Registry) then
    FreeAndNil(Registry);
  end;

end;

class function TRegFunctions.WriteRegisterInt(Root: HKey; const Key,
  Item: string; const Value: integer): boolean;
var
  Registry: TRegistry;
begin
  Registry := nil;

  try
   OpenRegistry(Registry, Root, Key, True, False);

   Registry.WriteInteger(Item, Value);
   Registry.CloseKey;

   FreeAndNil(Registry);

   Result := True;
  except
   Result := False;

   if Assigned(Registry) then
    FreeAndNil(Registry);
  end;
end;

class function TRegFunctions.WriteRegisterStr(Root: HKey; const Key, Item,
  Value: string): boolean;
var
  Registry: TRegistry;
begin
  Registry := nil;

  try
   OpenRegistry(Registry, Root, Key, True, False);

   Registry.WriteString(Item, Value);
   Registry.CloseKey;

   FreeAndNil(Registry);

   Result := True;
  except
   on E:Exception do
    begin
     Result := False;

     if Assigned(Registry) then
      FreeAndNil(Registry);
    end;
  end;
end;

end.
