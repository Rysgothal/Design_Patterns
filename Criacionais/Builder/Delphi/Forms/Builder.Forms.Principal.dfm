object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'frmPrincipal'
  ClientHeight = 301
  ClientWidth = 572
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object Bevel: TBevel
    Left = 8
    Top = 253
    Width = 555
    Height = 11
    Shape = bsTopLine
  end
  object btnGerarRelatorio: TBitBtn
    Left = 170
    Top = 270
    Width = 233
    Height = 25
    Caption = 'Gerar Relat'#243'rio de Fornecedores'
    TabOrder = 0
    OnClick = btnGerarRelatorioClick
  end
  object dbgPrincipal: TDBGrid
    Left = 9
    Top = 8
    Width = 555
    Height = 238
    DataSource = DataSource
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VendorNo'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VendorName'
        Title.Alignment = taCenter
        Title.Caption = 'Fornecedor'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'City'
        Title.Alignment = taCenter
        Title.Caption = 'Cidade'
        Width = 190
        Visible = True
      end>
  end
  object DataSource: TDataSource
    DataSet = ClientDataSet
    Left = 112
    Top = 192
  end
  object ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 192
  end
end
