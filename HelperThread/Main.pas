{ ============================================
  Software Name : 	HelperThread
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
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,

  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Layouts,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Objects, System.ImageList, FMX.ImgList, FMX.Menus, System.Actions, FMX.ActnList;

type
  TFrmMain = class(TForm)
    Layout1: TLayout;
    btnCreate: TButton;
    vtsList: TVertScrollBox;
    ActLstMain: TActionList;
    ActAbout: TAction;
    MMMain: TMainMenu;
    mItemFile: TMenuItem;
    mItemExit: TMenuItem;
    mItemInfo: TMenuItem;
    mItemAbout: TMenuItem;
    ilMain: TImageList;
    ActExit: TAction;
    ActCreate: TAction;
    mItemAction: TMenuItem;
    mItemCreate: TMenuItem;
    btnClear: TButton;
    Rectangle1: TRectangle;
    procedure btnCreateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActExitExecute(Sender: TObject);
    procedure ActAboutExecute(Sender: TObject);
    procedure ActCreateExecute(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
  private
    { Private declarations }
    procedure CreateAction;
    procedure InfoLblb(Sender: TObject);
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  Helper.Thread, Helper.Loading, About;

{$R *.fmx}

procedure TFrmMain.ActAboutExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmAbout, FrmAbout);
  FrmAbout.position := TFormPosition.MainFormCenter;
  try
    FrmAbout.ShowModal;
  finally
    FreeAndNil(FrmAbout);
  end;
end;

procedure TFrmMain.ActCreateExecute(Sender: TObject);
begin
  CreateAction;
end;

procedure TFrmMain.ActExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TFrmMain.btnClearClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to vtsList.ComponentCount - 1 do
  begin
    if (vtsList.Components[i] is TRectangle) then
    begin
      vtsList.Components[i].Free;

    end;
  end;

end;

procedure TFrmMain.btnCreateClick(Sender: TObject);
begin
  CreateAction;
end;

procedure TFrmMain.InfoLblb(Sender: TObject);
begin
  //
  showmessage(Copy(TControl(Sender).Name,2,length(TControl(Sender).Name)));
end;

procedure TFrmMain.CreateAction;
begin
  TThreadCustom.Start(
    procedure
    begin // OnShow
      btnCreate.Enabled := False;
      mItemCreate.Enabled := False;
      TLoading.Show('Wait..', 'Arial', 'Lightskyblue', 'White', 'Lightskyblue');
      vtsList.BeginUpdate;
    end,
    procedure
    var
      i: Integer;
      LRct: TRectangle;
      LLbl: TLabel;
    begin // OnProcess
      for i := 0 to 100 do
      begin

        LRct := TRectangle.Create(vtsList);
        LRct.Align := TAlignLayout.Top;
        LRct.Margins.Bottom := 2;
        LRct.Margins.Top := 2;
        LRct.Margins.Left := 2;
        LRct.Margins.Right := 2;
        LRct.Width := vtsList.Width;
        LRct.name := LRct.ClassName + i.ToString;
        LRct.Cursor := crhandpoint;
        LRct.OnClick := InfoLblb;

        // ------------------------Create Label as Rectangle Title-----------------------------------
        LLbl := TLabel.Create(LRct);
        LLbl.Parent := LRct;
        LLbl.Text := ' Rectangle ' + i.ToString;
        LLbl.Align := TAlignLayout.Client;

        vtsList.AddObject(LRct);

        TLoading.ChangeMessage('Wait... ' + i.ToString + '%');
        Sleep(5);
        TThread.Synchronize(nil,
          procedure()
          begin
            btnCreate.Text := i.ToString;
          end);
        // Sleep(5);

      end;
    end,

    procedure
    begin // OnComplete
      vtsList.EndUpdate;
      TLoading.Hide;
      btnCreate.Text := 'Finish';

    end,
    procedure(const AExceptionMessage: string)
    begin // OnError
      TLoading.Hide;
      showmessage(AExceptionMessage);
    end, False);
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  FrmMain.position := TFormPosition.MainFormCenter;
  btnCreate.Cursor := crhandpoint;
  btnCreate.Margins.Top := 3;
  btnCreate.Margins.Bottom := 3;
  btnCreate.Margins.Right := 3;

  btnClear.Cursor := crhandpoint;
  btnClear.Margins.Top := 3;
  btnClear.Margins.Bottom := 3;
  btnClear.Margins.Left := 3;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  // TLoading.('Espere ' + i.ToString);
end;

End.
