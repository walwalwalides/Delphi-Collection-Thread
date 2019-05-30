{ ============================================
  Software Name : 	HandShakeThread
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides                     }
{ CopyRight © 2019                             }
{ Email : WalWalWalides@gmail.com              }
{ GitHub :https://github.com/walwalwalides     }
{ ******************************************** }
unit Second;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmSecond = class(TForm)
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmSecond: TfrmSecond;

implementation

uses
  First;

{$R *.dfm}

procedure TfrmSecond.Button1Click(Sender: TObject);
begin
 ShowMessage(frmFirst.SharedBuffer);
end;

procedure TfrmSecond.FormCreate(Sender: TObject);
begin
  frmSecond.Position := poScreenCenter;
  frmSecond.WindowState := wsNormal;
  frmSecond.Color:=clWhite;
end;

procedure TfrmSecond.FormShow(Sender: TObject);
begin
frmSecond.Left:= frmFirst.Left;
frmSecond.Top:= frmFirst.Top;
frmSecond.Width:=frmFirst.Width;
frmSecond.Height:=frmFirst.Height;

end;

end.
