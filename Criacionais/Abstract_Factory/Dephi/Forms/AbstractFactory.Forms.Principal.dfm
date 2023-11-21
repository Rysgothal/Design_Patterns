object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Abstract Factory'
  ClientHeight = 196
  ClientWidth = 403
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 15
  object lblMarca: TLabel
    Left = 14
    Top = 8
    Width = 36
    Height = 15
    Caption = 'Marca:'
  end
  object cbxMarcas: TComboBox
    Left = 14
    Top = 24
    Width = 89
    Height = 23
    AutoDropDown = True
    AutoCloseUp = True
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 0
    Text = 'Apple'
    OnChange = cbxMarcasChange
    Items.Strings = (
      'Apple'
      'Dell'
      'Lenovo')
  end
  object btnPesquisar: TButton
    Left = 109
    Top = 23
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 1
    OnClick = btnPesquisarClick
  end
  object gbxNotebook: TGroupBox
    Left = 205
    Top = 67
    Width = 185
    Height = 118
    Caption = 'Notebook:'
    Enabled = False
    TabOrder = 2
    object ledTela: TLabeledEdit
      Left = 16
      Top = 37
      Width = 153
      Height = 23
      EditLabel.Width = 23
      EditLabel.Height = 15
      EditLabel.Caption = 'Tela:'
      TabOrder = 0
      Text = ''
    end
    object ledMemoria: TLabeledEdit
      Left = 16
      Top = 83
      Width = 153
      Height = 23
      EditLabel.Width = 51
      EditLabel.Height = 15
      EditLabel.Caption = 'Mem'#243'ria:'
      TabOrder = 1
      Text = ''
    end
  end
  object gbxDesktop: TGroupBox
    Left = 14
    Top = 67
    Width = 185
    Height = 118
    Caption = 'Desktop:'
    Enabled = False
    TabOrder = 3
    object ledProcessador: TLabeledEdit
      Left = 16
      Top = 37
      Width = 153
      Height = 23
      EditLabel.Width = 67
      EditLabel.Height = 15
      EditLabel.Caption = 'Processador:'
      TabOrder = 0
      Text = ''
    end
    object ledArmazenamento: TLabeledEdit
      Left = 16
      Top = 83
      Width = 153
      Height = 23
      EditLabel.Width = 91
      EditLabel.Height = 15
      EditLabel.Caption = 'Armazenamento:'
      TabOrder = 1
      Text = ''
    end
  end
end
