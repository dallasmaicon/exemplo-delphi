unit classCliente;

interface

uses
  ClassPessoa, ClassEndereco;

type
  TCliente = class(TPessoa)
  private
    FEndereco: TEndereco;
    FValorCredito: Currency;
    procedure SetEndereco(const Value: TEndereco);
    procedure SetValorCredito(const Value: Currency);
  public
    constructor Create; overload;
    constructor Create(Value: string); overload;
    constructor Create(Value: TPessoa); overload;
    destructor Destroy; override;

    function RetornaNome: string; override;
    function MetodoAbstrato: string; override;

    property Endereco: TEndereco read FEndereco write SetEndereco;
    property ValorCredito: Currency read FValorCredito write SetValorCredito;
  end;

implementation

{ TCliente }

constructor TCliente.Create;
begin
  FEndereco := TEndereco.Create;
  Nome := 'Nome Cliente';
end;

constructor TCliente.Create(Value: string);
begin
  Nome := Value;
end;

constructor TCliente.Create(Value: TPessoa);
begin
  Nome := Value.Nome;
  DataNasc := Value.DataNasc;
  Sexo := Value.Sexo;
end;

destructor TCliente.Destroy;
begin
  FEndereco.Free;
end;

function TCliente.MetodoAbstrato: string;
begin
  Result := 'Eu sou o metodo abstrato';
end;

function TCliente.RetornaNome: string;
begin
  Inherited;
  Self.FWhatsapp := 'Whats';
  Result := 'Eu sou filho de ' + Nome;
end;

procedure TCliente.SetEndereco(const Value: TEndereco);
begin
  FEndereco := Value;
end;

procedure TCliente.SetValorCredito(const Value: Currency);
begin
  FValorCredito := Value;
end;

end.
