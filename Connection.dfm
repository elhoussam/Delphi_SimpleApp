object MyDataModule: TMyDataModule
  OldCreateOrder = False
  Height = 238
  Width = 284
  object MyConn: TFDConnection
    Params.Strings = (
      'Database=mydb'
      'User_Name=root'
      'Password=rooto'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 8
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\Administrateur\Documents\RAD Studio\Projects\XE5MYSQL51' +
      '\Win32\Debug\libmySQL.dll'
    Left = 128
    Top = 8
  end
  object MyTable: TFDTable
    IndexFieldNames = 'ID'
    Connection = MyConn
    UpdateOptions.UpdateTableName = 'mydb.mytbl'
    TableName = 'mydb.mytbl'
    Left = 32
    Top = 88
  end
  object MyDS: TDataSource
    DataSet = MyTable
    Left = 32
    Top = 160
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 216
    Top = 8
  end
  object MyQuery: TFDQuery
    Active = True
    Connection = MyConn
    SQL.Strings = (
      'select * from mytbl')
    Left = 184
    Top = 88
  end
  object MyDS_query: TDataSource
    DataSet = MyQuery
    Left = 184
    Top = 160
  end
end
