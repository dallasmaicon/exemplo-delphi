program ExemplosCodigos;

uses
  Vcl.Forms,
  ViewPrincipal in 'ViewPrincipal.pas' {Form1},
  ClassPessoa in 'ClassPessoa.pas',
  ClassSql in 'ClassSql.pas',
  classCliente in 'classCliente.pas',
  ClassEndereco in 'ClassEndereco.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
