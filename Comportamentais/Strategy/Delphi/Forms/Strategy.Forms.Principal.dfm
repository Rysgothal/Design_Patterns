object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Strategy'
  ClientHeight = 91
  ClientWidth = 489
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lblEmail: TLabel
    Left = 6
    Top = 6
    Width = 32
    Height = 13
    Caption = 'E-mail:'
  end
  object lblAlgoritmo: TLabel
    Left = 265
    Top = 6
    Width = 49
    Height = 13
    Caption = 'Algoritmo:'
  end
  object Bevel: TBevel
    Left = 6
    Top = 58
    Width = 475
    Height = 12
    Shape = bsTopLine
  end
  object lblResultado: TLabel
    Left = 7
    Top = 68
    Width = 474
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Resultado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtEmail: TEdit
    Left = 6
    Top = 21
    Width = 243
    Height = 21
    MaxLength = 200
    TabOrder = 0
  end
  object cbxAlgortimo: TComboBox
    Left = 265
    Top = 21
    Width = 126
    Height = 21
    Style = csDropDownList
    TabOrder = 1
    Items.Strings = (
      'DLL'
      'RegExLib'
      'MailBoxLayer')
  end
  object btnValidar: TBitBtn
    Left = 406
    Top = 19
    Width = 75
    Height = 25
    Caption = 'Validar!'
    TabOrder = 2
    OnClick = btnValidarClick
  end
end
