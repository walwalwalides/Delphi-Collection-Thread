program MySemaphore;

uses
  Forms,
  Main in 'View\Main.pas' {frmMain},
  About in 'About\About.pas' {frmAbout},
  Cheeck in 'View\Cheeck.pas' {frmCheeck},
  DataModule in 'Module\DataModule.pas' {DMMain: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDMMain, DMMain);
  Application.Run;
end.
