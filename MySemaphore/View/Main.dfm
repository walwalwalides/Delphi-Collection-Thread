object frmMain: TfrmMain
  Left = 425
  Top = 292
  BorderStyle = bsSingle
  ClientHeight = 406
  ClientWidth = 556
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MMMain
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    556
    406)
  PixelsPerInch = 96
  TextHeight = 13
  object prgbrMain: TProgressBar
    AlignWithMargins = True
    Left = 3
    Top = 386
    Width = 550
    Height = 17
    Align = alBottom
    Step = 1
    TabOrder = 0
  end
  object BitbtnAdd: TBitBtn
    Left = 10
    Top = 177
    Width = 100
    Height = 25
    Cursor = crHandPoint
    Anchors = [akRight, akBottom]
    Caption = 'Add'
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B07C
      4AF4B8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
      4DFFB8824DFFB8824DFFB8824DFFB8824DFFB07C4AF400000000000000009E70
      42DBB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
      4DFFB8824DFFB8824DFFB8824DFFB8824DFF9E7042DB00000000000000003727
      174CB47F4BF9B8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
      4DFFB8824DFFB8824DFFB8824DFFB47F4BF93727174C00000000000000000000
      000024190F32835C37B5B5804CFBB8824DFF745231A120170E2D20170E2D7452
      31A1B8824DFFB5804CFB835C37B524190F320000000000000000000000000000
      000000000000000000000C09051166482B8D0403020600000000000000000403
      020666482B8D0C09051100000000000000000000000000000000000000000000
      00000000000000000000000000000000000045301D5F91663DC991663DC94530
      1D5F000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000002D20133FB47F4BFAB8824DFFB8824DFFB47F
      4BFA2D20133F0000000000000000000000000000000000000000000000000000
      00000000000000000000000000008D633BC3B8824DFFB8824DFFB8824DFFB882
      4DFF8D633BC30000000000000000000000000000000000000000000000000000
      00000000000000000000291D1139B7814CFDB8824DFFB8824DFFB8824DFFB882
      4DFFB7814CFD281D113800000000000000000000000000000000000000000000
      0000000000000000000062452988B8824DFFB8824DFFB8824DFFB8824DFFB882
      4DFFB8824DFF6245298800000000000000000000000000000000000000000000
      000000000000000000002E211340B8824DFFB8824DFFB8824DFFB8824DFFB882
      4DFFB8824DFF2F21144100000000000000000000000000000000000000000000
      000000000000000000001E150C29B8824DFFB8824DFFB8824DFFB8824DFFB882
      4DFFB8824DFF1E150D2A00000000000000000000000000000000000000000000
      0000000000000000000003020104A87746E9B8824DFFB8824DFFB8824DFFB882
      4DFFA97747EA0403020600000000000000000000000000000000000000000000
      0000000000000000000000000000281D11388E643BC5B17D4AF5B17D4AF59066
      3CC82D20133F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    TabOrder = 1
    OnClick = BitbtnAddClick
  end
  object BitBtnView: TBitBtn
    Left = 116
    Top = 177
    Width = 100
    Height = 25
    Cursor = crHandPoint
    Anchors = [akRight, akBottom]
    Caption = 'View'
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B27E4BF7B8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
      4DFFB8824DFFB8824DFFB27E4BF7000000000000000000000000000000000000
      0000000000007A5633A9B8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
      4DFFB8824DFFB8824DFF805A35B1000000000000000000000000000000000000
      000000000000050402075C412780A37344E2A57445E43928184F3928184FA574
      45E4A37344E25C41278006050309000000000000000000000000B27E4BF7B882
      4DFFB8824DFFA77646E85C41267F0302010420170E2D2D20133E2D20133E2117
      0E2E030201045C41267FA77646E8B8824DFFB8824DFFB27E4BF77A5633A9B882
      4DFFB8824DFFB8824DFFB8824DFF523A2272543B2374B8824DFFB8824DFF543B
      2374523A2272B8824DFFB8824DFFB8824DFFB8824DFF805A35B1050402075C41
      2780A37344E2A57445E43526164A0B08050FB27D4AF6B8824DFFB8824DFFB27D
      4AF60B08050F3526164AA57445E4A37344E25C41278006050309000000000000
      00000302010420170E2D18110A21563D2477B8824DFFB8824DFFB8824DFFB882
      4DFF563D247718110A2121170E2E030201040000000000000000000000000000
      000000000000543B2374795633A83F2C1A57B8824DFFB8824DFFB8824DFFB882
      4DFF3F2C1A57795633A8543B2374000000000000000000000000000000000000
      00000B08050FB27D4AF692673DCA261B1035B8824DFFB8824DFFB8824DFFB882
      4DFF261B103592673DCAB27D4AF60B08050F0000000000000000000000000000
      0000563D2477B8824DFFB7814DFE01010001704F2F9BAF7C49F3AF7C49F37351
      309F01010102B7814CFDB8824DFF563D24770000000000000000000000000000
      00003F2C1A57B8824DFFB8824DFF94693ECD48331E6403020104030201044531
      1D6091663DC9B8824DFFB8824DFF3F2C1A570000000000000000000000000000
      0000261B1035B8824DFFB8824DFFB8824DFFB8824DFF261B1035261B1035B882
      4DFFB8824DFFB8824DFFB8824DFF261B10350000000000000000000000000000
      000001010001704F2F9BAF7C49F3AF7C49F37351309F0101010201010001704F
      2F9BAF7C49F3AF7C49F37351309F010101020000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    TabOrder = 2
    OnClick = BitBtnViewClick
  end
  object grpBoxMain: TGroupBox
    AlignWithMargins = True
    Left = 10
    Top = 15
    Width = 536
    Height = 159
    Margins.Left = 10
    Margins.Top = 15
    Margins.Right = 10
    Margins.Bottom = 0
    ParentCustomHint = False
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Font.Quality = fqClearTypeNatural
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 3
    ExplicitLeft = 17
    ExplicitTop = 20
    DesignSize = (
      536
      159)
    object lblUser: TLabel
      Left = 12
      Top = 40
      Width = 26
      Height = 13
      Caption = 'User'
    end
    object lblPassword: TLabel
      Left = 12
      Top = 67
      Width = 55
      Height = 13
      Caption = 'Password'
    end
    object lblPassword2: TLabel
      Left = 12
      Top = 94
      Width = 88
      Height = 18
      Caption = 'Password conf'#176
    end
    object edtPassword: TEdit
      AlignWithMargins = True
      Left = 124
      Top = 64
      Width = 394
      Height = 21
      Hint = 'Password'
      Margins.Right = 10
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Font.Quality = fqClearTypeNatural
      ParentFont = False
      ParentShowHint = False
      PasswordChar = '*'
      ShowHint = True
      TabOrder = 1
      TextHint = 'Password'
    end
    object edtSecPassword: TEdit
      AlignWithMargins = True
      Left = 124
      Top = 91
      Width = 394
      Height = 21
      Hint = 'Confirm Password'
      Margins.Right = 10
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Font.Quality = fqClearTypeNatural
      ParentFont = False
      ParentShowHint = False
      PasswordChar = '*'
      ShowHint = True
      TabOrder = 2
      TextHint = 'Password'
    end
    object edtUser: TEdit
      AlignWithMargins = True
      Left = 124
      Top = 37
      Width = 394
      Height = 21
      Hint = 'User'
      Margins.Right = 10
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Font.Quality = fqClearTypeNatural
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TextHint = 'User'
    end
  end
  object MMMain: TMainMenu
    Left = 32
    Top = 227
    object File1: TMenuItem
      Caption = '&File'
      object Exit1: TMenuItem
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit2: TMenuItem
        Action = actExit
      end
    end
    object N4: TMenuItem
      Caption = '&Dispaly'
      object N5: TMenuItem
      end
    end
    object N3: TMenuItem
      Caption = '&Option'
    end
    object A2: TMenuItem
      Caption = '&About'
      object N2: TMenuItem
        Caption = '-'
      end
      object actAbout1: TMenuItem
        Action = actAbout
      end
    end
  end
  object acMainList: TActionList
    Left = 129
    Top = 232
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
      ShortCut = 16453
      OnExecute = actExitExecute
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
    end
  end
  object AppEvtMain: TApplicationEvents
    OnIdle = AppEvtMainIdle
    Left = 48
    Top = 280
  end
end
