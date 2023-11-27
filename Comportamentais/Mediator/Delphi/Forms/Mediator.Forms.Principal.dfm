object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Mediator'
  ClientHeight = 303
  ClientWidth = 657
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
  object LabelMembros: TLabel
    Left = 8
    Top = 13
    Width = 78
    Height = 13
    Caption = 'Membros online:'
  end
  object btnAdicionar: TSpeedButton
    Left = 148
    Top = 3
    Width = 30
    Height = 25
    Hint = 'Adicionar Membro'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08
      780E08780EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF08780E76F9A70DA31B08780EFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08780E76
      F9A70EAA1D08780EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF08780E76F9A70EA81C08780EFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08780E76
      F9A710AA1F08780EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      08780E08780E08780E08780E08780E76F9A719B02C08780E08780E08780E0878
      0E08780EFF00FFFF00FFFF00FF08780E76F9A755E38349DA7242D36837C8562A
      B94322B3371CB23016AF270FA81D0EA91B0DA21B08780EFF00FFFF00FF08780E
      76F9A776F9A776F9A776F9A776F9A776F9A72CBB4876F9A776F9A776F9A776F9
      A776F9A708780EFF00FFFF00FFFF00FF08780E08780E08780E08780E08780E76
      F9A73CCB5D08780E08780E08780E08780E08780EFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF08780E76F9A749D97208780EFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08780E76
      F9A755E28208780EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF08780E76F9A763F09708780EFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08780E76
      F9A776F9A708780EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FF08780E08780EFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    ParentShowHint = False
    ShowHint = True
    OnClick = btnAdicionarClick
  end
  object btnRemover: TSpeedButton
    Left = 179
    Top = 3
    Width = 30
    Height = 25
    Hint = 'Remover Membro'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF00009A00009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A0000
      9AFF00FFFF00FFFF00FFFF00FFFF00FF00009A174AFD103BF400009AFF00FFFF
      00FFFF00FFFF00FF00009A002CF80030FC00009AFF00FFFF00FFFF00FFFF00FF
      00009A1A47F81A4CFF123BF100009AFF00FFFF00FF00009A012DF60132FF002A
      F300009AFF00FFFF00FFFF00FFFF00FFFF00FF00009A1C47F61B4DFF143EF400
      009A00009A002DF80134FF032BF200009AFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF00009A1D48F61D50FF103DFB0431FE0132FF002CF600009AFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A1A48F913
      42FF0C3CFF0733F600009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF00009A214EFC1D4BFF1847FF1743F600009AFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A2E5BF92C5FFF22
      4DF8204BF82355FF1B46F600009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF00009A3664FA386BFF2D59F400009A00009A224CF42558FF1D49F60000
      9AFF00FFFF00FFFF00FFFF00FFFF00FF00009A4071FA4274FF325DF100009AFF
      00FFFF00FF00009A224DF1275AFF204CF800009AFF00FFFF00FFFF00FFFF00FF
      00009A497AFC3B66F300009AFF00FFFF00FFFF00FFFF00FF00009A2550F42655
      FA00009AFF00FFFF00FFFF00FFFF00FFFF00FF00009A00009AFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF00009A00009AFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    ParentShowHint = False
    ShowHint = True
    OnClick = btnRemoverClick
  end
  object lbxMembros: TListBox
    Left = 8
    Top = 29
    Width = 201
    Height = 262
    ItemHeight = 13
    TabOrder = 0
  end
  object memLog: TMemo
    Left = 215
    Top = 140
    Width = 434
    Height = 151
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object gbxPropostas: TGroupBox
    Left = 217
    Top = 29
    Width = 432
    Height = 105
    Caption = 'Envio de Propostas: '
    TabOrder = 2
    object LabelDe: TLabel
      Left = 24
      Top = 33
      Width = 17
      Height = 13
      Caption = 'De:'
    end
    object LabelPara: TLabel
      Left = 210
      Top = 33
      Width = 26
      Height = 13
      Caption = 'Para:'
    end
    object btnEnviar: TSpeedButton
      Left = 389
      Top = 64
      Width = 23
      Height = 22
      Hint = 'Enviar Proposta'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FF4C2600602F00723800723800623000502800FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF643100643100984B00B85B00BC
        5D00BC5D00BA5C009C4D006C35006C3500FF00FFFF00FFFF00FFFF00FFFF00FF
        743900884300C05F00C26000BC5D00B85B00BC5D00BC5D00C05F00C260008A44
        00502800FF00FFFF00FFFF00FF743900944900D26800C86300BC5D00B85B00B8
        5B00BA5C00BA5C00BA5C00BC5D00C260008A44006C3500FF00FFFF00FF743900
        DE6E00D86B00CA6400BC5D00C37020F6EADEFAF3EDD3975DBA5C00BA5C00BC5D
        00C260006C3500FF00FF7A3C00B45900F07700D86B00C26000BE5E00BC6108E3
        BC96FFFFFFFDFAF7D19254BA5C00BA5C00C05F009C4D00602F007A3C00E06F00
        F07700DE6E00C26000BC5D00BE5E00BC5D00DFB489FEFEFDFDF9F6D09052BA5C
        00BE5E00B25800602F00904700F87B00FA7C00FEDFC0FADCBEF7DABDFADBBDF9
        D9B9F8DABCFDFAF8FFFFFFFBF7F2D7A06ABC5D00BC5D006A3400A04F00FF9125
        FF840BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFFFFFFFFFFFFECD3
        BABE5E00BC5D00723800A04F00FF9F41FF9833F7A04AFDA34BFDA34AFDA34AFA
        9A3CF1B880FEFCFAFFFFFFEEC8A3D47518C86300B85B00663200A04F00FF9833
        FFBF81FF7E00F27800FC7D00FC7D00FDA249FDF0E3FFFFFFEFC092DA6D02D268
        00CA6400AA5400663200FF00FFEC7500FFD3A9FFAD5DE87300F07700FC8E22FF
        FAF5FFFFFFF4BE8ADA6D02D66A00CE6600D469008E4600FF00FFFF00FFEC7500
        FFA043FFE3C7FFAC5BFA7C00EF7E0EFDD3AAFEC893EA7705E27000DE6E00E06F
        00C461008E4600FF00FFFF00FFFF00FFD26800FFAD5DFFE9D3FFCA97FF9E3FFF
        8E1FFF850DFF8813FF8813FF8105D66A008A4400FF00FFFF00FFFF00FFFF00FF
        FF00FFFF9833FF9833FFC995FFDFBFFFD2A7FFC58DFFB873FF9B39E06F00E06F
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE87300FF8A17FF
        952DFF9125FC7D00C66200FF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnEnviarClick
    end
    object edtProposta: TEdit
      Left = 24
      Top = 64
      Width = 359
      Height = 21
      TabOrder = 0
      OnKeyPress = edtPropostaKeyPress
    end
    object cbxRemetente: TComboBox
      Left = 44
      Top = 29
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 1
    end
    object cbxDestinatario: TComboBox
      Left = 238
      Top = 29
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 2
    end
  end
end
