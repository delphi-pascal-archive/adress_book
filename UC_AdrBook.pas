unit UC_AdrBook;

interface

uses Classes, SysUtils;

const

  NamLength = 20;   FullNameL = 65;
  TelLength = 20;
  AdrLength = 60;   PlcLength = 20;   ComLength = 255;
  Line = '***---***---(***)---***---***';

type

  NamString = string[NamLength];  FullNameS = string[FullNameL];
  CusString = string[ComLength];  TelString = string[TelLength];
  AdrString = string[AdrLength];  
  PlcString = string[PlcLength];  ComString = string[ComLength];
  GrpType = 0..8;                 GrpArr    = array [0..8] of Boolean;
  TUC_Date = record
    Day   : 1..31;
    Month : 1..12;
    Year  : 1000..2300;
  end;{TDate = record}
  TUC_Time = record
    Hour : 0..23;
    Minute : 0..59;
  end;{TUC_Time}
  TArr = array of Integer;

  PPerson = ^TPerson;
  TPerson = record
    Name, PatrName, Surname        : NamString;
    HomeTel, WorkTel, MobiTel, ICQ : TelString;
    Group                          : GrpType;
    EMail, HomeAdr, WorkAdr, Web   : AdrString;
    Country, City                  : PlcString;
    BirthDay                       : TUC_Date;
    Comments                       : ComString;
    Prev, Next                     : PPerson;
  end;{TPerson = record}

  TPeople = class
    FFirst : PPerson;
    constructor Create;
    destructor Destroy; override;
    procedure Clear;

    function Add (const Name, PatrName, Surname        : NamString;
                  const HomeTel, WorkTel, MobiTel, ICQ : TelString;
                  const Group                          : GrpType;
                  const EMail, HomeAdr, WorkAdr, Web   : AdrString;
                  const Country, City                  : PlcString;
                  const BirthDay                       : TUC_Date;
                  const Comments                       : ComString) : Boolean;
    function ReadFromFile (const F : TextFile) : Boolean;
    function SaveToFile   (const F : TextFile) : Boolean;
    function GetSize : Integer;
    function Delete (const p : pointer) : Boolean;
    function GetItem (const p           : pointer;
                      var   Name, PatrName, Surname        : NamString;
                      var   HomeTel, WorkTel, MobiTel, ICQ : TelString;
                      var   Group                          : GrpType;
                      var   EMail, HomeAdr, WorkAdr, Web   : AdrString;
                      var   Country, City                  : PlcString;
                      var   BirthDay                       : TUC_Date;
                      var   Comments                       : ComString) : Boolean;
    function Modify (const p           : pointer;
                     const Name, PatrName, Surname        : NamString;
                     const HomeTel, WorkTel, MobiTel, ICQ : TelString;
                     const Group                          : GrpType;
                     const EMail, HomeAdr, WorkAdr, Web   : AdrString;
                     const Country, City                  : PlcString;
                     const BirthDay                       : TUC_Date;
                     const Comments                       : ComString) : Boolean;
    function FillTStrings : TStrings;
    function FindItem (FullName : string)      : pointer;
    function FillItemsByGroup(Groups : GrpArr) : TStrings;

    property Count : Integer read GetSize;
  end;{TPeople = class}

  procedure FillGroupArr;
  procedure CutNSP (str : string; var Name, Surname, PatrName : NamString);
  procedure Zodiac (Date: TUC_Date; var Month, Year : string);
  function UC_StrToDate     (str : string) : TUC_Date;
  function UC_DateToStr     (Date : TUC_Date) : string;
  function UC_StrToTime     (str : string) : TUC_Time;
  function UC_TimeToStr     (Time : TUC_Time) : string;
  function LeadZero         (w : Word; Count : Byte = 1) : string;

var
  GroupArr : array [0..8] of string[20];
  FAdr     : TextFile;
  FAdrWay  : string;
  
implementation

constructor TPeople.Create;
begin
  inherited;
  if FFirst <> nil then Clear;
  FFirst := nil;
end;{constructor TPeople.Create}

destructor TPeople.Destroy;
begin
  if FFirst <> nil then Clear;
end;{destructor TPeople.Destroy}

procedure TPeople.Clear;
var
  Item : PPerson;
begin
  while FFirst <> nil do begin
    Item   := FFirst;
    FFirst := FFirst.Next;
    Dispose (Item);
  end;{while FFirst <> nil}
end;{procedure TPeople.Clear}

function TPeople.Add (const Name, PatrName, Surname        : NamString;
                      const HomeTel, WorkTel, MobiTel, ICQ : TelString;
                      const Group                          : GrpType;
                      const EMail, HomeAdr, WorkAdr, Web   : AdrString;
                      const Country, City                  : PlcString;
                      const BirthDay                       : TUC_Date;
                      const Comments                       : ComString) : Boolean;
var
  Item : PPerson;
begin
  Result := True;
  try
    New(Item);
    Item.Name     := Name;
    Item.PatrName := PatrName;
    Item.Surname  := Surname;
    Item.HomeTel  := HomeTel;
    Item.WorkTel  := WorkTel;
    Item.MobiTel  := MobiTel;
    Item.ICQ      := ICQ;
    Item.Group    := Group;
    Item.EMail    := EMail;
    Item.HomeAdr  := HomeAdr;
    Item.WorkAdr  := WorkAdr;
    Item.Web      := Web;
    Item.Country  := Country;
    Item.City     := City;
    Item.BirthDay := BirthDay;
    Item.Comments := Comments;
    Item.Prev     := nil;
    if Count > 1 then FFirst.Next.Prev := FFirst;
    Item.Next := FFirst;
    FFirst := Item;
  except
    Result := False;
  end;{try except}
end;{function TPeople.Add}

function TPeople.ReadFromFile (const F : TextFile) : Boolean;
var
  Name, PatrName, Surname        : NamString;
  HomeTel, WorkTel, MobiTel, ICQ : TelString;
  Group                          : GrpType;
  EMail, HomeAdr, WorkAdr, Web   : AdrString;
  Country, City                  : PlcString;
  Birth                          : string;
  Comments                       : ComString;
  I                              : Integer;
begin
  Result := True;
  try
    for I := 0 to 5 do Readln(F, GroupArr[i]);
    Readln(F);
    while not Eof(F) do begin
      Readln(F, Name);
      Readln(F, PatrName);
      Readln(F, Surname);
      Readln(F, HomeTel);
      Readln(F, WorkTel);
      Readln(F, MobiTel);
      Readln(F, ICQ);
      Readln(F, Group);
      Readln(F, EMail);
      Readln(F, HomeAdr);
      Readln(F, WorkAdr);
      Readln(F, Web);
      Readln(F, Country);
      Readln(F, City);
      Readln(F, Birth);
      Readln(F, Comments);
      Readln(F);
      Add(Name, PatrName, Surname, HomeTel, WorkTel, MobiTel, ICQ, Group, EMail,
          HomeAdr, WorkAdr, Web, Country, City, UC_StrToDate(Birth), Comments)
    end;{while not Eof(F)}
  except
    Result := False;
  end;{try except}
end;{function TPeople.ReadFromFile}

function TPeople.SaveToFile   (const F : TextFile) : Boolean;
var
  Item : PPerson;
  I    : Integer;
begin
  Result := True;
  try
    for I := 0 to 5 do Writeln(F, GroupArr[i]);
    Writeln(F);
    Item := FFirst;
    while Item <> nil do begin
      Writeln(F, Item.Name);
      Writeln(F, Item.PatrName);
      Writeln(F, Item.Surname);
      Writeln(F, Item.HomeTel);
      Writeln(F, Item.WorkTel);
      Writeln(F, Item.MobiTel);
      Writeln(F, Item.ICQ);
      Writeln(F, IntToStr(Item.Group));
      Writeln(F, Item.EMail);
      Writeln(F, Item.HomeAdr);
      Writeln(F, Item.WorkAdr);
      Writeln(F, Item.Web);
      Writeln(F, Item.Country);
      Writeln(F, Item.City);
      Writeln(F, UC_DateToStr(Item.BirthDay));
      Writeln(F, Item.Comments);
      Writeln(F, Line);
      Item := Item^.Next;
    end;{while Item<>nil}
  except
    Result := False;
  end;{try except}
end;{function TPeople.SaveToFile}

function TPeople.GetSize : Integer;
var
  Count : Integer;
  Item  : PPerson;
begin
  Count := 0;
  Item  := FFirst;
  if Item <> nil then begin
    while Item <> nil do begin
      Inc(Count);
      Item := Item.Next;
    end;{while Item <> nil}
  end;{if Item <> nil}
  Result := Count;
end;{function TPeople.GetSize}

function TPeople.Delete (const p : pointer) : Boolean;
var
  Item, Prev, Next : PPerson;
begin
  if p <> nil then begin
    Item := p;
    Prev := Item.Prev;
    Next := Item.Next;
    Dispose (Item);
    if Prev <> nil then begin
      Item      := Prev;
      Item.Next := Next;
    end else FFirst := Next;
    if Next <> nil then begin
      Item      := Next;
      Item.Prev := Prev;
    end;{if Next <> nil}
    if FFirst = nil then begin
      Clear;
      Create;
    end;{if FFirst <> nil}
    Result := True;
  end else Result := False;
end;{function TPeople.Delete}

function TPeople.GetItem (const p           : pointer;
                          var   Name, PatrName, Surname        : NamString;
                          var   HomeTel, WorkTel, MobiTel, ICQ : TelString;
                          var   Group                          : GrpType;
                          var   EMail, HomeAdr, WorkAdr, Web   : AdrString;
                          var   Country, City                  : PlcString;
                          var   BirthDay                       : TUC_Date;
                          var   Comments                       : ComString) : Boolean;
var
  Item : PPerson;
begin
  Item := p;
  if Item <> nil then begin
    Name     := Item.Name;
    PatrName := Item.PatrName;
    Surname  := Item.Surname;
    HomeTel  := Item.HomeTel;
    WorkTel  := Item.WorkTel;
    MobiTel  := Item.MobiTel;
    ICQ      := Item.ICQ;
    Group    := Item.Group;
    EMail    := Item.EMail;
    HomeAdr  := Item.HomeAdr;
    WorkAdr  := Item.WorkAdr;
    Web      := Item.Web;
    Country  := Item.Country;
    City     := Item.City;
    BirthDay := Item.BirthDay;
    Comments := Item.Comments;
    Result   := True;
  end else Result := False;
end;{function TPeople.GetItem}

function TPeople.Modify (const p           : pointer;
                         const Name, PatrName, Surname        : NamString;
                         const HomeTel, WorkTel, MobiTel, ICQ : TelString;
                         const Group                          : GrpType;
                         const EMail, HomeAdr, WorkAdr, Web   : AdrString;
                         const Country, City                  : PlcString;
                         const BirthDay                       : TUC_Date;
                         const Comments                       : ComString) : Boolean;
var
  Item : PPerson;
begin
  Item := p;
  if Item <> nil then begin
    Item.Name     := Name;
    Item.PatrName := PatrName;
    Item.Surname  := Surname;
    Item.HomeTel  := HomeTel;
    Item.WorkTel  := WorkTel;
    Item.MobiTel  := MobiTel;
    Item.ICQ      := ICQ;
    Item.Group    := Group;
    Item.EMail    := EMail;
    Item.HomeAdr  := HomeAdr;
    Item.WorkAdr  := WorkAdr;
    Item.Web      := Web;
    Item.Country  := Country;
    Item.City     := City;
    Item.BirthDay := BirthDay;
    Item.Comments := Comments;
    Result        := True;
  end else Result := False;
end;{function TPeople.Modify}

function TPeople.FillTStrings : TStrings;
var
  Item  : PPerson;
  Lines : TStrings;
begin
  Item  := FFirst;
  Lines := TStringList.Create;
  while Item <> nil do begin
    Lines.Add(Item.Surname +', '+ Item.Name +' '+ Item.PatrName);
    Item := Item.Next;
  end;{while Item <> nil}
  Result := Lines;
end;{function TPeople.FillTStrings}

function TPeople.FindItem (FullName : string) : pointer;
var
  p, Item : PPerson;
  Name, SurName, PatrName : NamString;
  bN, bS, bP : Boolean;
begin
  CutNSP(FullName, Name, SurName, PatrName);
  Item := FFirst;
  p    := nil;
  while (Item <> nil) and (p = nil) do begin
    if Name     = Item.Name     then bN := True else bN := False;
    if Surname  = Item.Surname  then bS := True else bS := False;
    if PatrName = Item.PatrName then bP := True else bP := False;
    if (bN = True) and (bS = True) and (bP = True) then p := Item else Item := Item.Next;
  end;{while Item^<>nil}
  Result := p;
end;{function TPeople.FindItem}

function TPeople.FillItemsByGroup(Groups : GrpArr) : TStrings;
var
  Item  : PPerson;
  Lines : TStrings;
  I     : Integer;
begin
  Item  := FFirst;
  Lines := TStringList.Create;
  while Item <> nil do begin
    for I := 0 to 8 do begin
      if Groups[I] = True then if I = Item.Group then begin
        Lines.Add(Item.Surname +', '+ Item.Name +' '+ Item.PatrName);
        Break;
      end;
    end;
    Item := Item.Next;
  end;{while Item <> nil}
  Result := Lines;
end;{function TPeople.FillItemsByGroup}

{ **********************************************************************}

procedure FillGroupArr;
begin
  GroupArr[0] := 'Группа №1';
  GroupArr[1] := 'Группа №2';
  GroupArr[2] := 'Группа №3';
  GroupArr[3] := 'Группа №4';
  GroupArr[4] := 'Группа №5';
  GroupArr[5] := 'Группа №6';
  GroupArr[6] := 'Личная информация';
  GroupArr[7] := 'Другие';
  GroupArr[8] := 'Без группы';
end;{procedure FillGroupArr}

procedure CutNSP (str : string; var Name, Surname, PatrName : NamString);
var
  k : Integer;
begin
  k := Pos(', ', str);
  PatrName := '';
  Surname  := Copy(str, 1, k-1);
  str := Copy(str, k+2, Length(str));
  k := Pos(' ', str);
  if k = Length(str) then Name := Copy(str, 1, k-1) else begin
    Name     := Copy(str, 1, k-1);
    PatrName := Copy(str, k+1, Length(str));
  end;
end;{procedure CutNSP}

procedure Zodiac (Date: TUC_Date; var Month, Year : string);
var
  k : Integer;
begin
  case Date.Month of
    1 : if Date.Day >= 20 then Month:='Aquarius'    else Month:='Capricornio';
    2 : if Date.Day >= 19 then Month:='Piscis'      else Month:='Aquarius';
    3 : if Date.Day >= 21 then Month:='Aries'       else Month:='Piscis';
    4 : if Date.Day >= 20 then Month:='Tauro'       else Month:='Aries';
    5 : if Date.Day >= 21 then Month:='Geminis'     else Month:='Tauro';
    6 : if Date.Day >= 22 then Month:='Cancer'      else Month:='Geminis';
    7 : if Date.Day >= 23 then Month:='Leo'         else Month:='Cancer';
    8 : if Date.Day >= 23 then Month:='Virgo'       else Month:='Leo';
    9 : if Date.Day >= 23 then Month:='Libra'       else Month:='Virgo';
    10: if Date.Day >= 23 then Month:='Scorpio'     else Month:='Libra';
    11: if Date.Day >= 23 then Month:='Sagitario'   else Month:='Scorpio';
    12: if Date.Day >= 22 then Month:='Capricornio' else Month:='Sagitario';
  end;
  k := Date.Year mod 12;
  case k of
    0 : Year := 'Обезьяна';
    1 : Year := 'Петух';
    2 : Year := 'Собака';
    3 : Year := 'Свинья';
    4 : Year := 'Крыса';
    5 : Year := 'Бык';
    6 : Year := 'Тигр';
    7 : Year := 'Кот';
    8 : Year := 'Дракон';
    9 : Year := 'Змея';
    10: Year := 'лошадь';
    11: Year := 'Коза';
  end;
end;{procedure Zodiac}

function UC_StrToDate(str : string) : TUC_Date;
var
  Date    : TUC_Date;
  ValCode : Integer;
begin
  Val(Copy(str,1,2),Date.Day,ValCode);
  Val(Copy(str,4,2),Date.Month,ValCode);
  Val(Copy(str,7,4),Date.Year,ValCode);
  Result:=Date;
end;{function UC_StrToDate}

function UC_DateToStr(Date : TUC_Date) : string;
begin
  Result := LeadZero(Date.Day,2)+'.'+LeadZero(Date.Month,2)+'.'+LeadZero(Date.Year,4);
end;{function UC_DateToStr}

function UC_StrToTime(str : string) : TUC_Time;
var
  Time    : TUC_Time;
  ValCode : Integer;
begin
  Val(Copy(str,1,2),Time.Hour,ValCode);
  Val(Copy(str,4,2),Time.Minute,ValCode);
  Result:=Time;
end;{function UC_StrToTime}

function UC_TimeToStr(Time : TUC_Time) : string;
begin
  Result := LeadZero(Time.Hour,2)+':'+LeadZero(Time.Minute,2);
end;{function UC_TimeToStr}

function LeadZero(w : Word; Count : Byte = 1) : string;
var
  s : string;
begin
  Str(w,s);
  while Count>Length(s) do s:='0'+s;
  Result:=s;
end;{function LeadZero}

begin
  FillGroupArr;

end.
