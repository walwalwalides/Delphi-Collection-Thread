program ProgressThreadTimer;

uses
  Forms,
  Main in 'View\Main.pas' {frmMain},
  About in 'About\About.pas' {frmAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.Run;
end.
