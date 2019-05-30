object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 498
  ClientWidth = 565
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MMMain
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object memDisplay: TMemo
    AlignWithMargins = True
    Left = 215
    Top = 3
    Width = 347
    Height = 492
    Align = alClient
    TabOrder = 0
    ExplicitTop = -2
  end
  object ScrollBox1: TScrollBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 206
    Height = 492
    Align = alLeft
    TabOrder = 1
    ExplicitTop = -2
    object btnInitialization: TButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 196
      Height = 25
      Cursor = crHandPoint
      Align = alTop
      Caption = 'Initialization'
      TabOrder = 0
      OnClick = btnInitializationClick
      ExplicitLeft = -2
      ExplicitTop = 24
      ExplicitWidth = 193
    end
    object btnThread1: TButton
      AlignWithMargins = True
      Left = 3
      Top = 34
      Width = 196
      Height = 25
      Cursor = crHandPoint
      Align = alTop
      Caption = 'Thread N'#176'1'
      TabOrder = 1
      OnClick = btnThread1Click
      ExplicitTop = 103
      ExplicitWidth = 193
    end
    object btnThread2: TButton
      AlignWithMargins = True
      Left = 3
      Top = 65
      Width = 196
      Height = 25
      Cursor = crHandPoint
      Align = alTop
      Caption = 'Thread N'#176'2'
      TabOrder = 2
      OnClick = btnThread2Click
      ExplicitLeft = 6
      ExplicitTop = 134
      ExplicitWidth = 193
    end
    object btnStopThreads: TButton
      AlignWithMargins = True
      Left = 3
      Top = 96
      Width = 196
      Height = 25
      Cursor = crHandPoint
      Align = alTop
      Caption = 'Stop All Thread'
      TabOrder = 3
      OnClick = btnStopThreadsClick
      ExplicitLeft = 6
      ExplicitTop = 165
      ExplicitWidth = 193
    end
  end
  object MMMain: TMainMenu
    Left = 32
    Top = 384
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
      Caption = '&User'
      object N5: TMenuItem
        Action = acAddUser
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
  object aclstMain: TActionList
    Left = 97
    Top = 384
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
    object acAddUser: TAction
      Category = 'User'
      Caption = '&Add'
      ShortCut = 16449
    end
  end
end
