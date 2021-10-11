unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, CheckLst, Buttons, Mask, Menus, UC_AdrBook;

type
  TMainForm = class(TForm)
    StatusBar: TStatusBar;
    SpeedBarBottom: TPanel;
    btAdd: TButton;
    btModify: TButton;
    btClear: TButton;
    btDelete: TButton;
    btExit: TButton;
    AdrPanel: TPanel;
    lbGroup: TLabel;
    lbBirth: TLabel;
    lbComment: TLabel;
    lbMonth: TLabel;
    lbYear: TLabel;
    edSurname: TLabeledEdit;
    edName: TLabeledEdit;
    edPatrName: TLabeledEdit;
    edHomeTel: TLabeledEdit;
    edHomeAdr: TLabeledEdit;
    edWorkTel: TLabeledEdit;
    edWorkAdr: TLabeledEdit;
    edMobiTel: TLabeledEdit;
    edGroup: TComboBox;
    edCity: TLabeledEdit;
    edCountry: TLabeledEdit;
    edBirth: TMaskEdit;
    edComment: TMemo;
    edEMail: TLabeledEdit;
    edICQ: TLabeledEdit;
    edWeb: TLabeledEdit;
    AdressList: TListBox;
    SpeedBarTopAdr: TPanel;
    Cancel: TSpeedButton;
    OK: TSpeedButton;
    edGroupArr: TComboBox;
    GroupsBox: TCheckListBox;
    AdrSplitter: TSplitter;
    MainMenu: TMainMenu;
    FileMenu: TMenuItem;
    FileNew: TMenuItem;
    FileOpen: TMenuItem;
    FileSave: TMenuItem;
    FileSaveAs: TMenuItem;
    N1: TMenuItem;
    FileExit: TMenuItem;
    BaseMenu: TMenuItem;
    Add1: TMenuItem;
    Modify1: TMenuItem;
    ClearFields1: TMenuItem;
    Delete1: TMenuItem;
    Find1: TMenuItem;
    HelpMenu: TMenuItem;
    HelpAbout: TMenuItem;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    N2: TMenuItem;
    SortAdr: TMenuItem;
    procedure FileExitClick(Sender: TObject);
    procedure btAddClick(Sender: TObject);
    procedure AdressListClick(Sender: TObject);
    procedure FileOpenClick(Sender: TObject);
    procedure FileNewClick(Sender: TObject);
    procedure FileSaveClick(Sender: TObject);
    procedure FileSaveAsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btClearClick(Sender: TObject);
    procedure OKClick(Sender: TObject);
    procedure SortAdrClick(Sender: TObject);
    procedure btDeleteClick(Sender: TObject);
    procedure btModifyClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure GroupsBoxClick(Sender: TObject);
    procedure HelpAboutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    AdressBook : TPeople;
    procedure UpdateCountBase;
  end;

var
  MainForm: TMainForm;

implementation

uses About;

{$R *.dfm}

procedure TMainForm.FileExitClick(Sender: TObject);
begin
  Close;
end;{procedure TMainForm.FileExitClick}

procedure TMainForm.btAddClick(Sender: TObject);
begin
  AdressBook.Add(edName.Text, edPatrName.Text, edSurname.Text,
         edHomeTel.Text, edWorkTel.Text, edMobiTel.Text, edICQ.Text,
         edGroup.ItemIndex, edEMail.Text, edHomeAdr.Text, edWorkAdr.Text, edWeb.Text,
         edCountry.Text, edCity.Text ,UC_StrToDate(edBirth.Text),edComment.Text);
       AdressList.Items.Add(edSurname.Text+', '+edName.Text+' '+edPatrName.Text);
  UpdateCountBase;
end;{procedure TMainForm.btAddClick}

procedure TMainForm.AdressListClick(Sender: TObject);
var
  Name, PatrName, Surname            : NamString;
  HomeTel, WorkTel, MobiTel, ICQ     : TelString;
  Group                              : GrpType;
  EMail, HomeAdress, WorkAdress, Web : AdrString;
  Country, City                      : PlcString;
  BirthDay                           : TUC_Date;
  Comments                           : CusString;
  k : Integer;
  p : pointer;
  Year, Month : string;
begin
  k := AdressList.ItemIndex;
  if (k >= 0) and (AdressList.Items.Count > 0) then begin
    p := AdressBook.FindItem(AdressList.Items.Strings[k]);
    if p <> nil then AdressBook.GetItem(p, Name, PatrName, Surname,
      HomeTel, WorkTel, MobiTel, ICQ, Group, EMail, HomeAdress,WorkAdress, Web,
      Country, City, BirthDay, Comments);
    edName.Text       := Name;
    edPatrName.Text   := PatrName;
    edSurname.Text    := Surname;
    edHomeTel.Text    := HomeTel;
    edWorkTel.Text    := WorkTel;
    edMobiTel.Text    := MobiTel;
    edICQ.Text        := ICQ;
    edGroup.ItemIndex := Group;
    edHomeAdr.Text    := HomeAdress;
    edWorkAdr.Text    := WorkAdress;
    edWeb.Text        := Web;
    edEMail.Text      := EMail;
    edCountry.Text    := Country;
    edCity.Text       := City;
    edBirth.Text      := UC_DateToStr(BirthDay);
    edComment.Text    := Comments;
    if (Birthday.Day = 1) and (Birthday.Month = 1) and (Birthday.Year = 1000) then begin
      lbYear.Caption  := 'Год по китайскому гороскопу: ?';
      lbMonth.Caption := 'Знак зодиака: ?';
    end else begin
      Zodiac(BirthDay, Month, Year);
      lbYear.Caption  := 'Год по китайскому гороскопу: ' + Year;
      lbMonth.Caption := 'Знак зодиака: ' + Month;
    end;
  end;{if (AdressListBox.ItemIndex>=0) and (AdressListBox.Items.Count>0)}
end;{procedure TMainForm.AdressListBoxClick}

procedure TMainForm.FileOpenClick(Sender: TObject);
begin
  if OpenDialog.Execute then begin
    case OpenDialog.FilterIndex of
    1: begin
         FAdrWay := OpenDialog.FileName;
         AssignFile(FAdr, FAdrWay);
         Reset(FAdr);
         AdressBook.Clear;
         AdressList.Items.Clear;
         AdressBook.ReadFromFile(FAdr);
         AdressList.Items := AdressBook.FillTStrings;
         OKClick(FileOpen);
         CloseFile(FAdr);
       end;
    end;{case OpenDialog.FilterIndex}
  end;{if OpenDialog.Execute}
  UpdateCountBase;
end;{procedure TMainForm.FileOpenClick}

procedure TMainForm.FileNewClick(Sender: TObject);
var
  I : Integer;
begin
  AdressList.Items.Clear;
  AdressBook.Clear;
  for I := 0 to 8 do GroupsBox.Checked[I] := True;
  btClearClick(nil);
  OKClick(nil);
  FAdrWay := '';
  UpdateCountBase;
end;{procedure TMainForm.FileNewClick}

procedure TMainForm.FileSaveClick(Sender: TObject);
begin
  if FAdrWay <> '' then begin
    AssignFile(FAdr, FAdrWay);
    Rewrite(FAdr);
    AdressBook.SaveToFile(FAdr);
    CloseFile(FAdr);
    AdressList.SetFocus;
  end else FileSaveAsClick(nil);
  UpdateCountBase;
end;{procedure TMainForm.FileSaveClick}

procedure TMainForm.FileSaveAsClick(Sender: TObject);
begin
  if SaveDialog.Execute then begin
    case SaveDialog.FilterIndex of
    1 : begin
          FAdrWay := SaveDialog.FileName;
          if Copy(FAdrWay,Length(FAdrWay)-3,1)<>'.' then FAdrWay:=FAdrWay+'.adb';
        end;
    end;{case SaveDialog.FilterIndex}
  end;{if SaveDialog.Execute}
  FileSaveClick(nil);
end;{procedure TMainForm.FileSaveAsClick}

procedure TMainForm.FormCreate(Sender: TObject);
var
  I : Integer;
begin
  AdressBook := TPeople.Create;
  UpdateCountBase;
  OKClick(nil);
  btClearClick(nil);
  for I := 0 to 8 do GroupsBox.Checked[I] := True;
end;{procedure TMainForm.FormCreate}

procedure TMainForm.btClearClick(Sender: TObject);
begin
  edName.Text:='';
  edPatrName.Text:='';
  edSurname.Text:='';
  edHomeTel.Text:='';
  edWorkTel.Text:='';
  edMobiTel.Text:='';
  edHomeAdr.Text:='';
  edWorkAdr.Text:='';
  edGroup.ItemIndex:=8;
  edEMail.Text:='';
  edComment.Text:='';
  edBirth.Text:='01.01.1000';
  edCity.Text:='';
  edCountry.Text:='';
  UpdateCountBase;
end;{procedure TMainForm.btClearClick}

procedure TMainForm.OKClick(Sender: TObject);
var
  I : Byte;
begin
  if Sender <> FileOpen then
    for I := 0 to 5 do GroupArr[I] := edGroupArr.Items.Strings[I];
  for I := 0 to 8 do begin
    GroupsBox.Items.Strings[I] := GroupArr[I];
    edGroup.Items.Strings[I]   := GroupArr[I];
  end;{for I := 0 to 8}
end;{procedure TMainForm.OKClick}

procedure TMainForm.SortAdrClick(Sender: TObject);
begin
  SortAdr.Checked := not SortAdr.Checked;
  AdressList.Sorted := SortAdr.Checked;
end;{procedure TMainForm.SortClick}

procedure TMainForm.btDeleteClick(Sender: TObject);
var
  Ind : Integer;
begin
  Ind := AdressList.ItemIndex;
  if (AdressList.Items.Count>0) and (Ind>=0) then begin
    if AdressBook.Delete(AdressBook.FindItem(AdressList.Items.Strings[Ind]))
      then AdressList.Items.Delete(Ind);
    if Ind = 0 then AdressList.ItemIndex := 0 else AdressList.ItemIndex := Ind-1;
  end;{if (AdressList.Items.Count>0) and (Ind>=0)}
  AdressList.SetFocus;
  UpdateCountBase;
end;{procedure TMainForm.btDeleteClick}

procedure TMainForm.UpdateCountBase;
begin
  StatusBar.Panels.Items[0].Text := 'Count in base: ' + IntToStr(AdressBook.Count) +
    ', count in list: ' + IntToStr(AdressList.Items.Count);
end;{procedure TMainForm.UpdateCountBase}

procedure TMainForm.btModifyClick(Sender: TObject);
var
  k : Integer;
begin
  k := AdressList.ItemIndex;
  if (AdressList.Items.Count > k) and (k >= 0) then begin
    AdressBook.Modify(AdressBook.FindItem(AdressList.Items.Strings[k]),
      edName.Text, edPatrName.Text, edSurname.Text, edHomeTel.Text,
      edWorkTel.Text, edMobiTel.Text, edICQ.Text, edGroup.ItemIndex,
      edEMail.Text, edHomeAdr.Text, edWorkAdr.Text, edWeb.Text, edCountry.Text,
      edCity.Text, UC_StrToDate(edBirth.Text), edComment.Text);
    AdressList.Items.Strings[k] := edSurname.Text+', '+edName.Text+' '+edPatrName.Text;
  end;
  UpdateCountBase;
end;{procedure TMainForm.btModifyClick}

procedure TMainForm.FormResize(Sender: TObject);
var
  I : Integer;
begin
  I := Trunc(SpeedBarBottom.Width/5);
  btAdd.Left    := 1;          btAdd.Width    := I;
  btModify.Left := I;          btModify.Width := I;
  btClear.Left  := I*2;        btClear.Width  := I;
  btDelete.Left := I*3;        btDelete.Width := I;
  btExit.Left   := I*4;        btExit.Width   := I;
end;{procedure TMainForm.FormResize}

procedure TMainForm.GroupsBoxClick(Sender: TObject);
var
  I : Integer;
  Grp : GrpArr;
begin
  AdressList.Items.Clear;
  for I := 0 to 8 do Grp[I] := GroupsBox.Checked[I];
  AdressList.Items := AdressBook.FillItemsByGroup(Grp);
  UpdateCountBase;
  AdressList.SetFocus;
end;{procedure TMainForm.GroupsBoxClick}

procedure TMainForm.HelpAboutClick(Sender: TObject);
begin
  AboutBox.Show;
end;

end.
