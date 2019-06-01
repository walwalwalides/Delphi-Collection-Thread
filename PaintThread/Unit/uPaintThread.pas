{ ============================================
  Software Name : 	PaintThread
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides }
{ CopyRight © 2019 }
{ Email : WalWalWalides@gmail.com }
{ GitHub :https://github.com/walwalwalides }
{ ******************************************** }
unit uPaintThread;

interface

uses
  Classes, Graphics, SysUtils, StdCtrls;

type
  TPaintThread = class(TThread)
  private
    { Déclarations privées }
    PT_iColor: integer;
    PT_lblDisplay: TLabel;
    PT_iCounter: double;
    procedure UpdateText;
  protected

    procedure Execute; override;
    procedure paint;

  public
    constructor Create(iCouleur: integer; LabelCompteur: TLabel);
  end;

resourcestring
  StartPaint = 'START PAINT';
  StopPaint = 'STOP PAINT';

implementation

uses Main;

constructor TPaintThread.Create(iCouleur: integer; LabelCompteur: TLabel);
begin
  inherited Create(False);
  PT_iColor := iCouleur;
  PT_lblDisplay := LabelCompteur;
  PT_iCounter := 0;
end;

{ TPaintThread }

procedure TPaintThread.Execute;
begin

  Randomize;
  while not Terminated do
  begin
    PT_iCounter := PT_iCounter + 1;
    Synchronize(paint);
    Synchronize(UpdateText);
  end;
end;

procedure TPaintThread.UpdateText;
begin
if (not Terminated )then

  FrmMain.Caption := StartPaint
  else
     FrmMain.Caption := StopPaint;

end;

procedure TPaintThread.paint;
begin
  FrmMain.Canvas.Pixels[random(FrmMain.Width), random(FrmMain.Height)] := PT_iColor;
  PT_lblDisplay.Caption := FloatToStr(PT_iCounter);
  Synchronize(UpdateText);
end;

end.
