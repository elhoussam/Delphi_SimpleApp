unit Unit2;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TMyownDM = class(TDataModule)
    MyConn: TADOConnection;
    Mytbl: TADOTable;
    MyDS: TDataSource;
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  MyownDM: TMyownDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
