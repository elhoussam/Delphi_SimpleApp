unit Unit3;

interface

uses
  System.SysUtils, System.Classes;

type
  TmyDataModule = class(TDataModule)
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  myDataModule: TmyDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
