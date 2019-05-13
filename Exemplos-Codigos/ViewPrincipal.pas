unit ViewPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
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
  1-Abstração - Trazer o nomdo real para dentro da programação
  2-Herança - Capacade das classes de herdar a outro, uma tereá a classe pai e filho herdando da outra
  2.1-Inherited - Erda da classe pai
  3-Encapsulamento - Funcionalidade de criar objetos facil sem se preocupar com regras internas
  3.1-Coesão - Comportamentos unicos metodos que utilizam apenas um pornto
  3.2-Acoplamento - Cria depencias de outras classes por exemplo funcionario depende de pessoa
  3.3-Property - Encapsula as variaveis de uma classe
  4-Polimorfissmo -
  4.1-Overload - Ao invés de usar if's aninhados uso function com overload, pode nomear a função com mesmos nomes mas recebe dados diferentes
  4.2-Override - Sinaliza que está reescrevendo uma função da classe pai
  4.3-Abstratc - Pode ser implementado em outra classe, diferente de vrtual, não será implementado na raiz, mas pode ser implementado em outras classes
  4.4-Virtual - Permite reescrever a função em outra classe, onde tem dependencia

  ** Tipos de Variaveis
  * Private fica assicivel apenas para a classe, mas pode ser passado pra outra classe de forma amigavel
  * Protecetd -

  reintroduce - Informa que estão reescrevendo ara o compilador não acusar


  No objeto não podemos inchessar o código, não ficando dependente de determinadas coisas
  Sempre que criamos uma class pega do TObject, por padrão, mas pode ser reimplementado
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

procedure TForm1.BitBtn4Click(Sender: TObject);
var
  Pessoa, Pessoa2: TPessoa;
begin
  Pessoa := TPessoa.Create;
  Pessoa2 := TPessoa.Create;

  try
    ShowMessage(Pessoa.RetornaNome);
  finally
    // Sempre ao consluir o processo deve ser destruido a classe
    Pessoa.Free;
    Pessoa2.Free;
  end;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
var
  Cliente, Cliente2: TCliente;
begin
  Cliente := TCliente.Create;
  Cliente2 := TCliente.Create;

  try
    ShowMessage(Cliente.MetodoAbstrato);
  finally
    // Sempre ao consluir o processo deve ser destruido a classe
    Cliente.Free;
    Cliente2.Free;
  end;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
var
  Cliente, Cliente2: TCliente;
begin
  Cliente := TCliente.Create;

  try
    ShowMessage(Cliente.RetornaNome);
  finally
    // Sempre ao consluir o processo deve ser destruido a classe
    Cliente.Free;
  end;
end;

procedure TForm1.BitBtn7Click(Sender: TObject);
var
  Cliente, Cliente2, Cliente3: TCliente;
  Pessoa1: TPessoa;
begin
  Pessoa1 := TPessoa.Create;
  Pessoa1.Nome := 'Ju';
  Pessoa1.DataNasc := '13/07/1989';
  Pessoa1.Sexo := 'Feminino';

  Cliente := TCliente.Create;
  Cliente2 := TCliente.Create('Maicon');
  Cliente3 := TCliente.Create(Pessoa1);

  try
    ShowMessage(Cliente.Nome);
    ShowMessage(Cliente2.Nome);
    ShowMessage(Cliente3.Nome + ' - ' + Cliente3.DataNasc + ' - ' +
      Cliente3.Sexo);
  finally
    // Sempre ao consluir o processo deve ser destruido a classe
    Cliente.Free;
    Cliente2.Free;
    Cliente3.Free;
    Pessoa1.Free;
  end;
end;

procedure TForm1.BitBtn8Click(Sender: TObject);
var
  Cliente: TCliente;
begin
  Cliente := TCliente.Create;

  try
    ShowMessage(Cliente.Endereco.Logradouro);
  finally
    // Sempre ao consluir o processo deve ser destruido a classe
    Cliente.Destroy;
  end;
end;

end.
