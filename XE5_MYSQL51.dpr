program XE5_MYSQL51;

uses
  Vcl.Forms,
  Main in 'Main.pas' {MyMainForm},
  Connection in 'Connection.pas' {MyDataModule: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMyMainForm, MyMainForm);
  Application.CreateForm(TMyDataModule, MyDataModule);
  Application.Run;
end.
