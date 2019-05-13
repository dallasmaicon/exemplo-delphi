unit ClassPessoa;

interface

uses
  System.SysUtils, ClassSql;

type
  TPessoa = class

  strict private // Quarto do casal
    FSegredo: string;

  strict protected  // Apenas pessoaas da familia poderam ver
    FSoFamilia: String;

  private  //Casas
    FNome: string;
    FEtnia: string;
    FDataNasc: String;
    FSexo: string;

    function GetNome: string;
    procedure SetNome(value: string);
    procedure SetEtnia(const value: string);
    function GetEtnia: string;
    procedure SetDataNasc(const value: String);
    function GetDataNasc: string;
    procedure SetSexo(const value: string);
    function GetSexo: string;

  protected // Grupo de Whattsapp da familia
    FWhatsapp: String;

  //published // Acesso de Adminstrado de um blog
   // FPost: String;

  public // Postagens no Facebook
    function Idade: Integer;
    function Receber(i: Integer): string; overload;
    function Receber(i: currency): string; overload;
    function Receber(a, b: Integer): string; overload;

    function RetornaNome: string; virtual;
    function MetodoAbstrato: string; virtual; abstract;

    property nome: string read GetNome write SetNome;
    property Etnia: string read GetEtnia write SetEtnia;
    property DataNasc: String read FDataNasc write SetDataNasc;
    property Sexo: string read FSexo write SetSexo;
  end;

type
  TTeste = class(TPessoa)
    function Teste: Boolean;
  end;

type
  TAmigo = class
    Familia: TPessoa;
    procedure teste;
  end;

implementation

{ TPessoa }

function TPessoa.GetDataNasc: string;
begin
  Result := FDataNasc;
end;

function TPessoa.GetEtnia: string;
begin
  Result := FEtnia;
end;

function TPessoa.GetNome: string;
begin
  Result := FNome;
end;

function TPessoa.GetSexo: string;
begin
  Result := FSexo;
end;

function TPessoa.Idade: Integer;
begin
  Result := Trunc((Now - StrToDate(DataNasc)) / 365.25);
end;

function TPessoa.Receber(a, b: Integer): string;
begin
  Result := 'Recebi a soma do valor inteiro ' + IntToStr(a + b);
end;

function TPessoa.RetornaNome: string;
begin
  nome := 'TPessoa';
end;

function TPessoa.Receber(i: currency): string;
begin
  Result := 'Recebi o valor currency ' + CurrToStr(i);
end;

function TPessoa.Receber(i: Integer): string;
begin
  Result := 'Recebi o valor inteiro ' + IntToStr(i);
end;

procedure TPessoa.SetDataNasc(const value: String);
begin
  if StrToDateDef(value, 0) = 0 then
    raise Exception.Create('Sexo não informado');

  FDataNasc := value;
end;

procedure TPessoa.SetEtnia(const value: string);
begin
  if Length(value) = 0 then
    raise Exception.Create('Etnia não informado');
  FEtnia := value;
end;

procedure TPessoa.SetNome(value: string);
begin
  if Length(value) = 0 then
    raise Exception.Create('Nome não informado');

  FNome := value;
end;

procedure TPessoa.SetSexo(const value: string);
begin
  if Length(value) = 0 then
    raise Exception.Create('Sexo não informado');

  FSexo := value;
end;

{ TTeste }

function TTeste.Teste: Boolean;
begin
  FWhatsapp := 'Class Pessoa, FWhatsapp';
  Result := true;
end;

{ TAmigo }

procedure TAmigo.teste;
begin
  Familia.FWhatsapp := 'Amigo da familia no whatsapp';
end;

end.
