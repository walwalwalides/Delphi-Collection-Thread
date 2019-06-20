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
