{ ============================================
  Software Name : 	AnonymThread
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
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListBox, FMX.Menus, System.ImageList, FMX.ImgList, FMX.Objects, System.Actions, FMX.ActnList;

type
  TfrmMain = class(TForm)
    lstLog: TListBox;
    btnAnonymThread: TButton;
    MMMain: TMainMenu;
    mItemFile: TMenuItem;
    mItemExit: TMenuItem;
    btnApproachAnonymThread: TButton;
    mItemInfo: TMenuItem;
    mItemAbout: TMenuItem;
    SplitterMain: TSplitter;
    ilMain: TImageList;
    Rectangle1: TRectangle;
    ActLstMain: TActionList;
    ActAbout: TAction;
    btnAnonythreadCheckClose: TButton;
    procedure btnAnonymThreadClick(Sender: TObject);
    procedure btnApproachAnonymThreadClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mItemExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActAboutExecute(Sender: TObject);
    procedure btnAnonythreadCheckCloseClick(Sender: TObject);
  private
    fLogStarted: cardinal;
    fAbort, fRunning: boolean;
    procedure StartLog;
    procedure Log(const Msg: string);
    function IsPrime(const n: int64): boolean;
  end;

var
  frmMain: TfrmMain;

implementation

uses
  System.Diagnostics, System.TimeSpan, About;

{$R *.fmx}

// By direct close the application the Anonymous thread still running...
procedure TfrmMain.btnAnonymThreadClick(Sender: TObject);
const
  cStartInterval = 10000000001000;
  cEndInterval = 10000000002000;
begin
  StartLog;
  TThread.CreateAnonymousThread(         //Create Anonymous Thread
    procedure
    var
      c, i: int64;
    begin
      i := 0;
      c := cStartInterval;
      while c <= cEndInterval do
      begin
        if IsPrime(c) then
        begin
          TThread.Queue(nil,
            procedure
            begin
              Log(Format('%3d : %d', [i, c]));
            end);
          inc(i);
        end;
        inc(c);
      end;
    end).Start;
end;


// By direct close the application the Anonymous thread still running...
procedure TfrmMain.btnAnonythreadCheckCloseClick(Sender: TObject);
const
  cStartInterval = 10000000001000;
  cEndInterval = 10000000002000;
begin
  StartLog;
  TThread.CreateAnonymousThread(
    procedure
    var
      c, i: int64;
    begin
      i := 0;
      c := cStartInterval;
      while (c <= cEndInterval) and not Application.Terminated do
      begin
        if IsPrime(c) then
        begin
          TThread.Queue(nil,
            procedure
            begin
              Log(Format('%3d : %d', [i, c]));
            end);
          inc(i);
        end;
        inc(c);
      end;
    end).Start;
end;



procedure TfrmMain.ActAboutExecute(Sender: TObject);
begin

  Application.CreateForm(TFrmAbout, FrmAbout);
  FrmAbout.Position := TFormPosition.MainFormCenter;
  try
    FrmAbout.ShowModal;
  finally
    FreeAndNil(FrmAbout);
  end;

end;

procedure TfrmMain.btnApproachAnonymThreadClick(Sender: TObject);
const
  cStartInterval = 100000000010000;
  cEndInterval = 100000000020000;
begin
  fRunning := true;
  fAbort := false;
  btnApproachAnonymThread.Enabled := false;
  StartLog;
  TThread.CreateAnonymousThread(
    procedure
    var
      c, i: int64;
    begin
      i := 0;
      c := cStartInterval;
      while (c <= cEndInterval) and not fAbort do
      begin
        if IsPrime(c) then
        begin
          TThread.Queue(nil,
            procedure
            begin
              Log(Format('%3d : %d', [i, c]));
            end);
          inc(i);
        end;
        inc(c);
      end;

      TThread.Queue(nil,
        procedure
        begin
          btnApproachAnonymThread.Enabled := true;
        end);
      fRunning := false;
    end).Start;
end;


procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fAbort := true;       //Break the process using bool variable
  while fRunning do
  begin
    Application.ProcessMessages;
    Sleep(50);
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  frmMain.Position := TFormPosition(6);
end;

function TfrmMain.IsPrime(const n: int64): boolean;
var
  i: cardinal;
  en: extended;
begin
  if (n <> 2) then
  begin
    en := n;
    for i := 2 to round(sqrt(en)) do
      if (n mod i = 0 )then
        exit(false);
  end;
  result := n > 0;
end;



procedure TfrmMain.StartLog;
begin
  lstLog.Clear;
  fLogStarted := TStopWatch.GetTimeStamp div TTimeSpan.TicksPerMillisecond;
end;

procedure TfrmMain.Log(const Msg: string);
var
  CurrentTimeInMs: cardinal;
begin
  CurrentTimeInMs := TStopWatch.GetTimeStamp div TTimeSpan.TicksPerMillisecond - fLogStarted;
  lstLog.ItemIndex := lstLog.Items.Add(Format('%6.3f sec: %s', [CurrentTimeInMs / 1000, Msg]));
end;

procedure TfrmMain.mItemExitClick(Sender: TObject);
begin
  try
    Close;
  except
    MessageDlg('Anonym Thread still running !', System.UITypes.TMsgDlgType.mtError, [System.UITypes.TMsgDlgBtn.mbOK], 0);
  end;
end;

end.
