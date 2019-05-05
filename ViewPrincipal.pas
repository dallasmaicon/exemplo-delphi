unit ViewPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses ClassPessoa, classCliente;

{
  4 Principais Conceito
  Abstra��o - Trazer o nomdo real para dentro da programa��o
  Heran�a - Capacade das classes de herdar a outro, uma tere� a classe pai e filho herdando da outra
  Encapsulamento - Funcionalidade de criar objetos facil sem se preocupar com regras internas
    Coes�o - Comportamentos unicos metodos que utilizam apenas um pornto
    Acoplamento - Cria depencias de outras classes por exemplo funcionario depende de pessoa
    Property - Encapsula as variaveis de uma classe
  Polimorfissmo -
    Overload -
    Override -
    Abstratc -
    Virtual -

No objeto n�o podemos inchessar o c�digo, n�o ficando dependente de determinadas coisas
}

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  Pessoa, Pessoa2: TPessoa;
begin
  Pessoa := TPessoa.Create;
  Pessoa2 := TPessoa.Create;

  try
    Pessoa.Nome := 'Maicon';
    Pessoa.DataNasc := '24/01/1992';

    Pessoa2.Nome := 'Juliana';
    Pessoa2.DataNasc := '13/07/1989';

    ShowMessage(Pessoa.Nome + ' - ' + IntToStr(Pessoa.Idade));
    ShowMessage(Pessoa2.Nome + ' - ' + IntToStr(Pessoa2.Idade));
  finally
    // Sempre ao consluir o processo deve ser destruido a classe
    Pessoa.Free;
    Pessoa2.Free;
  end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
  Cliente, Cliente2: TCliente;
begin
  Cliente := TCliente.Create;
  Cliente2 := TCliente.Create;

  try
    Cliente.Nome := 'Maicon';
    Cliente.DataNasc := '24/01/1992';

    Cliente2.Nome := 'Juliana';
    Cliente2.DataNasc := '13/07/1989';

    ShowMessage(Cliente.Nome + ' - ' + IntToStr(Cliente.Idade));
    ShowMessage(Cliente2.Nome + ' - ' + IntToStr(Cliente2.Idade));
  finally
    // Sempre ao consluir o processo deve ser destruido a classe
    Cliente.Free;
    Cliente2.Free;
  end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
  Cliente, Cliente2: TCliente;
begin
  Cliente := TCliente.Create;
  Cliente2 := TCliente.Create;

  try
    ShowMessage(Cliente.Receber(5));
    ShowMessage(Cliente.Receber(15.5));
    ShowMessage(Cliente.Receber(5, 6));
  finally
    // Sempre ao consluir o processo deve ser destruido a classe
    Cliente.Free;
    Cliente2.Free;
  end;
end;

end.
