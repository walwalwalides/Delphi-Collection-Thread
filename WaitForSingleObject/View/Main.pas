{ ============================================
  Software Name : 	WaitForSingleObject
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
  Vcl.ActnList, Vcl.Menus;

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
    BitbtnStart: TBitBtn;
    BitBtnSTOP: TBitBtn;
    Exit2: TMenuItem;
    memDisplay: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitbtnStartClick(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure BitBtnSTOPClick(Sender: TObject);
    procedure memDisplayKeyPress(Sender: TObject; var Key: Char);
  private
    procedure EnableControlls(Enable: Boolean);

    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

const
  MAXCOUNT = 99;

var
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

uses About;

{$R *.dfm}

procedure TfrmMain.EnableControlls(Enable: Boolean);
begin
  BitbtnStart.Enabled := Enable;
  BitBtnSTOP.Enabled := Enable;

end;

function Thread(p: Pointer): Integer;
resourcestring
  rsReturn = 'Press Enter - Or Not ...';
begin
  frmMain.memDisplay.Lines[0] := rsReturn;
  result := 0;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  frmMain.Position := poMainFormCenter;
  frmMain.WindowState := wsNormal;
  memDisplay.Clear;
  EventArray := CreateEvent(nil, False, False, nil);
  // --------------------------------------------  //

end;

procedure TfrmMain.actAboutExecute(Sender: TObject);
var
  F: TfrmAbout;
begin
  if not(Assigned(F)) then
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

procedure TfrmMain.BitbtnStartClick(Sender: TObject);
begin
  BitbtnStart.Enabled := False;
  memDisplay.Clear;
  frmMain.prgbrMain.Position := 0;
  //
  memDisplay.Lines[0] := rsThreadStart;
  hThread := BeginThread(nil, 0, @Thread, nil, 0, ThreadID);

  if (hThread <> INVALID_HANDLE_VALUE) then
  begin
    wf := WaitForSingleObject(hThread, 3000);
    case wf of
      WAIT_OBJECT_0:
        memDisplay.Lines[0] := rsWO;
      WAIT_TIMEOUT:
        memDisplay.Lines[0] := rsWT;
      WAIT_FAILED:
        memDisplay.Lines[0] := rsWT;
    end;
    Sleep(3000);
    CloseHandle(hThread);
    EnableControlls(True);
  end;

end;

procedure TfrmMain.BitBtnSTOPClick(Sender: TObject);
begin
  //
  SetEvent(EventArray);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  //
end;

procedure TfrmMain.memDisplayKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    SetEvent(EventArray);
end;

end.
