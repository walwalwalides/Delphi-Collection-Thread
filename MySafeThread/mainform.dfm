object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 518
  ClientWidth = 794
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 408
    Top = 32
    Width = 369
    Height = 457
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 48
    Top = 72
    Width = 193
    Height = 25
    Caption = 'InitLsit'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 48
    Top = 103
    Width = 193
    Height = 25
    Caption = 'StartThread1'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 48
    Top = 134
    Width = 193
    Height = 25
    Caption = 'StartThread2'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 48
    Top = 165
    Width = 193
    Height = 25
    Caption = 'StopAllThread'
    TabOrder = 4
    OnClick = Button4Click
  end
end
