{ ============================================
  Software Name : 	MySafeThread
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
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Actions, Vcl.ActnList, Vcl.Menus;

type
  TfrmMain = class(TForm)
    memDisplay: TMemo;
    btnInitialization: TButton;
    btnThread1: TButton;
    btnThread2: TButton;
    btnStopThreads: TButton;
    ScrollBox1: TScrollBox;
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
    aclstMain: TActionList;
    actOpenFile: TAction;
    actShowInExplorer: TAction;
    actOpenFolder: TAction;
    actExit: TAction;
    actOption: TAction;
    actAbout: TAction;
    acAddUser: TAction;
    procedure btnInitializationClick(Sender: TObject);
    procedure btnThread1Click(Sender: TObject);
    procedure btnThread2Click(Sender: TObject);
    procedure btnStopThreadsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TMySafeThread = class(TThread)
  private
  public
    procedure Execute; override;
  end;

  TMyList = class
  private
    FData: string;
    FLock: TObject;
  public
    constructor Create;
    function Lock: string;
    procedure Add(const Item: string);
    procedure Remove;
    procedure UnLock; inline;
  end;

var
  frmMain: TfrmMain;
  MyList: TMyList;
  t1, t2: TMySafeThread;

implementation

uses About;

{$R *.dfm}
{ TMyList }

procedure TMyList.Add(const Item: string);
begin
  FData := Item;
end;

constructor TMyList.Create;
begin
  FLock := TObject.Create;
  FData := Random(900000).ToString
end;

function TMyList.Lock: string;
begin
  System.TMonitor.Enter(FLock);
  Result := FData;

end;

procedure TMyList.Remove;
begin
  FData := '';
end;

procedure TMyList.UnLock;
begin
  System.TMonitor.Exit(FLock);
end;

{ TMySafeThread }

procedure TMySafeThread.Execute;
begin
  repeat
    MyList.Lock;
    MyList.Add('Data ' + Self.ThreadID.ToString);
    Synchronize(
      procedure
      begin
        frmMain.memDisplay.Lines.Add('ID : '+Self.ThreadID.ToString );
      end);
    sleep(10);

    Synchronize(
      procedure
      begin
        frmMain.memDisplay.Lines.Add('ID : '+Self.ThreadID.ToString + ' Done');
      end);
    MyList.UnLock;

  until Terminated;
end;

procedure TfrmMain.actAboutExecute(Sender: TObject);
var
  F: TfrmAbout;
begin

  if not Assigned(F) then
    Application.CreateForm(TfrmAbout, F);
  F.Position := poMainFormCenter;
  try
    F.ShowModal;
  finally
    FreeAndNil(F);
  end;

end;

procedure TfrmMain.btnInitializationClick(Sender: TObject);
var
  strItem: string;
begin
  MyList := TMyList.Create;
  MyList.Add('Initialization');
  strItem := MyList.Lock;
  MyList.UnLock;
  memDisplay.Lines.Add(strItem);
end;

procedure TfrmMain.btnThread1Click(Sender: TObject);
begin
  t1 := TMySafeThread.Create;
end;

procedure TfrmMain.btnThread2Click(Sender: TObject);
begin
  t2 := TMySafeThread.Create;
end;

procedure TfrmMain.btnStopThreadsClick(Sender: TObject);
begin
  t1.Terminate;
  t1.WaitFor;
  t2.Terminate;
  t2.WaitFor;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  //
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  //
  frmMain.Position := poScreenCenter;
end;

end.
