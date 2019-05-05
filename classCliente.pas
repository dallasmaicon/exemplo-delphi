unit classCliente;

interface

uses
  ClassPessoa;

type
  TCliente = class(TPessoa)
    private
    public
      ValorCredito: Currency;
  end;

implementation


end.
