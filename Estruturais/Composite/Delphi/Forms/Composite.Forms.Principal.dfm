object frmPrincipal: TfrmPrincipal
  Left = 192
  Top = 125
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Composite'
  ClientHeight = 242
  ClientWidth = 466
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblTotal: TLabel
    Left = 171
    Top = 215
    Width = 28
    Height = 13
    Caption = 'Total:'
  end
  object btnCalcular: TBitBtn
    Left = 8
    Top = 208
    Width = 150
    Height = 25
    Caption = 'Calcular Total do Pacote'
    TabOrder = 1
    OnClick = btnCalcularClick
  end
  object edtTotal: TEdit
    Left = 206
    Top = 211
    Width = 127
    Height = 21
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object gbxAdicionarViagem: TGroupBox
    Left = 8
    Top = 8
    Width = 449
    Height = 193
    Caption = 'Personalizar pacote: '
    TabOrder = 0
    object lblOrigem: TLabel
      Left = 8
      Top = 24
      Width = 38
      Height = 13
      Caption = 'Origem:'
    end
    object lblDestino: TLabel
      Left = 168
      Top = 24
      Width = 40
      Height = 13
      Caption = 'Destino:'
    end
    object cbxOrigem: TComboBox
      Left = 8
      Top = 40
      Width = 145
      Height = 21
      Style = csDropDownList
      DropDownCount = 10
      TabOrder = 0
      OnChange = cbxOrigemChange
      Items.Strings = (
        'S'#227'o Paulo'
        'Rio de Janeiro'
        'Natal'
        'Londres'
        'Berlin'
        'Lisboa'
        'Nova York'
        'Los Angeles'
        'Miami')
    end
    object cbxDestino: TComboBox
      Left = 168
      Top = 40
      Width = 145
      Height = 21
      Style = csDropDownList
      DropDownCount = 10
      TabOrder = 1
      Items.Strings = (
        'S'#227'o Paulo'
        'Rio de Janeiro'
        'Natal'
        'Londres'
        'Berlin'
        'Lisboa'
        'Nova York'
        'Los Angeles'
        'Miami')
    end
    object btnAdicionarViagem: TBitBtn
      Left = 329
      Top = 35
      Width = 109
      Height = 25
      Caption = 'Adicionar Viagem'
      TabOrder = 2
      OnClick = btnAdicionarViagemClick
    end
    object memViagens: TMemo
      Left = 8
      Top = 74
      Width = 430
      Height = 103
      TabOrder = 3
    end
  end
end
