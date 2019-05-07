object MainForm: TMainForm
  Left = 0
  Top = 0
  ActiveControl = DBGrid1
  Caption = 'Application Elhoussam'
  ClientHeight = 390
  ClientWidth = 496
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 315
    Width = 174
    Height = 19
    Caption = 'S'#233'lectioner une date '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Yandex-UI-Icons-Private'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DebitLbl: TLabel
    Left = 80
    Top = 358
    Width = 35
    Height = 13
    Caption = 'Debit : '
  end
  object CreditLbl: TLabel
    Left = 312
    Top = 358
    Width = 29
    Height = 13
    Caption = 'Credit'
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 279
    Width = 480
    Height = 30
    DataSource = MyownDM.MyDS
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 481
    Height = 265
    DataSource = MyownDM.MyDS
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Dt'
        Title.Caption = 'Date'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Intitule'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Credit'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Debit'
        Width = 70
        Visible = True
      end>
  end
  object MyDatePicker: TDateTimePicker
    Left = 230
    Top = 315
    Width = 139
    Height = 27
    Date = 43592.000000000000000000
    Time = 0.752263090274937000
    TabOrder = 2
  end
  object FilterBtn: TButton
    Left = 375
    Top = 315
    Width = 58
    Height = 27
    Caption = 'Filtrer'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = FilterBtnClick
  end
  object ClearBtn: TButton
    Left = 439
    Top = 315
    Width = 43
    Height = 27
    Caption = 'Clear'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = ClearBtnClick
  end
end
