object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Observer'
  ClientHeight = 364
  ClientWidth = 640
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
  object Bevel1: TBevel
    Left = 334
    Top = 109
    Width = 300
    Height = 10
    Shape = bsTopLine
  end
  object Bevel2: TBevel
    Left = 334
    Top = 240
    Width = 300
    Height = 10
    Shape = bsTopLine
  end
  inline FrameCadastroOperacoes: TFrameCadastroOperacoes
    Left = 0
    Top = 0
    Width = 328
    Height = 364
    TabOrder = 0
    ExplicitHeight = 364
    inherited lblOperacao: TLabel
      Width = 51
      Height = 13
      ExplicitWidth = 51
      ExplicitHeight = 13
    end
    inherited lblCategoria: TLabel
      Width = 51
      Height = 13
      ExplicitWidth = 51
      ExplicitHeight = 13
    end
    inherited lblValor: TLabel
      Width = 28
      Height = 13
      ExplicitWidth = 28
      ExplicitHeight = 13
    end
    inherited cbxOperacao: TComboBox
      Height = 21
      ExplicitHeight = 21
    end
    inherited cbxCategoria: TComboBox
      Height = 21
      ExplicitHeight = 21
    end
    inherited DBGrid: TDBGrid
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
    end
  end
  inline FrameSaldo: TFrameSaldo
    Left = 334
    Top = 0
    Width = 300
    Height = 100
    TabOrder = 1
    ExplicitLeft = 334
    ExplicitHeight = 100
    inherited lblTitulo: TLabel
      Height = 13
      ExplicitWidth = 89
      ExplicitHeight = 13
    end
  end
  inline FrameLog: TFrameLog
    Left = 334
    Top = 247
    Width = 300
    Height = 110
    TabOrder = 2
    ExplicitLeft = 334
    ExplicitTop = 247
    inherited lblTitulo: TLabel
      Height = 13
      ExplicitWidth = 87
      ExplicitHeight = 13
    end
    inherited memLog: TMemo
      Top = 13
      Height = 97
      ExplicitTop = 13
      ExplicitHeight = 97
    end
  end
  inline FrameAgrupamento: TFrameAgrupamento
    Left = 334
    Top = 117
    Width = 300
    Height = 110
    TabOrder = 3
    ExplicitLeft = 334
    ExplicitTop = 117
    inherited lblTitulo: TLabel
      Height = 13
      ExplicitWidth = 157
      ExplicitHeight = 13
    end
    inherited DBGrid: TDBGrid
      Top = 13
      Height = 97
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
    end
  end
end
