{ ==============================================
  | Name : 383                                   |
  ===============================================
  { ******************************************** }
{ Written By WalWalWalides }
{ CopyRight © 2018 }
{ Email : WalWalWalides@gmail.com }
{ WebSite : }
{ ******************************************** }

unit AddUser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics, System.Sysutils, Vcl.themes,
  Vcl.Controls, Vcl.Forms, UnitSemaphoreForm, Vcl.comctrls, Vcl.Dialogs, Vcl.ExtCtrls, RzPanel, Vcl.StdCtrls, System.Win.TaskbarCore, Vcl.Taskbar, RzLabel,
  LogUser, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  cxTextEdit, cxLabel, cxGroupBox, LMDBaseControl, LMDBaseGraphicControl, LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton, dxGDIPlusClasses, cxImage,
  RzStatus, System.ImageList,
  Vcl.ImgList, cxImageList, LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDCustomParentPanel, LMDCustomPanelFill, LMDStaticText,
  JSDialog, Vcl.Menus, cxButtons;

const
  SEMAPHORE_ALL_ACESS = EVENT_ALL_ACCESS;
  IDI_ICON2 = 102;
  Welcome_DLL = 'Set383\WlKSet.dll';

type
  TThreadPB = class(TThread)
  private
    FName: string;
    it: integer;
  protected
    procedure Execute; override;
  public
    progressbar: TProgressBar;
    class function confirmaddUser: Boolean; static;
    constructor Create(suspend: Boolean; Name: string);
    function edtUsercheeck: Boolean;

  end;

type
  TfrmAddUser = class(TForm)
    cxGroupBox1: TcxGroupBox;
    pnlMainAddUser: TRzPanel;
    imgClose: TcxImage;
    ilstAdduser: TcxImageList;
    cxGroupBox2: TcxGroupBox;
    pnladdUser: TRzPanel;
    imgadduser: TImage;
    LMDStaticText2: TLMDStaticText;
    lblUser: TcxLabel;
    lblPassword: TcxLabel;
    cxLabel1: TcxLabel;
    stbrLogin: TRzStatusBar;
    stbrText: TRzStatusPane;
    EditError: TEdit;
    DialogComfirm: TJSDialog;
    btnDisUser: TcxButton;
    edtPassword: TEdit;
    edtSecPassword: TEdit;
    edtUser: TEdit;

    procedure imgadduserClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    // procedure OnAfterResize(var Msg: TMessage); message WM_EXITSIZEMOVE;
    procedure imgCloseClick(Sender: TObject);
    procedure imgadduserMouseEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pnladdUserMouseLeave(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DialogComfirmGetControlClass(Sender: TObject; ControlType: TControlType; var ControlClass: TControlClass);
    procedure DialogComfirmInitControl(Sender: TObject; ControlType: TControlType; Control: TControl; ControlItem: TCollectionItem; var Handled: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure DialogComfirmTimer(Sender: TObject; const TimeSince: Cardinal);
    procedure btnDisUserClick(Sender: TObject);
    procedure pnlMainAddUserMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure pnlMainAddUserMouseEnter(Sender: TObject);
    procedure edtPasswordChange(Sender: TObject);
    procedure edtSecPasswordChange(Sender: TObject);
    procedure edtUserChange(Sender: TObject);

  private
    activeControl: TWinControl;
    prevInactiveColor: TColor;
    BoolUserExist: Boolean;
    BoolSamePass: Boolean;
    BoolMissing: Boolean;
    procedure ScreenOnActiveControlChange(Sender: TObject);

    // procedure WMGetMinMaxInfo(var AMsg: TWMGetMinMaxInfo); message WM_GETMINMAXINFO;

  protected
    // procedure sizemove(var Msg: TWMSIZE); message WM_SIZE;
    procedure WMWindowPosChanging(var Msg: TWMWindowPosChanging); message WM_WINDOWPOSCHANGING;
  public
    function Excutedialog: Boolean;
    { Public-Deklarationen }
  end;

function frmAddUser: TfrmAddUser;
function ShowDLLWelcome383(SUsername: string): integer; stdcall; external Welcome_DLL name 'ShowDLLWelcome383';
procedure CloseDLLWelcome383; stdcall; external Welcome_DLL name 'CloseDLLWelcome383';

var
  fSemaphore: THandle;
  Thread_1: TThreadPB;
  Thread_2: TThreadPB;
  Privatform: TfrmAddUser;

  boolAddedNewUser: Boolean = false;
  boolerror: Boolean = false;
  FCount: integer;

implementation

{$R *.dfm}

uses MD1, ToolLib, System.TypInfo, Main, Winapi.ShellAPI, ViewDataUser, Vcl.Styles.Utils.SysControls,
  Vcl.Styles.Utils.Forms, Vcl.Wait;

var
  FsemaphoreForm: TsemaphoreForm;

function TfrmAddUser.Excutedialog: Boolean;
begin
  { // Result := false;
    FCount := 15;
    DialogComfirm.Footer.Font.Size := 8;
    DialogComfirm.Footer.Text := Format('Dialog closes in %d seconds', [FCount]);
    if (boolerror = false) then
    DialogComfirm.Execute
    else
    exit;
    // while Result = false do
    // begin
    // application.ProcessMessages;
    if DialogComfirm.ModalResult = mrYes then
    begin
    Result := True;
    exit;
    end
    else
    begin
    if DialogComfirm.ModalResult = mrNO then
    exit;
    Result := false

    end;
    // application.ProcessMessages;
    // end; }
  Result := true;
end;

class function TThreadPB.confirmaddUser: Boolean;
begin
  if frmAddUser.Excutedialog = true then
    Result := true
  else
    Result := false;

end;

constructor TThreadPB.Create(suspend: Boolean; Name: string);
begin
  FreeOnTerminate := true;
  inherited Create(suspended);
  fSemaphore := OPensemaphore(SEMAPHORE_ALL_ACESS, true, 'MySemaphore');
  FName := name;
  progressbar := nil;

end;

function DoMessageDlgPosHelp(MessageDialog: TForm; X, Y: integer): integer;
begin
  with MessageDialog do
    try
      if X >= 0 then
        Left := X;
      if Y >= 0 then
        Top := Y;
      if (Y < 0) and (X < 0) then
        Position := poScreenCenter;
      Result := ShowModal;
    finally
      Free;
    end;
end;

procedure ShowStyledMessage(const Msg: string; const StyleElements: TStyleElements);
var
  Form: TForm;
begin
  Form := CreateMessageDialog(Msg, mtError, [mbOK]);
  Form.StyleElements := StyleElements;
  DoMessageDlgPosHelp(Form, -1, -1);
end;

function TThreadPB.edtUsercheeck: Boolean;
var
  EmpID: string;
begin
  EmpID := '';
  Result := true;
  if (String(Privatform.edtUser.Text).Trim = '') and (it = 10) then
  begin
    // ShowStyledMessage('No User !!!',[]);
    MessageDlg('No User !!!', mtError, [mbOK], 0);
    FsemaphoreForm.Close;
    Terminate;
    Result := false;
    exit;
  end;

  if (Privatform.BoolUserExist = true) and (it = 15) then
  begin
    MessageDlg('User ' + '"' + frmAddUser.edtUser.Text + '"' + ' exist !!!', mtWarning, [mbOK], 0);
    FsemaphoreForm.Close;
    Terminate;
    Result := false;
    exit;
  end;

  if (String(Privatform.edtPassword.Text).Trim = '') and (it = 20) then
  begin

    MessageDlg('No Password !!!', mtError, [mbOK], 0);
    FsemaphoreForm.Close;
    Terminate;
    Result := false;
    exit;

  end;
  if (String(Privatform.edtSecPassword.Text).Trim = '') and (it = 30) then
  begin

    MessageDlg('No Confirm Password !!!', mtError, [mbOK], 0);
    FsemaphoreForm.Close;
    Terminate;
    Result := false;
    exit;

  end;
  if (String(Privatform.edtSecPassword.Text).Trim <> String(Privatform.edtPassword.Text).Trim) and (it = 60) then
  begin

    MessageDlg('Not same Passwords !!!', mtError, [mbOK], 0);
    FsemaphoreForm.Close;
    Terminate;
    Result := false;
    exit;

  end;

  if (it = 90) and (FName = 'Cheeck User') then // Add user in progress  will start at 90° Position
  begin
    // Privatform.imgadduser.Stretch := True; // to make it as large as imgadduser
    // Privatform.imgadduser.Proportional := True; // to keep width/height ratio
    // Privatform.imgadduser.Picture.icon := nil;

    // showmessage('Confirm Add User');
    progressbar := FsemaphoreForm.InvokeDisplay('Wait...');
    if (confirmaddUser = false) or (boolerror = true) then
    begin

      Thread_1.Terminate;

    end
    else
    begin

      // frmMain.tbAddUser.OverlayIcon := Privatform.imgadduser.Picture.icon;

      if not Datamodule1.AddUser(Privatform.edtUser.Text, Privatform.edtPassword.Text, EmpID) = true then
      begin
        MessageDlg('User :' + '"' + frmAddUser.edtUser.Text + '"' + ' can not to be registered.', mtError, [mbOK], 0);
        boolerror := true;
        exit;
      end;

      progressbar := FsemaphoreForm.InvokeDisplay('Add User : ' + '"' + frmAddUser.edtUser.Text + '"');
      Thread_1.Terminate;
      Thread_2 := TThreadPB.Create(false, 'Add User');

    end;
    // Privatform.ilstAdduser.Geticon(0, Privatform.imgadduser.Picture.icon);

  end;
  it := it + 1;

end;

procedure TThreadPB.Execute;
var
  count: integer;
  i: integer;

begin

  it := 0;
  count := 0;
  WaitForSingleObject(fSemaphore, INFINITE);
  progressbar := FsemaphoreForm.InvokeDisplay(FName);
  Repeat

    if Datamodule1.boolbreak = true then
    begin
      // FsemaphoreForm.Close;

    end;
    inc(count);

    if (count mod 100 = 0) then
    begin
      // frmMain.tbAddUser.ProgressValue := Succ(frmMain.tbAddUser.ProgressValue);

      if edtUsercheeck = false then
        break;

    end;

    if Assigned(progressbar) then
    begin
      progressbar.Position := count div 100;
      if not(Thread_1.Terminated) and (it = 10) then
        FsemaphoreForm.lblProg.Caption := 'User: cheeck user';
      if not(Thread_1.Terminated) and (it = 20) then
        FsemaphoreForm.lblProg.Caption := 'Password: cheeck password';
      if not(Thread_1.Terminated) and (it = 90) then
        FsemaphoreForm.lblProg.Caption := 'Cheek was successful!!!';

      if Thread_1.Terminated then
        FsemaphoreForm.lblProg.Caption := 'Add User :' + '"' + frmAddUser.edtUser.Text + '"';

    end;

  Until count > 9999;

  if progressbar.Position = 100 then
  begin
    frmMain.tbAddUser.ProgressValue := 0;
    FsemaphoreForm.Close;
    if (FName = 'Add User') then
    begin
      MessageDlg('New User ' + '"' + frmAddUser.edtUser.Text + '"' + ' added ', mtInformation, [mbOK], 0);
      // Call the DLL

      boolAddedNewUser := true;
      // -------------------------------------   //
      // frmMain.tbAddUser.OverlayIcon := nil;
      Privatform.Close;
      // frmlogUser.EdtUserName.SetFocus;
    end;
  end;
  ReleaseSemaphore(fSemaphore, 1, nil);

end;

procedure TfrmAddUser.imgCloseClick(Sender: TObject);
begin
  frmloguser.SoundClickclose;
  Close;
end;

procedure TfrmAddUser.pnladdUserMouseLeave(Sender: TObject);
begin
  pnladdUser.borderwidth := 5;
end;

procedure TfrmAddUser.WMWindowPosChanging(var Msg: TWMWindowPosChanging); // deactive drag & drop
begin
  inherited;
  if not Application.Terminated then
  begin
    Msg.WindowPos.X := frmloguser.Left;
    Msg.WindowPos.Y := frmloguser.Top;
  end;
end;

procedure TfrmAddUser.pnlMainAddUserMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
const
  SC_DRAGMOVE = $F012;
begin

  if Button = mbLeft then
  begin

    ReleaseCapture;
    // pnlFrm.Cursor := crDrag;
    Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
  end;

end;

procedure TfrmAddUser.pnlMainAddUserMouseEnter(Sender: TObject);
begin
  pnlMainAddUser.Cursor := crDefault;
end;

procedure TfrmAddUser.btnDisUserClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmViewdataUser, frmViewdataUser);

    try
      frmViewdataUser.ShowModal;
    except
      on E: Exception do
      begin
        if E.message = '[FireDAC][Phys][SQLite] ERROR: file is encrypted or is not a database' then
        begin
          MessageDlg('Database is encrypted !', mtWarning, [mbOK], 0);

        end

      end;

    end;
  finally
    FreeAndNil(frmViewdataUser);
  end;
end;

procedure TfrmAddUser.Button1Click(Sender: TObject);
var
  s: string;
begin
  MessageDlg('y', mtWarning, [mbOK], 0);
  InputQuery('s', 's', s)
end;

procedure TfrmAddUser.DialogComfirmGetControlClass(Sender: TObject; ControlType: TControlType; var ControlClass: TControlClass);
begin
  // case ControlType of
  // ctButton: ControlClass := TButton;
  // ctCommandLink: ControlClass := nil;
  // ctCheckBox: ControlClass := TScrollBar;
  // ctMoreButton: ControlClass := nil;
  // ctRichEdit: ControlClass := nil;
  // ctLinkLabel: ControlClass := nil;
  // ctURLLabel: ControlClass := nil;
  // ctRadioButton: ControlClass := nil;
  // end;
end;

procedure TfrmAddUser.DialogComfirmInitControl(Sender: TObject; ControlType: TControlType; Control: TControl; ControlItem: TCollectionItem;
  var Handled: Boolean);
begin
  // case ControlType of
  // ctButton:
  // begin
  // (Control as TPanel).Caption := (ControlItem as TJSCustomButtonItem).Caption;
  // if (Control as TPanel).Caption = 'OK' then
  // (Control as TPanel).Tag := 1
  // else
  // (Control as TPanel).Tag := 2;
  // (Control as TButton).Height := 25;
  // (Control as TButton).Width := 75;
  // (Control as TButton).Cursor := 3123;
  // (Control as TPanel).OnClick := PanelDialogCloseClick;
  // {$IFDEF THEMES}
  // (Control as TPanel).ParentBackground := False;
  // {$ENDIF THEMES}
  // Handled := True;
  // end;
  { ctCommandLink: ;
    ctCheckBox:
    begin
    (Control as TScrollBar).Max := 1;
    (Control as TScrollBar).Position := 0;
    Handled := True;
    end;
    ctMoreButton: ;
    ctRichEdit: ;
    ctLinkLabel: ;
    ctURLLabel: ;
    ctRadioButton: ; }
  // end;
end;

procedure TfrmAddUser.DialogComfirmTimer(Sender: TObject; const TimeSince: Cardinal);
begin
  dec(FCount);
  DialogComfirm.Footer.Text := Format('Dialog closes in %d seconds', [FCount]);
  if FCount < 1 then
    DialogComfirm.Close(mrNO);
end;

procedure TfrmAddUser.edtPasswordChange(Sender: TObject);
begin
  BoolSamePass := (edtPassword.Text = edtSecPassword.Text);
  BoolMissing := (Length(edtUser.Text) > 0) and (Length(edtPassword.Text) > 0) and (Length(edtSecPassword.Text) > 0);
end;

procedure TfrmAddUser.edtSecPasswordChange(Sender: TObject);
begin
  BoolSamePass := (edtPassword.Text = edtSecPassword.Text);
  BoolMissing := (Length(edtUser.Text) > 0) and (Length(edtPassword.Text) > 0) and (Length(edtSecPassword.Text) > 0);
end;

procedure TfrmAddUser.edtUserChange(Sender: TObject);
begin
  BoolMissing := (Length(edtUser.Text) > 0) and (Length(edtPassword.Text) > 0) and (Length(edtSecPassword.Text) > 0);
end;

procedure TfrmAddUser.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  // Privatform.imgadduser.AutoSize := false;
  // Privatform.imgadduser.Proportional := True;
  ilstAdduser.Geticon(1, imgadduser.Picture.icon);
  frmloguser.EdtUserName.Clear;
  frmloguser.EdtUserPassword.Clear;


  // Privatform.imgadduser.Stretch := True; // to make it as large as imgadduser
  // Privatform.imgadduser.Proportional := True; // to keep width/height ratio

  // Privatform.imgadduser.AutoSize := false;
end;

procedure TfrmAddUser.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

  // if CanClose = True then
  // SetasMainForm(frmlogin);

end;

procedure TfrmAddUser.ScreenOnActiveControlChange(Sender: TObject);
var
  noEnter, noExit: Boolean;
  prevActiveControl: TWinControl;

  procedure ColorEnter(Sender: TObject);
  begin
    if Assigned(Sender) AND IsPublishedProp(Sender, 'Color') then
    begin
      prevInactiveColor := GetOrdProp(Sender, 'Color');
      SetOrdProp(Sender, 'Color', $00454545); // change clSkyBlue to something else or read from some application configuration :)
    end;
  end; (* ColorEnter *)

  procedure ColorExit(Sender: TObject);
  begin
    if Assigned(Sender) AND IsPublishedProp(Sender, 'Color') then
      SetOrdProp(Sender, 'Color', prevInactiveColor);
  end; (* ColorExit *)

begin
  if Screen.activeControl = nil then
  begin
    activeControl := nil;
    exit;
  end;

  noExit := false;

  noEnter := NOT Screen.activeControl.enabled;
  noEnter := noEnter OR (Screen.activeControl is TForm); // disabling active control focuses the form
  noEnter := noEnter OR (Screen.activeControl is TCheckBox); // skip checkboxes

  prevActiveControl := activeControl;

  if prevActiveControl <> nil then
  begin
    noExit := (prevActiveControl is TForm);
    noExit := noExit OR (prevActiveControl is TCheckBox);
  end;

  activeControl := Screen.activeControl;

  if NOT noExit then
    ColorExit(prevActiveControl);
  if NOT noEnter then
    ColorEnter(activeControl);
end;

procedure TfrmAddUser.FormCreate(Sender: TObject);
begin
  Screen.OnActiveControlChange := ScreenOnActiveControlChange;
  edtPassword.PasswordChar := '*';
  edtSecPassword.PasswordChar := '*';

  edtUser.Clear;
  edtPassword.Clear;

  edtSecPassword.Clear;
  Left := frmloguser.Left;
  Top := frmloguser.Top;

end;

procedure TfrmAddUser.FormDestroy(Sender: TObject);
begin
  Screen.OnActiveControlChange := nil;
end;

procedure TfrmAddUser.FormShow(Sender: TObject);
begin
  edtUser.Clear;
  edtPassword.Clear;
  edtSecPassword.Clear;
  edtUser.SetFocus;
  imgadduser.Picture.icon := nil;
  ilstAdduser.Geticon(1, imgadduser.Picture.icon);
  Left := frmloguser.Left;
  Top := frmloguser.Top;

end;

procedure TfrmAddUser.imgadduserClick(Sender: TObject);
var
  Waiting: TWait;
  EmpID_: String;

begin
  if (BoolMissing = false) then
  begin
    MessageDlg('Data missing !', mtWarning, [mbOK], 0);
    exit;
  end;

  if (BoolSamePass = false) then
  begin
    MessageDlg('The two passwords are not identical !', mtWarning, [mbOK], 0);
    exit;
  end;

  // -------------------------------------------------------- //
  boolerror := false;
  BoolUserExist := false;
  // SetasMainForm(privatform);
  { frmMain.tbAddUser.ProgressMaxValue := 100;
    frmMain.tbAddUser.ProgressState := TTaskBarProgressState.Normal;
    frmMain.tbAddUser.ProgressValue := 0; }

  // Taskbar1.OverlayIcon :=Img2.Picture.Icon;

  Waiting := TWait.Create('Wait...');
  Waiting.Start(
    procedure
    var
      i: integer;
    begin
      Waiting.progressbar.SetMax(100);
      for i := 1 to 100 do
      begin
        Waiting.SetContent(i.ToString + '% Complete').progressbar.Step();
        Sleep(30); // Your code here!!!
        case i of
          10:
            begin
              if Datamodule1.FORAddUser(Privatform.edtUser.Text, Privatform.edtPassword.Text) = true then
                BoolUserExist := true;
              if (Datamodule1.berror = true) then
              begin
                break;
                exit;
              end;
            end;
          20:
            begin
              if (BoolUserExist = true) then
              begin
                boolerror := true;
                break;
                exit;
              end;

            end;

        end;

      end;
    end);

  if (Datamodule1.berror = true) then
  begin
    if Datamodule1.Errortyp = '[FireDAC][Phys][SQLite] ERROR: file is encrypted or is not a database' then
    begin
      MessageDlg('Database is encrypted !', mtWarning, [mbOK], 0);
      exit;
    end
    else
    begin
      if MessageDlg('Database connection failed,software must restart!', mtWarning, [mbOK], 0) = mrOK then
      begin
        ShellExecute(Handle, nil, PChar(Application.ExeName), 'Login', nil, SW_SHOWNORMAL);
        Application.Terminate;
        exit;
      end;
    end;
  end;

  if (BoolUserExist = true) then
    MessageDlg('User : "' + Privatform.edtUser.Text + '" exists already !', mtWarning, [mbOK], 0);

  if ((Datamodule1.berror = false) and (BoolUserExist = false) and (boolerror = false)) then
    if not Datamodule1.AddUser(Privatform.edtUser.Text, Privatform.edtPassword.Text, EmpID_) = true then
    begin
      MessageDlg('User :' + '"' + Privatform.edtUser.Text + '"' + ' can not to be registered.', mtError, [mbOK], 0);
      boolerror := true;
      exit;
    end
    else
    begin
      MessageDlg('New User ' + '"' + Privatform.edtUser.Text + '"' + ' added. ', mtInformation, [mbOK], 0);
    end;

  // Using semaphare thread
  {

    if (FsemaphoreForm <> nil) then
    FreeAndNil(FsemaphoreForm);

    FsemaphoreForm := TsemaphoreForm.Create(nil);
    FsemaphoreForm.Show;
    fSemaphore := CreateSemaphore(nil, 1, 1, 'MySemaphore');
    // if (boolAddedNewUser = True) then
    // begin
    // frmMain.Color := clBlack;
    ShowDLLWelcome383(frmAddUser.edtUser.Text);
    CloseDLLWelcome383;

    // frmMain.Color := $003C3C3C;
    // boolAddedNewUser := false;
    // end;
    Thread_1 := TThreadPB.Create(false, 'Cheeck User');

    CloseHandle(fSemaphore);
  }
end;

procedure TfrmAddUser.imgadduserMouseEnter(Sender: TObject);
begin
  pnladdUser.borderwidth := 2;
end;

function frmAddUser: TfrmAddUser;
begin
  if not Assigned(Privatform) then
    Privatform := TfrmAddUser.Create(Application);
  Result := Privatform;
end;



// procedure TfrmAddUser.OnAfterResize(var Msg: TMessage);
// begin
// Privatform.Position := poScreenCenter;
//
// end;

// procedure TfrmAddUser.sizemove(var Msg: TWMSIZE);
// begin
// Inherited; // if u dont put inhrited the anchors will dont work
// if (Msg.SizeType = size_Maximized) then
// begin
// Privatform.Position := poScreenCenter;
// end;
// end;

// procedure TfrmAddUser.WMGetMinMaxInfo(var AMsg: TWMGetMinMaxInfo);
// begin
// { inherited;
// with AMsg.MinMaxInfo^ do
// begin
// //    Privatform.Position := poScreenCenter;
// ptMinTrackSize := Point(340, 340);
// ptMaxTrackSize := Point(680, 340);
//
// end; }
//
// end;

end.
