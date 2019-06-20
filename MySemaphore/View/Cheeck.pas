{ ============================================
  Software Name : 	MySemaphore
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides                     }
{ CopyRight © 2019                             }
{ Email : WalWalWalides@gmail.com              }
{ GitHub :https://github.com/walwalwalides     }
{ ******************************************** }

unit Cheeck;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TfrmCheeck = class(TForm)
    ProgressBar1: TProgressBar;
    lblProg: TLabel;
    function InvokeDisplay(Name: string): TProgressBar;
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;



implementation


{$R *.dfm}
{ TSemaphoreForm }

procedure TfrmCheeck.FormResize(Sender: TObject);
begin
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 8 + 15;
end;



function TfrmCheeck.InvokeDisplay(Name: string): TProgressBar;
begin
  lblProg.Caption := Name;
  Result := self.ProgressBar1;
end;



end.
