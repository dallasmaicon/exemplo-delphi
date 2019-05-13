unit ClasseVendedor;

interface

uses
  ClassePessoa;

type TVendedor = class(TPessoa)
  private
    FComissao: Currency;
    procedure SetComissao(const Value: Currency);
  public
    property Comissao: Currency read FComissao write SetComissao;
    function CalcularSalario: Currency; override;
end;

implementation

{ TVendedor }

function TVendedor.CalcularSalario: Currency;
begin
  Result := Salario + Comissao;
end;

procedure TVendedor.SetComissao(const Value: Currency);
begin
  FComissao := Value;
end;

end.
