object frmFirst: TfrmFirst
  Left = 499
  Top = 372
  BorderStyle = bsSingle
  Caption = 'HandShakeThread'
  ClientHeight = 376
  ClientWidth = 408
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MMMain
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 402
    Height = 370
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 385
    ExplicitHeight = 351
    object GroupBox1: TGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 394
      Height = 289
      Align = alClient
      Caption = 'Calcule: '
      TabOrder = 0
      ExplicitTop = 0
      ExplicitWidth = 377
      ExplicitHeight = 241
      object Label2: TLabel
        Left = 20
        Top = 32
        Width = 30
        Height = 13
        Caption = 'Value:'
      end
      object edtEnterValue: TEdit
        Left = 86
        Top = 29
        Width = 205
        Height = 21
        MaxLength = 8
        TabOrder = 0
      end
      object btnCalcule: TButton
        Left = 297
        Top = 29
        Width = 72
        Height = 21
        Cursor = crHandPoint
        Caption = '&Enter'
        Default = True
        TabOrder = 1
        OnClick = btnCalculeClick
      end
      object RadGrpPower: TRadioGroup
        Left = 86
        Top = 56
        Width = 205
        Height = 193
        Caption = 'Power'
        ItemIndex = 0
        Items.Strings = (
          '0'
          '1'
          '2'
          '3')
        TabOrder = 2
      end
    end
    object GroupBox2: TGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 299
      Width = 394
      Height = 67
      Align = alBottom
      Caption = 'Result'
      TabOrder = 1
      ExplicitTop = 280
      ExplicitWidth = 377
      object Label1: TLabel
        Left = 20
        Top = 33
        Width = 30
        Height = 13
        Caption = 'Value:'
      end
      object stResult: TStaticText
        Left = 86
        Top = 32
        Width = 283
        Height = 17
        AutoSize = False
        BevelInner = bvNone
        BevelKind = bkSoft
        TabOrder = 0
      end
    end
  end
  object MMMain: TMainMenu
    Left = 344
    Top = 227
    object File1: TMenuItem
      Caption = '&File'
      object Exit1: TMenuItem
        Action = actExit
        ShortCut = 16453
      end
      object N1: TMenuItem
        Caption = '-'
      end
    end
    object N4: TMenuItem
      Caption = '&Dispaly'
      object N5: TMenuItem
        Action = acSecond
      end
    end
    object N3: TMenuItem
      Caption = '&Option'
    end
    object A2: TMenuItem
      Caption = '&About'
      object actAbout1: TMenuItem
        Action = actAbout
      end
      object N2: TMenuItem
        Caption = '-'
      end
    end
  end
  object acMainList: TActionList
    Left = 361
    Top = 168
    object actOpenFile: TAction
      Category = 'File'
      Caption = 'Open File(s)...'
    end
    object actShowInExplorer: TAction
      Caption = 'Show in Explorer'
    end
    object actOpenFolder: TAction
      Category = 'File'
      Caption = 'Open Folder(s)...'
    end
    object actExit: TAction
      Category = 'File'
      Caption = 'Exit'
    end
    object actOption: TAction
      Category = 'Option'
      Caption = 'Option'
      ShortCut = 16463
    end
    object actAbout: TAction
      Category = 'About'
      Caption = 'Info'
      ShortCut = 16457
      OnExecute = actAboutExecute
    end
    object acSecond: TAction
      Category = 'Display'
      Caption = '&Second'
      ShortCut = 16467
      OnExecute = acSecondExecute
    end
  end
end
