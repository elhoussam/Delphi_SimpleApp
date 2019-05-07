unit Unit3;

interface

uses
  System.SysUtils, System.Classes;

type
  TmyDataModule = class(TDataModule)
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  myDataModule: TmyDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
