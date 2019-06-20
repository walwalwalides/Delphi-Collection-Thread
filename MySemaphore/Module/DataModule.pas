{ ============================================
  Software Name : 	MySemaphore
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides }
{ CopyRight © 2019 }
{ Email : WalWalWalides@gmail.com }
{ GitHub :https://github.com/walwalwalides }
{ ******************************************** }
unit DataModule;

interface

uses
  System.SysUtils, System.Classes;

type
  TDMMain = class(TDataModule)
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    boolbreak: Boolean;
    function AddUser(Auser, Apassword: string): Boolean;
  end;

var
  DMMain: TDMMain;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}
{ TDataModule1 }

function TDMMain.AddUser(Auser, Apassword: string): Boolean;
begin
  //
  Result:=True;
end;

end.
