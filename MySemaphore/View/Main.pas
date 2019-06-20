{ ============================================
  Software Name : 	MySemaphore
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides }
{ CopyRight © 2019 }
{ Email : WalWalWalides@gmail.com }
{ GitHub :https://github.com/walwalwalides }
{ ******************************************** }
unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, Dialogs, StdCtrls, Vcl.ComCtrls, Vcl.Buttons, System.ImageList, Vcl.ImgList, System.Actions,
  Vcl.ActnList, Vcl.Menus, Vcl.AppEvnts;

const
  SEMAPHORE_ALL_ACESS = EVENT_ALL_ACCESS;
  IDI_ICON2 = 102;

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
  TfrmMain = class(TForm)
    prgbrMain: TProgressBar;
    MMMain: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    N1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N3: TMenuItem;
    A2: TMenuItem;
    actAbout1: TMenuItem;
    N2: TMenuItem;
    acMainList: TActionList;
    actOpenFile: TAction;
    actShowInExplorer: TAction;
    actOpenFolder: TAction;
    actExit: TAction;
    actOption: TAction;
    actAbout: TAction;
    acSecond: TAction;
    BitbtnAdd: TBitBtn;
    BitBtnView: TBitBtn;
    Exit2: TMenuItem;
    grpBoxMain: TGroupBox;
    edtPassword: TEdit;
    edtSecPassword: TEdit;
    edtUser: TEdit;
    lblUser: TLabel;
    lblPassword: TLabel;
    lblPassword2: TLabel;
    AppEvtMain: TApplicationEvents;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitbtnAddClick(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure BitBtnViewClick(Sender: TObject);
    procedure AppEvtMainIdle(Sender: TObject; var Done: Boolean);
  private
    BoolUserExist: Boolean;
    BoolSamePass: Boolean;
    BoolMissing: Boolean;
    procedure EnableControlls(Enable: Boolean);

    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

const
  MAXCOUNT = 99;

var
  fSemaphore: THandle;
  Thread_1: TThreadPB;
  Thread_2: TThreadPB;
  boolAddedNewUser: Boolean = false;
  boolerror: Boolean = false;
  FCount: integer;
  hThread: THandle;
  EventArray: THandle;
  ThreadID: Cardinal;
  wf: DWORD;
  frmMain: TfrmMain;

resourcestring
  rsThreadStart = 'Thread is Starting : ';
  rsWO = 'Thread Was Terminated by the User';
  rsWT = 'Thread Did Not Finish Within 3 seconds';
  rsWF = 'Error!';

implementation

uses About,Cheeck,DataModule;

var
  FsemaphoreForm: TfrmCheeck;

{$R *.dfm}

class function TThreadPB.confirmaddUser: Boolean;
begin
  if True then
    Result := True
  else
    Result := false;

end;

constructor TThreadPB.Create(suspend: Boolean; Name: string);
begin
  FreeOnTerminate := True;
  inherited Create(suspended);
  fSemaphore := OPensemaphore(SEMAPHORE_ALL_ACESS, True, 'MySemaphore');
  FName := name;
  progressbar := nil;

end;

function TThreadPB.edtUsercheeck: Boolean;
var
  EmpID: string;
begin
  EmpID := '';
  Result := True;
  if (String(frmMain.edtUser.Text).Trim = '') and (it = 10) then
  begin
    MessageDlg('No User !!!', mtError, [mbOK], 0);
    FsemaphoreForm.Close;
    frmMain.BitbtnAdd.Enabled:=True;
    Terminate;
    Result := false;
    exit;
  end;

  if (frmMain.BoolUserExist = True) and (it = 15) then
  begin
    MessageDlg('User ' + '"' + frmMain.edtUser.Text + '"' + ' exist !!!', mtWarning, [mbOK], 0);
    FsemaphoreForm.Close;
    frmMain.BitbtnAdd.Enabled:=True;
    Terminate;
    Result := false;
    exit;
  end;

  if (String(frmMain.edtPassword.Text).Trim = '') and (it = 20) then
  begin

    MessageDlg('No Password !!!', mtError, [mbOK], 0);
    FsemaphoreForm.Close;
    frmMain.BitbtnAdd.Enabled:=True;
    Terminate;
    Result := false;
    exit;

  end;
  if (String(frmMain.edtSecPassword.Text).Trim = '') and (it = 30) then
  begin

    MessageDlg('No Confirm Password !!!', mtError, [mbOK], 0);
    FsemaphoreForm.Close;
    frmMain.BitbtnAdd.Enabled:=True;
    Terminate;
    Result := false;
    exit;

  end;
  if (String(frmMain.edtSecPassword.Text).Trim <> String(frmMain.edtPassword.Text).Trim) and (it = 60) then
  begin

    MessageDlg('Not same Passwords !!!', mtError, [mbOK], 0);
    FsemaphoreForm.Close;
    frmMain.BitbtnAdd.Enabled:=True;
    Terminate;
    Result := false;
    exit;

  end;

  if (it = 90) and (FName = 'Cheeck User') then // Add user in progress  will start at 90° Position
  begin
    progressbar := FsemaphoreForm.InvokeDisplay('Wait...');
    if (confirmaddUser = false) or (boolerror = True) then
    begin
     frmMain.BitbtnAdd.Enabled:=True;
      Thread_1.Terminate;

    end
    else
    begin
      if not DMMain.AddUser(frmMain.edtUser.Text, frmMain.edtPassword.Text) = True then
      begin
        MessageDlg('User :' + '"' + frmMain.edtUser.Text + '"' + ' can not to be registered.', mtError, [mbOK], 0);
        boolerror := True;
        frmMain.BitbtnAdd.Enabled:=True;
        exit;
      end;
      progressbar := FsemaphoreForm.InvokeDisplay('Add User : ' + '"' + frmMain.edtUser.Text + '"');
      frmMain.BitbtnAdd.Enabled:=True;
      Thread_1.Terminate;
      Thread_2 := TThreadPB.Create(false, 'Add User');

    end;
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

    if DMMain.boolbreak = True then
    begin
      // FsemaphoreForm.Close;

    end;
    inc(count);

    if (count mod 100 = 0) then
    begin
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
        FsemaphoreForm.lblProg.Caption := 'Add User :' + '"' + frmMain.edtUser.Text + '"';

    end;

  Until count > 9999;

  if progressbar.Position = 100 then
  begin
    FsemaphoreForm.Close;
    if (FName = 'Add User') then
    begin
      MessageDlg('New User ' + '"' + frmMain.edtUser.Text + '"' + ' added ', mtInformation, [mbOK], 0);

      boolAddedNewUser := True;
      // -------------------------------------   //
      frmMain.Close;
    end;
  end;
  ReleaseSemaphore(fSemaphore, 1, nil);

end;

procedure TfrmMain.EnableControlls(Enable: Boolean);
begin
  BitbtnAdd.Enabled := Enable;
  BitBtnView.Enabled := not Enable;

end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  frmMain.Position := poMainFormCenter;
  frmMain.WindowState := wsNormal;
  // --------------------------------------------  //
  edtPassword.PasswordChar := '*';
  edtSecPassword.PasswordChar := '*';
  edtUser.Clear;
  edtPassword.Clear;
  edtSecPassword.Clear;
end;

procedure TfrmMain.actAboutExecute(Sender: TObject);
var
  F: TfrmAbout;
begin
  if (Assigned(F)) then
    Application.CreateForm(TfrmAbout, F);
  F.Position := poMainFormCenter;
  try
    F.ShowModal;
  finally
    FreeAndNil(F);
  end;

end;

procedure TfrmMain.actExitExecute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.AppEvtMainIdle(Sender: TObject; var Done: Boolean);
begin
//
end;

procedure TfrmMain.BitbtnAddClick(Sender: TObject);
begin
  //
  BitbtnAdd.Enabled:=False;
  if (FsemaphoreForm <> nil) then
    FreeAndNil(FsemaphoreForm);
  FsemaphoreForm := TfrmCheeck.Create(nil);
  FsemaphoreForm.Show;
  fSemaphore := CreateSemaphore(nil, 1, 1, 'MySemaphore');
  Thread_1 := TThreadPB.Create(false, 'Cheeck User');
  CloseHandle(fSemaphore);

end;

procedure TfrmMain.BitBtnViewClick(Sender: TObject);
begin
  //

end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  //
end;

end.
