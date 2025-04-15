program Project1;
uses
  Vcl.Forms,
  ClientFormUnit in 'ClientFormUnit.pas' {Form1};
{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TClientForm, ClientForm);
  Application.Run;
end.
