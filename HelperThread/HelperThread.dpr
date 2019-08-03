program HelperThread;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Main.pas' {FrmMain},
  Helper.Loading in 'Helper\Helper.Loading.pas',
  Helper.Thread in 'Helper\Helper.Thread.pas',
  About in 'About\About.pas' {frmAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
