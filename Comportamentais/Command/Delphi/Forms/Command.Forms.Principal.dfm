object frmPrincipal: TfrmPrincipal
  Left = 192
  Top = 125
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Command'
  ClientHeight = 390
  ClientWidth = 649
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object LabelProgramas: TLabel
    Left = 8
    Top = 120
    Width = 65
    Height = 13
    Caption = 'Programas:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelProcessos: TLabel
    Left = 224
    Top = 120
    Width = 60
    Height = 13
    Caption = 'Processos:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelVariaveisAmbiente: TLabel
    Left = 440
    Top = 120
    Width = 130
    Height = 13
    Caption = 'Vari'#225'veis de Ambiente:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox: TGroupBox
    Left = 8
    Top = 2
    Width = 633
    Height = 51
    Caption = 'Extrair Informa'#231#245'es: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object CheckBoxProgramas: TCheckBox
      Left = 16
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Programas'
      TabOrder = 0
    end
    object CheckBoxProcessos: TCheckBox
      Left = 232
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Processos'
      TabOrder = 1
    end
    object CheckBoxVariaveisAmbiente: TCheckBox
      Left = 416
      Top = 24
      Width = 193
      Height = 17
      Caption = 'Vari'#225'veis de Ambiente'
      TabOrder = 2
    end
  end
  object MemoProgramas: TMemo
    Left = 8
    Top = 136
    Width = 200
    Height = 250
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object MemoProcessos: TMemo
    Left = 224
    Top = 136
    Width = 200
    Height = 250
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object BitBtnExecutarComandos: TBitBtn
    Left = 240
    Top = 64
    Width = 169
    Height = 41
    Caption = 'Executar Comandos'
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFA87D78B78183B78183B78183B78183B78183B78183B78183B78183B781
      83B78183B78183B78183B78183B78183B78183B78183B78183B78183FF00FFFF
      00FFFF00FFFF00FFFF00FFA97F79FFE4C7FFE3C5FEE2C2FEE1C0FEE0BDFEDFBA
      FEDEB8FEDDB6FEDBB4FEDAB3FED9B1FED9AFFED8ADFED7ABFED7ABFED7ABFED7
      ABB3897BFF00FFFF00FFFF00FFFF00FFFF00FFA97F7AFEE6CBFEE5C8FFE3C5FE
      E2C3FEE1C0FEE0BDFEDFBCFEDEB9FEDDB7FEDBB4FEDAB2FEDAB1FED9B0FED9AE
      FED8ACFED7ABFED7ABB3897BFF00FFFF00FFFF00FFFF00FFFF00FFA97F7AFFE8
      CFFEE7CCFEE5C9FEE4C6FEE3C3FEE1C1FEE1BFFEDFBCFEDEBAFEDDB7FEDCB600
      9900FEDAB1FFD9B0FED9AEFED8ADFED8ACB3897BFF00FFFF00FFFF00FFFF00FF
      FF00FFA97F7AFFEAD2FEE8CFFFE7CCFFE6CAFEE4C7FEE3C4FEE2C2FFE1BFFEDF
      BDFEDEBB009900009900009900FEDBB2FEDAB1FED8AEFED8ADB3897BFF00FFFF
      00FFFF00FFFF00FFFF00FFA97F7BFFEBD6FEEAD3DF993EDF993EDF993EDF993E
      DF993EDF993EFEE1C00099004B903C7EA45E0099006F9C51FEDAB2FED9B0FED9
      AFB3897BFF00FFFF00FFFF00FFFF00FFFF00FFAA807BFFEDD9FFEBD7FFEBD4FE
      E9D1FEE7CEFEE7CBFFE5C9FEE4C6FFE3C3009900F8DDBAFFDFBCC0C28D009900
      009900FAD9B0FEDAB1B3897BFF00FFFF00FFFF00FFFF00FFFF00FFAD837DFFEF
      DDFEEEDAFFECD8FEEBD5FEEAD1FEE8CFFEE7CCFFE6CAFEE4C6FEE3C4FEE2C2FE
      E0BFFEDFBDF2D9B2009900009900FFDBB3B3897BFF00FFFF00FFFF00FFFF00FF
      FF00FFB2887EFFF0E1FEF0DEFEEEDBFEECD9FEEBD6FEEAD3FFE8D0FEE7CDFFE6
      CBFEE4C7FEE3C5FEE2C2FEE0C0FEE0BDFEDEBBFFDEB8FEDCB6B3897BFF00FFFF
      00FFFF00FFFF00FFFF00FFB68B80FEF2E4FFF1E1FEEFDEFEEEDCFFEDD9FEECD7
      FFEAD3FEE9D1FEE8CEFEE6CBFFE5C8009900FEE2C3FEE2C0FEE0BDFEDFBBFEDE
      B9B3897BFF00FFFF00FFFF00FFFF00FFFF00FFBA8E82FFF4E7FEF2E5FEF1E2FF
      F0DFFFEEDCFFEDDAFEECD7FFEAD4FEEAD1FEE8CF009900009900009900FFE3C3
      FEE1C1FEE1BFFEDFBCB3897CFF00FFFF00FFFF00FFFF00FFFF00FFBE9283FFF5
      EBFFF5E9DF993EDF993EDF993EDF993EDF993EDF993EFFEBD50099004B93417E
      A9670099006FA058FEE3C5FEE2C2FEE0BFB48A7DFF00FFFF00FFFF00FFFF00FF
      FF00FFC29685FFF7EEFFF5ECFFF4E9FEF3E7FFF2E4FFF0E1FFEFDEFEEEDCFEED
      D8009900F8E7CEFEE9D0C0C99C009900009900FAE2C2FEE2C2B48B7EFF00FFFF
      00FFFF00FFFF00FFFF00FFC69986FFF9F1FFF7EFFFF6EDFFF5E9FEF3E7FFF2E4
      FFF1E2FFF0DFFEEFDCFFEDDAFEECD6FFEAD4FFE9D0F2E2C5009900009900FEE4
      C6B18A7FFF00FFFF00FFFF00FFFF00FFFF00FFCA9C88FFFAF3FEF9F2FEF8F0FF
      F6EDFEF5EBFFF4E8FFF2E6FFF1E2FEF0E0FEEFDDFEEEDAFEECD8FFEBD4FEEAD2
      FEE8CFFEE7CCFEE5CAA0847DFF00FFFF00FFFF00FFFF00FFFF00FFCEA089FFFB
      F6FFFAF5FFF9F2FFF8EFFFF7EDFEF6ECFFF5E8FFF3E6FFF1E3FFF1E0FFEFDE00
      9900FEEDD8FEEBD5FFEAD3FFE8D0FEE8CD98817CFF00FFFF00FFFF00FFFF00FF
      FF00FFD2A38AFFFDF9FEFBF7FFFAF5FFF9F3FFF8F1FFF7EEFFF6ECFFF4EAFFF4
      E6FEF2E4009900009900009900FFEDD9FFECD7FEEAD4FFE9D09C837EFF00FFFF
      00FFFF00FFFF00FFFF00FFD7A78CFFFDFBFFFCFADF993EDF993EDF993EDF993E
      DF993EDF993EFEF5EA0099004B95477EAE710099006FA562FFEDDAFFECD7FFEB
      D4AD8274FF00FFFF00FFFF00FFFF00FFFF00FFDAAB8DFFFEFDFFFEFCFFFCFAFF
      FBF8FEFBF6FFFAF4FFF8F2FFF7F0FEF6ED009900F9F2E3FFF3E6C0D1AC009900
      009900FAECD7FFEDD7B88285FF00FFFF00FFFF00FFFF00FFFF00FFDEAD8EFFFE
      FFFFFEFDFFFEFBFFFCFAFFFCF8FFFBF6FFFAF5FFFAF3FFF8F0FFF7EEFFF6EBFF
      F5E9FFF3E7F3ECDA009900009900FEEEDB9C837EFF00FFFF00FFFF00FFFF00FF
      FF00FFDEAD8EFFFFFFFFFFFFFFFEFEFFFEFCFFFDFBFFFCF9FFFCF7FFFAF5FFF9
      F3FFF8F0FEF7EEFFF6ECFEF5EAFFF4E7FFF3E5FEF1E2FEF0DF9C837EFF00FFFF
      00FFFF00FFFF00FFFF00FFDEAD8EFFFFFFFFFFFFFFFFFFFFFFFEFFFEFCFEFEFC
      FFFCFAFFFCF7FFFAF6FEFAF4FFF9F2FFF7EFFFF7EDFEF5EBFEF4E8FEF3E5FFF1
      E39C837EFF00FFFF00FFFF00FFFF00FFFF00FFDAA482DAA482DAA482DAA482DA
      A482DAA482DAA482DAA482DAA482DAA482DAA482DAA482DAA482DAA482DAA482
      DAA482DAA482DAA4829C837EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    TabOrder = 3
    OnClick = BitBtnExecutarComandosClick
  end
  object MemoVariaveis: TMemo
    Left = 440
    Top = 136
    Width = 200
    Height = 250
    ScrollBars = ssBoth
    TabOrder = 4
  end
end
