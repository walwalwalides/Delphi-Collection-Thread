program HandShakeThread;

uses
  Forms,
  First in 'View\First.pas' {frmFirst},
  Second in 'View\Second.pas' {frmSecond},
  About in 'About\About.pas' {frmAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmFirst, frmFirst);
  Application.Run;
end.
