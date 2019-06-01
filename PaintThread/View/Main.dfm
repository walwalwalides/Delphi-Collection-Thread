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
  DesignSize = (
    556
    406)
  PixelsPerInch = 96
  TextHeight = 13
  object lblRedCounter: TLabel
    Left = 220
    Top = 8
    Width = 97
    Height = 45
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
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
  object BitbtnStart: TBitBtn
    Left = 8
    Top = 59
    Width = 100
    Height = 25
    Cursor = crHandPoint
    Anchors = [akRight, akBottom]
    Caption = 'START'
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003827174D0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B8824DFF3827174D00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B8824DFFB8824DFF3827174D000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B8824DFFB8824DFFB8824DFF3827174D0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B8824DFFB8824DFFB8824DFFB8824DFF3827
      174D000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B8824DFFB8824DFFB8824DFFB8824DFFB882
      4DFF3827174D0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B8824DFFB8824DFFB8824DFFB8824DFFB882
      4DFFB8824DFF3827174D00000000000000000000000000000000000000000000
      0000000000000000000000000000B8824DFFB8824DFFB8824DFFB8824DFFB882
      4DFFB8824DFFB8824DFF3827174D000000000000000000000000000000000000
      0000000000000000000000000000B8824DFFB8824DFFB8824DFFB8824DFFB882
      4DFFB8824DFF3827174D00000000000000000000000000000000000000000000
      0000000000000000000000000000B8824DFFB8824DFFB8824DFFB8824DFFB882
      4DFF3827174D0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B8824DFFB8824DFFB8824DFFB8824DFF3827
      174D000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B8824DFFB8824DFFB8824DFF3827174D0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B8824DFFB8824DFF3827174D000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B8824DFF3827174D00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003827174D0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    TabOrder = 1
    OnClick = BitbtnStartClick
  end
  object BitBtnSTOP: TBitBtn
    Left = 114
    Top = 59
    Width = 100
    Height = 25
    Cursor = crHandPoint
    Anchors = [akRight, akBottom]
    Caption = 'STOP'
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      20000000000000040000000000000000000000000000000000003827174D3827
      174D3827174D3827174D3827174D3827174D3827174D3827174D3827174D3827
      174D3827174D3827174D3827174D3827174D3827174D3827174D3827174D3827
      174D3827174D3827174D3827174D3827174D3827174D3827174D3827174D3827
      174D3827174D3827174D3827174D3827174D3827174D3827174D3827174D3827
      174D3827174D3827174D3827174D3827174D3827174D3827174D3827174D3827
      174D3827174D3827174D3827174D3827174D3827174D3827174D3827174D3827
      174D3827174D3827174D3827174D3827174D3827174D3827174D3827174D3827
      174D3827174D3827174D3827174D3827174D3827174D3827174D3827174D3827
      174D3827174D3827174DB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
      4DFFB8824DFFB8824DFF3827174D3827174D3827174D3827174D3827174D3827
      174D3827174D3827174DB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
      4DFFB8824DFFB8824DFF3827174D3827174D3827174D3827174D3827174D3827
      174D3827174D3827174DB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
      4DFFB8824DFFB8824DFF3827174D3827174D3827174D3827174D3827174D3827
      174D3827174D3827174DB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
      4DFFB8824DFFB8824DFF3827174D3827174D3827174D3827174D3827174D3827
      174D3827174D3827174DB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
      4DFFB8824DFFB8824DFF3827174D3827174D3827174D3827174D3827174D3827
      174D3827174D3827174DB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
      4DFFB8824DFFB8824DFF3827174D3827174D3827174D3827174D3827174D3827
      174D3827174D3827174DB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
      4DFFB8824DFFB8824DFF3827174D3827174D3827174D3827174D3827174D3827
      174D3827174D3827174DB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
      4DFFB8824DFFB8824DFF3827174D3827174D3827174D3827174D3827174D3827
      174D3827174D3827174D3827174D3827174D3827174D3827174D3827174D3827
      174D3827174D3827174D3827174D3827174D3827174D3827174D3827174D3827
      174D3827174D3827174D3827174D3827174D3827174D3827174D3827174D3827
      174D3827174D3827174D3827174D3827174D3827174D3827174D3827174D3827
      174D3827174D3827174D3827174D3827174D3827174D3827174D3827174D3827
      174D3827174D3827174D3827174D3827174D3827174D3827174D3827174D3827
      174D3827174D3827174D3827174D3827174D3827174D3827174D3827174D3827
      174D3827174D3827174D3827174D3827174D3827174D3827174D}
    TabOrder = 2
    OnClick = BitBtnSTOPClick
  end
  object tbarThreadPriority: TTrackBar
    Left = 8
    Top = 8
    Width = 206
    Height = 45
    Max = 6
    Position = 3
    TabOrder = 3
    OnChange = tbarThreadPriorityChange
  end
  object BitBtnClear: TBitBtn
    Left = 220
    Top = 59
    Width = 100
    Height = 25
    Cursor = crHandPoint
    Anchors = [akRight, akBottom]
    Caption = 'CLEAR'
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000251A0F33B8824DFFB8824DFFB8824DFFB8824DFF00000000000000000000
      000000000000000000000000000000000000000000000000000000000000251A
      0F33B8824DFFB8824DFFB8824DFFB8824DFF251A0F3300000000000000000000
      0000000000000000000000000000000000000000000000000000251A0F33B882
      4DFFB8824DFFB8824DFFB8824DFF251A0F33151E414D4463D8FF4463D8FF151E
      414D000000000000000000000000000000000000000000000000B8824DFFB882
      4DFFB8824DFFB8824DFF251A0F33151E414D4463D8FF4463D8FF4463D8FF4463
      D8FF151E414D0000000000000000000000000000000000000000B8824DFFB882
      4DFFB8824DFF251A0F33151E414D4463D8FF4463D8FF4463D8FF4463D8FF4463
      D8FF4463D8FF151E414D00000000000000000000000000000000251A0F33B882
      4DFF251A0F33151E414D4463D8FF4463D8FF4463D8FF4463D8FF4463D8FF4463
      D8FF4463D8FF4463D8FF151E414D000000000000000000000000000000000000
      0000000000004463D8FF4463D8FF4463D8FF4463D8FF4463D8FF4463D8FF4463
      D8FF4463D8FF4463D8FF4463D8FF151E414D0000000000000000000000000000
      0000000000004463D8FF4463D8FF4463D8FF4463D8FF4463D8FF4463D8FF4463
      D8FF4463D8FF4463D8FF4463D8FF4463D8FF151E414D00000000000000000000
      000000000000151E414D4463D8FF4463D8FF4463D8FF4463D8FF4463D8FF4463
      D8FF4463D8FF4463D8FF4463D8FF4463D8FF4463D8FF00000000000000000000
      00000000000000000000151E414D4463D8FF4463D8FF4463D8FF4463D8FF4463
      D8FF4463D8FF4463D8FF4463D8FF4463D8FF4463D8FF00000000000000000000
      0000000000000000000000000000151E414D4463D8FF4463D8FF4463D8FF4463
      D8FF4463D8FF4463D8FF4463D8FF4463D8FF151E414D00000000000000000000
      000000000000000000000000000000000000151E414D4463D8FF4463D8FF4463
      D8FF4463D8FF4463D8FF4463D8FF151E414D0000000000000000000000000000
      00000000000000000000000000000000000000000000151E414D4463D8FF4463
      D8FF4463D8FF4463D8FF151E414D000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000151E414D4463
      D8FF4463D8FF151E414D00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    TabOrder = 4
    OnClick = BitBtnClearClick
  end
  object MMMain: TMainMenu
    Left = 16
    Top = 275
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
    Left = 17
    Top = 328
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
end