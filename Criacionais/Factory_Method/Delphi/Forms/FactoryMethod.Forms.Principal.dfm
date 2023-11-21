object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Factory Method'
  ClientHeight = 379
  ClientWidth = 464
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 15
  object lblValor: TLabel
    Left = 8
    Top = 8
    Width = 60
    Height = 15
    Caption = 'Valor Atual:'
  end
  object lblPrazoPagamento: TLabel
    Left = 216
    Top = 8
    Width = 112
    Height = 15
    Caption = 'Prazo de Pagamento:'
  end
  object lblQtdeParcelas: TLabel
    Left = 122
    Top = 8
    Width = 75
    Height = 15
    Caption = 'Qtde Parcelas:'
  end
  object cbxPrazoPagamento: TComboBox
    Left = 216
    Top = 24
    Width = 105
    Height = 23
    Style = csDropDownList
    TabOrder = 2
    Items.Strings = (
      'Mensal'
      'Anual'
      'Semestral')
  end
  object edtValor: TEdit
    Left = 8
    Top = 24
    Width = 100
    Height = 23
    MaxLength = 10
    TabOrder = 0
  end
  object BtnGerarProjecao: TBitBtn
    Left = 332
    Top = 21
    Width = 120
    Height = 25
    Caption = 'Gerar Proje'#231#227'o'
    TabOrder = 3
    OnClick = BtnGerarProjecaoClick
  end
  object memPrincipal: TMemo
    Left = 8
    Top = 58
    Width = 443
    Height = 313
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object edtQtdeParcelas: TEdit
    Left = 122
    Top = 24
    Width = 73
    Height = 23
    MaxLength = 2
    TabOrder = 1
  end
end
