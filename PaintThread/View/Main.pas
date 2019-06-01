{ ============================================
  Software Name : 	PaintThread
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
  Vcl.ActnList, Vcl.Menus, uPaintThread, Vcl.Graphics;

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
    tbarThreadPriority: TTrackBar;
    lblRedCounter: TLabel;
    BitBtnClear: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitbtnStartClick(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure BitBtnSTOPClick(Sender: TObject);
    procedure BitBtnClearClick(Sender: TObject);
    procedure tbarThreadPriorityChange(Sender: TObject);
  private
    DrawRedThread: TPaintThread;
    procedure EnableControlls(Enable: Boolean);

    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmMain: TfrmMain;

implementation

uses About;

{$R *.dfm}

procedure TfrmMain.EnableControlls(Enable: Boolean);
begin
  BitbtnStart.Enabled := Enable;
  BitBtnSTOP.Enabled := not Enable;

end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  frmMain.Position := poMainFormCenter;
  frmMain.WindowState := wsNormal;
  // --------------------------------------------  //

end;

procedure TfrmMain.tbarThreadPriorityChange(Sender: TObject);
begin
if DrawRedThread <> nil then
   DrawRedThread.Priority:=TThreadPriority(tbarThreadPriority.Position);
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

procedure TfrmMain.BitBtnClearClick(Sender: TObject);
begin
frmMain.Refresh;
end;

procedure TfrmMain.BitbtnStartClick(Sender: TObject);
begin
  EnableControlls(False);
  DrawRedThread := TPaintThread.Create(clRed, lblRedCounter);


end;

procedure TfrmMain.BitBtnSTOPClick(Sender: TObject);
begin
  EnableControlls(True);
  DrawRedThread.Free;
end;

end.
