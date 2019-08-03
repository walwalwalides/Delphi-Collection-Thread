{ ============================================
  Software Name : 	HelperThread
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides                     }
{ CopyRight © 2019                             }
{ Email : WalWalWalides@gmail.com              }
{ GitHub :https://github.com/walwalwalides     }
{ ******************************************** }

unit Helper.Loading;

interface

uses
  System.Classes,
  System.UITypes,
  System.UIConsts,
  System.SysUtils,

  FMX.Controls,
  FMX.Objects,
  FMX.Graphics,
  FMX.Layouts,
  FMX.Types,
  FMX.StdCtrls,
  FMX.Effects,
  FMX.Dialogs,
  FMX.Forms,
  FMX.Filter.Effects;

type
  TLoading = class
  private
  class var
    FLytBackground: TLayout;
    FRctBackground, FRctLoading: TRectangle;
    FSdwMessage: TShadowEffect;
    FLblMessage: TLabel;
    FAniIndicator: TAniIndicator;
    AFillRGBEffect: TFillRGBEffect;

    FStyleBook: TStyleBook;
    FParent: TControl;

    class var FAniColor: string;
    class var FBackgroundColor: string;
    class var FLblMessageColor: string;
    class var FLblMessageFontName: string;

    class procedure PrepareBackground(const aParent: TControl);
    class procedure FRctBackgroundClick(Sender: TObject);
    class procedure Resize();
  public
    class procedure Show(const AMsg, AFontName, AMessageColor, ABackgroundColor,
      AAniColor: String);
    class procedure ChangeMessage(const AMsg: String);
    class procedure Hide();
  end;

implementation

{ TMessage }

class procedure TLoading.ChangeMessage(const AMsg: String);
begin
  FLblMessage.Text := AMsg;
end;

class procedure TLoading.FRctBackgroundClick(Sender: TObject);
begin
{$IFDEF DEBUG}
  Hide();
{$ENDIF}
end;

class procedure TLoading.Hide;
begin
{$REGION 'Free Components'}
  if (AFillRGBEffect <> nil) then
  begin
    AFillRGBEffect.DisposeOf;
    AFillRGBEffect := nil;
  end;

  if (FAniIndicator <> nil) then
  begin
    FAniIndicator.DisposeOf;
    FAniIndicator := nil;
  end;

  if (FLblMessage <> nil) then
  begin
    FLblMessage.DisposeOf;
    FLblMessage := nil;
  end;

  if (FSdwMessage <> nil) then
  begin
    FSdwMessage.DisposeOf;
    FSdwMessage := nil;
  end;

  if (FRctLoading <> nil) then
  begin
    FRctLoading.DisposeOf;
    FRctLoading := nil;
  end;

  if (FRctBackground <> nil) then
  begin
    FRctBackground.DisposeOf;
    FRctBackground := nil;
  end;

  if (FLytBackground <> nil) then
  begin
    FLytBackground.SendToBack;
    FLytBackground.Parent := Nil;
    FLytBackground.DisposeOf;
    FLytBackground := nil;
  end;
{$ENDREGION}
  FParent.SetFocus;
end;

class procedure TLoading.PrepareBackground(const aParent: TControl);
begin
  FParent := aParent;

  FLytBackground := TLayout.Create(Application.MainForm);
  FLytBackground.Visible := False;
  FLytBackground.Width := aParent.Width;
  FLytBackground.Height := aParent.Height;

{$REGION 'FRctBackground'}
  FRctBackground := TRectangle.Create(Application.MainForm);
  FRctBackground.Stroke.Kind := TBrushKind.None;
  FRctBackground.Fill.Color := StringToAlphaColor('Black');
  FRctBackground.Align := TAlignLayout.Contents;
  FRctBackground.Parent := FLytBackground;
  FRctBackground.OnClick := FRctBackgroundClick;
{$ENDREGION}
//
{$REGION 'FRctLoading'}
  FRctLoading := TRectangle.Create(Application.MainForm);
  FRctLoading.Stroke.Kind := TBrushKind.None;
  FRctLoading.Fill.Color := StringToAlphaColor(FBackgroundColor);
  FRctLoading.Align := TAlignLayout.VertCenter;
  FRctLoading.Parent := FLytBackground;
  FRctLoading.Margins.Left := 20;
  FRctLoading.Margins.Right := 20;
  FRctLoading.XRadius := 8;
  FRctLoading.yRadius := 8;
  FRctLoading.BringToFront;
  FRctLoading.Height := 100;


  FSdwMessage := TShadowEffect.Create(Application.MainForm);
  FSdwMessage.Parent := FRctLoading;
{$ENDREGION}
//
{$REGION 'FAniIndicator'}
  FAniIndicator := TAniIndicator.Create(Application.MainForm);
  FAniIndicator.Enabled := True;
  FAniIndicator.Parent := Application.MainForm;
  FAniIndicator.Align := TAlignLayout.Client;
  FAniIndicator.Margins.Left := 0;
  FAniIndicator.Margins.Right := 0;
  FAniIndicator.Width:=500;
  FAniIndicator.Height:=500;


 {$ENDREGION}

//
{$REGION 'FAniIndicator'}
  AFillRGBEffect := TFillRGBEffect.Create(Application.MainForm);
  AFillRGBEffect.Parent := FAniIndicator;
  AFillRGBEffect.Enabled := True;
  AFillRGBEffect.Color := StringToAlphaColor(FAniColor);
  // );
{$ENDREGION}
//
{$REGION 'FLblMessage'}
  FLblMessage := TLabel.Create(Application.MainForm);
  FLblMessage.Parent := Application.MainForm;
  FLblMessage.Align := TAlignLayout.Client;
  FLblMessage.Margins.Bottom := 5;
  FLblMessage.Margins.Left := 5;
  FLblMessage.Margins.Right := 5;
  FLblMessage.Margins.Top := 5;
  FLblMessage.StyledSettings := [];
  FLblMessage.AutoSize := True;
  FLblMessage.Font.Style := [TFontStyle.fsBold];
  FLblMessage.TextSettings.Font.Family := FLblMessageFontName;
  FLblMessage.TextSettings.Font.Size := 8;
  FLblMessage.TextSettings.FontColor := StringToAlphaColor(FLblMessageColor);
  // );
  FLblMessage.TextSettings.HorzAlign := TTextAlign.Center;
{$ENDREGION}
  FLytBackground.Visible := True;

  FLytBackground.Opacity := 0;
  FRctBackground.Opacity := 0;

  FLytBackground.Visible := True;
  FRctBackground.Visible := True;

  FLytBackground.Parent := Application.MainForm;
  FLytBackground.Align := TAlignLayout.Contents;

  FRctBackground.AnimateFloat('opacity', 0.3);
  FLytBackground.AnimateFloat('opacity', 1);

  FAniIndicator.Enabled := True;

  FLytBackground.BringToFront;
  FAniIndicator.BringToFront;
  FLytBackground.SetFocus;
end;

class procedure TLoading.Resize();
begin
  FRctLoading.Height := FLblMessage.Height + FLblMessage.Margins.Bottom + FLblMessage.Margins.Top;

  if (FRctLoading.Height > FLytBackground.Height) then
    FRctLoading.Height := FLytBackground.Height - 20
  else if (FRctLoading.Height < 40) then
    FRctLoading.Height := 40;
end;

class procedure TLoading.Show(const AMsg, AFontName, AMessageColor,
  ABackgroundColor, AAniColor: String);
begin
  FAniColor := AAniColor;
  FBackgroundColor := ABackgroundColor;
  FLblMessageColor := AMessageColor;
  FLblMessageFontName := AFontName;

  PrepareBackground(TControl(Application.MainForm));
  FLblMessage.Text := AMsg;
  Resize();
end;

end.
