object FrameSaldo: TFrameSaldo
  Left = 0
  Top = 0
  Width = 300
  Height = 110
  TabOrder = 0
  PixelsPerInch = 96
  object lblTitulo: TLabel
    Left = 0
    Top = 0
    Width = 100
    Height = 15
    Align = alTop
    Alignment = taCenter
    Caption = 'Balan'#231'o Financeiro'
  end
  object lblCreditos: TLabel
    Left = 6
    Top = 31
    Width = 50
    Height = 13
    Caption = 'Cr'#233'ditos:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblDebitos: TLabel
    Left = 6
    Top = 51
    Width = 46
    Height = 13
    Caption = 'D'#233'bitos:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblSaldo: TLabel
    Left = 6
    Top = 72
    Width = 34
    Height = 13
    Caption = 'Saldo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblValorDebitos: TLabel
    Left = 265
    Top = 51
    Width = 24
    Height = 13
    Alignment = taRightJustify
    Caption = '0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblValorCreditos: TLabel
    Left = 265
    Top = 31
    Width = 24
    Height = 13
    Alignment = taRightJustify
    Caption = '0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblValorSaldo: TLabel
    Left = 265
    Top = 72
    Width = 24
    Height = 13
    Alignment = taRightJustify
    Caption = '0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
end
