object frmPrincipal: TfrmPrincipal
  Left = 192
  Top = 125
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Decorator'
  ClientHeight = 305
  ClientWidth = 394
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gbxLog: TGroupBox
    Left = 7
    Top = 8
    Width = 380
    Height = 65
    Caption = 'Op'#231#245'es do log: '
    TabOrder = 0
    object cbxDataHora: TCheckBox
      Left = 8
      Top = 32
      Width = 97
      Height = 17
      Caption = 'Data e Hora'
      TabOrder = 0
    end
    object cbxNomeUsuario: TCheckBox
      Left = 120
      Top = 32
      Width = 105
      Height = 17
      Caption = 'Nome do Usu'#225'rio'
      TabOrder = 1
    end
    object cbxVersaoWindows: TCheckBox
      Left = 248
      Top = 32
      Width = 116
      Height = 17
      Caption = 'Vers'#227'o do Windows'
      TabOrder = 2
    end
  end
  object btnGerarExcecao: TBitBtn
    Left = 111
    Top = 80
    Width = 150
    Height = 25
    Caption = 'Gerar Exce'#231#227'o'
    TabOrder = 1
    OnClick = btnGerarExcecaoClick
  end
  object memPrincipal: TMemo
    Left = 7
    Top = 112
    Width = 380
    Height = 185
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object ApplicationEvents: TApplicationEvents
    OnException = ApplicationEventsException
    Left = 44
    Top = 248
  end
end
