object MyownDM: TMyownDM
  OldCreateOrder = False
  Height = 150
  Width = 215
  object MyConn: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Embarcadero\Stud' +
      'io\Project\db2.mdb;Mode=ReadWrite;Persist Security Info=False;Je' +
      't OLEDB:System database="";Jet OLEDB:Registry Path="";Jet OLEDB:' +
      'Database Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:Database ' +
      'Locking Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Glo' +
      'bal Bulk Transactions=1;Jet OLEDB:New Database Password="";Jet O' +
      'LEDB:Create System Database=False;Jet OLEDB:Encrypt Database=Fal' +
      'se;Jet OLEDB:Don'#39't Copy Locale on Compact=False;Jet OLEDB:Compac' +
      't Without Replica Repair=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 40
  end
  object Mytbl: TADOTable
    Active = True
    Connection = MyConn
    CursorType = ctStatic
    EnableBCD = False
    TableDirect = True
    TableName = 'Table'
    Left = 32
    Top = 48
  end
  object MyDS: TDataSource
    DataSet = Mytbl
    Left = 136
    Top = 64
  end
end
