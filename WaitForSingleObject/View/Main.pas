{ ============================================
  Software Name : 	ProgressThreadTimer
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides                     }
{ CopyRight © 2019                             }
{ Email : WalWalWalides@gmail.com              }
{ GitHub :https://github.com/walwalwalides     }
{ ******************************************** }
unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, Dialogs, StdCtrls, Vcl.ComCtrls, Vcl.Buttons, System.ImageList, Vcl.ImgList, System.Actions,
  Vcl.ActnList, Vcl.Menus;

type
  TfrmMain = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    lblThreadTimes: TStaticText;
    lblTickCount: TStaticText;
    prgbrMain: TProgressBar;
    GrBoxCounter: TGroupBox;
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
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitbtnStartClick(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure BitBtnSTOPClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

const
  MAXCOUNT = 99;

var
  ThreadID: LongWord;
  p: Pointer;
  frmMain: TfrmMain;
  bRunning: Integer = 0;

implementation

uses About;

{$R *.dfm}

type
  TThreadParameter = record
    FlblTickCount: TStaticText;
    FlblThreadTimes: TStaticText;
  end;

  PTThreadParameter = ^TThreadParameter;

function Thread(p: Pointer): Integer;
var
  lblCounter: TStaticText;
  lblTickCount, lblThreadTimes: TStaticText;
  Counter: Integer;
  TickCountStart, TickCountEnd: Cardinal;
  KernelTimeStart, KernelTimeEnd: FileTime;
  UserTimeStart, UserTimeEnd: FileTime;
  Dummy: TFileTime;
  KernelTimeElapsed, UserTimeElapsed, TotalTime: Int64;
begin
  Screen.Cursor := crHourGlass;

  result := 0;
  Counter := 1;
  lblTickCount := PTThreadParameter(p)^.FlblTickCount;
  lblThreadTimes := PTThreadParameter(p)^.FlblThreadTimes;
  TickCountStart := GetTickCount();
  GetThreadTimes(GetCurrentThread, Dummy, Dummy, KernelTimeStart, UserTimeStart);
  Screen.Cursor := crDefault;
  while (Counter < MAXCOUNT + 1) and (bRunning = 0) do
  begin
    frmMain.prgbrMain.Position := frmMain.prgbrMain.Position + Counter;
    Inc(Counter);
    sleep(5);
  end;
  //GetThreadTimes

  GetThreadTimes(GetCurrentThread, Dummy, Dummy, KernelTimeEnd, UserTimeEnd);
  TickCountEnd := GetTickCount();
  KernelTimeElapsed := Int64(KernelTimeEnd) - Int64(KernelTimeStart);
  UserTimeElapsed := Int64(UserTimeEnd) - Int64(UserTimeStart);
  TotalTime := (KernelTimeElapsed + UserTimeElapsed) div 100;
  lblTickCount.Caption := IntToStr(TickCountEnd - TickCountStart);
  lblThreadTimes.Caption := IntToStr(TotalTime);
  FreeMem(p);

  frmMain.prgbrMain.Position := 0;
end;

procedure TfrmMain.FormCreate(Sender: TObject);

begin

  frmMain.Position := poMainFormCenter;
  frmMain.WindowState := wsNormal;
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
  frmMain.prgbrMain.Position := 0;
  //
  GetMem(p, sizeof(TThreadParameter));
  PTThreadParameter(p)^.FlblTickCount := lblTickCount;
  PTThreadParameter(p)^.FlblThreadTimes := lblThreadTimes;

  CloseHandle(BeginThread(nil, 0, @Thread, p, 0, ThreadID));

end;

procedure TfrmMain.BitBtnSTOPClick(Sender: TObject);
begin
  //
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  InterlockedExchange(bRunning, 1);
end;

end.
