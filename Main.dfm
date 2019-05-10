object MyMainForm: TMyMainForm
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Elhoussam'
  ClientHeight = 239
  ClientWidth = 384
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
    Left = 5
    Top = 147
    Width = 125
    Height = 23
    Caption = 'Select Date'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object InfoLbl: TLabel
    Left = 8
    Top = 223
    Width = 48
    Height = 13
    Caption = 'Result : '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object MyDatePicker: TDateTimePicker
    Left = 136
    Top = 143
    Width = 153
    Height = 31
    Date = 43595.467335555560000000
    Time = 43595.467335555560000000
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = -1
    Top = 0
    Width = 385
    Height = 137
    DataSource = MyDataModule.MyDS_query
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'ID'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Dt'
        Title.Caption = 'Date'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'intitule'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Credit'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Debit'
        Width = 60
        Visible = True
      end>
  end
  object SqlFilterBtn: TButton
    Left = 295
    Top = 143
    Width = 42
    Height = 31
    Caption = 'Filter'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = SqlFilterBtnClick
  end
  object SqlClearBtn: TButton
    Left = 343
    Top = 143
    Width = 41
    Height = 31
    Caption = 'Clear'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = SqlClearBtnClick
  end
  object GroupBox1: TGroupBox
    Left = 5
    Top = 174
    Width = 172
    Height = 49
    Caption = 'Total Debit'
    TabOrder = 4
    object DebitLbl: TLabel
      Left = 65
      Top = 20
      Width = 7
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
  end
  object GroupBox2: TGroupBox
    Left = 190
    Top = 174
    Width = 186
    Height = 49
    Caption = 'Total Credit'
    TabOrder = 5
    object CreditLbl: TLabel
      Left = 65
      Top = 20
      Width = 7
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
  end
end
