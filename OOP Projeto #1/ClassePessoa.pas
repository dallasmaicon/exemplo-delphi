unit ClassePessoa;

interface

uses
  System.SysUtils;

type
  TPessoa = class
  private
    FSalario: Currency;
    FNome: string;
    procedure SetNome(const Value: string);
    procedure SetSalario(const Value: Currency);
  public
    property Nome: string read FNome write SetNome;
    property Salario: Currency read FSalario write SetSalario;
    function CalcularSalario: Currency; virtual;
  end;

implementation

{ TPessoa }

function TPessoa.CalcularSalario: Currency;
begin
  Result := Salario;
end;

procedure TPessoa.SetNome(const Value: string);
begin
  if Length(Value) = 0 then
    raise Exception.Create('Nome não foi informado.');

  FNome := Value;
end;

procedure TPessoa.SetSalario(const Value: Currency);
begin
  if Value <= 0 then
    raise Exception.Create('Salario não pode ser menor ou igual a zero');

  FSalario := Value;
end;

end.
