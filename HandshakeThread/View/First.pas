{ ============================================
  Software Name : 	HandShakeThread
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides }
{ CopyRight © 2019 }
{ Email : WalWalWalides@gmail.com }
{ GitHub :https://github.com/walwalwalides }
{ ******************************************** }

unit First;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, System.Actions, Vcl.ActnList, Vcl.Menus, Vcl.ExtCtrls;

type
  TfrmFirst = class(TForm)
    GroupBox1: TGroupBox;
    edtEnterValue: TEdit;
    btnCalcule: TButton;
    GroupBox2: TGroupBox;
    stResult: TStaticText;
    Label1: TLabel;
    Label2: TLabel;
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
    RadGrpPower: TRadioGroup;
    pnlMain: TPanel;
    procedure btnCalculeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actAboutExecute(Sender: TObject);
    procedure acSecondExecute(Sender: TObject);
    procedure btnInjectClick(Sender: TObject);
  private
    { Private declarations }
    hThread: THandle;
    function PowerValue(s: string): string;
  public
    { Public declarations }
    SharedBuffer: string;
  end;

const
  SERVERSHUTDOWN = 'SERVER SHUTDOWN';
  SERVERSTOPPED = 'SERVER STOPPED';
  TIMEOUT = 2000;

var
  frmFirst: TfrmFirst;

  EventRequestFirst: THandle;
  EventRequestSecond: THandle;

implementation

uses
  Second, About, System.Math;

{$R *.dfm}

function TfrmFirst.PowerValue(s: string): string;
var
  iPower: Integer;

begin
  case RadGrpPower.ItemIndex of
    0:
      iPower := 0;
    1:
      iPower := 1;
    2:
      iPower := 2;
    3:
      iPower := 3;
  end;
  result := Power(StrToInt(s), iPower).ToString;
end;

function ServerThread(p: Pointer): Integer;
var
  bShutDown: Boolean;
begin
  bShutDown := False;
  while not bShutDown do
  begin
    WaitForSingleObject(EventRequestFirst, INFINITE);
    bShutDown := frmFirst.SharedBuffer = SERVERSHUTDOWN;
    if not bShutDown then
      frmFirst.SharedBuffer := frmFirst.PowerValue(frmFirst.SharedBuffer)
    else
      frmFirst.SharedBuffer := SERVERSTOPPED;
    SetEvent(EventRequestSecond);
  end;
  SetEvent(EventRequestSecond);
  result := 0;
end;

procedure TfrmFirst.acSecondExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmSecond, frmSecond);

  frmSecond.Position := poMainFormCenter;
  try
    frmSecond.ShowModal;
  finally
    FreeAndNil(frmSecond);
  end;
end;

procedure TfrmFirst.actAboutExecute(Sender: TObject);
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

procedure TfrmFirst.btnInjectClick(Sender: TObject);
begin
  //
end;

procedure TfrmFirst.btnCalculeClick(Sender: TObject);
var
  DResult: DWORD;
resourcestring
  rsServerStopped = 'Server Thread is Stopped';
begin
  SharedBuffer := edtEnterValue.Text;
  SetEvent(EventRequestFirst);
  DResult := WaitForSingleObject(EventRequestSecond, TIMEOUT);
  if (DResult = WAIT_TIMEOUT) then
    Messagebox(Handle, PChar(rsServerStopped), PChar(SERVERSTOPPED), MB_ICONWARNING);
  stResult.Caption := SharedBuffer;
end;

procedure TfrmFirst.FormCreate(Sender: TObject);
var
  ThreadID: Cardinal;
begin
  edtEnterValue.NumbersOnly := true;
  frmFirst.Color:=clWhite;
                          {Create two Event }
  EventRequestFirst := CreateEvent(nil, False, False, nil);
  EventRequestSecond := CreateEvent(nil, False, False, nil);

  hThread := BeginThread(nil, 0, @ServerThread, nil, 0, ThreadID);
  pnlMain.Caption := '';
end;

procedure TfrmFirst.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Handles: array [0 .. 1] of THandle;
begin
  SharedBuffer := SERVERSHUTDOWN;
  SetEvent(EventRequestFirst);

  Handles[0] := EventRequestSecond;
  Handles[1] := hThread;
  WaitForMultipleObjects(2, @Handles, true, INFINITE);

  // --------------------------------------------------- //
  CloseHandle(hThread);
  CloseHandle(EventRequestFirst);
  CloseHandle(EventRequestSecond);
end;

end.
