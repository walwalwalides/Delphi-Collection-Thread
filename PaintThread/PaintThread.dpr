program PaintThread;

uses
  Forms,
  Main in 'View\Main.pas' {frmMain},
  About in 'About\About.pas' {frmAbout},
  uPaintThread in 'Unit\uPaintThread.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.Run;
end.
