program MySafeThread;

uses
  Vcl.Forms,
  Main in 'View\Main.pas' {frmMain},
  About in 'About\About.pas' {frmAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
