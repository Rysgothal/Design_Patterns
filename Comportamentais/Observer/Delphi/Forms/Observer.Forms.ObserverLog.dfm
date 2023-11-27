object FrameLog: TFrameLog
  Left = 0
  Top = 0
  Width = 300
  Height = 110
  TabOrder = 0
  PixelsPerInch = 96
  object lblTitulo: TLabel
    Left = 0
    Top = 0
    Width = 300
    Height = 15
    Align = alTop
    Alignment = taCenter
    Caption = 'Log de Opera'#231#245'es'
    ExplicitWidth = 95
  end
  object memLog: TMemo
    Left = 0
    Top = 15
    Width = 300
    Height = 95
    Align = alClient
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
end
