object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Tamanho de arquivos'
  ClientHeight = 566
  ClientWidth = 1013
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  DesignSize = (
    1013
    566)
  PixelsPerInch = 96
  TextHeight = 13
  object JvLabel1: TJvLabel
    Left = 335
    Top = 9
    Width = 353
    Height = 30
    Caption = 'Exibindo tamanho de arquivo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = 4210816
    ShadowSize = 1
    Transparent = True
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -24
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
  end
  object lbAguarde: TJvLabel
    Left = 8
    Top = 536
    Width = 20
    Height = 23
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Anchors = [akLeft, akBottom]
    ParentFont = False
    ShadowColor = 4210816
    Transparent = True
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -19
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
  end
  object Button1: TButton
    Left = 872
    Top = 32
    Width = 134
    Height = 41
    Anchors = [akTop, akRight]
    Caption = 'Analisar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGrid1: TJvDBGrid
    Left = 8
    Top = 79
    Width = 998
    Height = 448
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = ds1
    GradientEndColor = clNavy
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
    AlternateRowColor = 15525830
    AutoSizeColumns = True
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'TAMANHO'
        Title.Caption = 'Tamanho'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 153
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL'
        Title.Caption = 'Total em bytes'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 126
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 153
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Arquivo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 546
        Visible = True
      end>
  end
  object op: TJvSelectDirectory
    Left = 224
    Top = 40
  end
  object cdsDiretorios: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 96
    Top = 184
    object cdsDiretoriosNOME: TStringField
      DisplayWidth = 100
      FieldName = 'NOME'
      Size = 100
    end
    object cdsDiretoriosTAMANHO: TStringField
      FieldName = 'TAMANHO'
    end
    object cdsDiretoriosTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object cdsDiretoriosTIPO: TStringField
      FieldName = 'TIPO'
    end
  end
  object ds1: TDataSource
    DataSet = cdsDiretorios
    Left = 168
    Top = 144
  end
end
