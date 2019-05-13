unit ViewPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.Buttons,
  ClassePessoa, ClasseVendedor, ClasseAdministrativo;

type
  TEnumFuncao = (TpAdministrativo, TpVendedor, TpFuncionario);

type
  TForm1 = class(TForm)
    Label1: TLabel;
    cbCargo: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    edNome: TEdit;
    edSalario: TEdit;
    Label4: TLabel;
    edBonus: TEdit;
    btCadastrar: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Memo1: TMemo;
    btCalcSalario: TBitBtn;
    procedure btCadastrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btCalcSalarioClick(Sender: TObject);
  private
    procedure IncluirFuncionarioAdministrativo;
    procedure IncluirFuncionarioVendedor;
    procedure IncuirFuncionario;
    procedure ExibirDados(Pos: Integer);
    { Private declarations }
  public
    { Public declarations }
    Funcionario: Array [1 .. 100] of TPessoa;
    QtdFunc: Integer;
    RegraAtual: Integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  if RegraAtual <= 0 then
    exit;

  RegraAtual := RegraAtual - 1;
  ExibirDados(RegraAtual);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  if RegraAtual >= QtdFunc then
    exit;

  RegraAtual := RegraAtual + 1;
  ExibirDados(RegraAtual);
end;

procedure TForm1.btCadastrarClick(Sender: TObject);
begin
  try
    case TEnumFuncao(cbCargo.ItemIndex) of
      TpAdministrativo:
        begin
          IncluirFuncionarioAdministrativo;
        end;
      TpVendedor:
        begin
          IncluirFuncionarioVendedor;
        end;
      TpFuncionario:
        begin
          IncuirFuncionario;
        end;
    end;
    inc(QtdFunc);
  except
    raise Exception.Create('Error ao cadastrar funcionario');
  end;
end;

procedure TForm1.btCalcSalarioClick(Sender: TObject);
var
  Total: Currency;
  i: Integer;
begin
  Memo1.Clear;
  Memo1.Lines.Clear;
  Total := 0;
  for i := 0 to QtdFunc - 1 do
    Total := Total + Funcionario[i].CalcularSalario;

  Memo1.Lines.Add('Sua folha salarial é de: ' + CurrToStr(Total));
end;

procedure TForm1.ExibirDados(Pos: Integer);
begin
  edNome.Text := Funcionario[RegraAtual].Nome;
  edSalario.Text := CurrToStr(Funcionario[RegraAtual].Salario);

  if (Funcionario[RegraAtual].ClassName = 'TAdministrativo') then
  begin
    edBonus.Enabled := True;
    edBonus.Text := CurrToStr(TAdministrativo(Funcionario[RegraAtual]).Bonus);
    cbCargo.ItemIndex := Integer(TpAdministrativo);
  end;

  if (Funcionario[RegraAtual].ClassName = 'TVendedor') then
  begin
    edBonus.Enabled := True;
    edBonus.Text := CurrToStr(TVendedor(Funcionario[RegraAtual]).Comissao);
    cbCargo.ItemIndex := Integer(TpVendedor);
  end;

  if (Funcionario[RegraAtual].ClassName = 'TPessoa') then
  begin
    edBonus.Enabled := False;
    cbCargo.ItemIndex := Integer(TpFuncionario);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  QtdFunc := 0;
  RegraAtual := 0;
end;

procedure TForm1.IncluirFuncionarioAdministrativo;
begin
  Funcionario[QtdFunc] := TAdministrativo.Create;
  TAdministrativo(Funcionario[QtdFunc]).Bonus := StrToCurrDef(edBonus.Text, 0);
  TAdministrativo(Funcionario[QtdFunc]).Nome := edNome.Text;
  TAdministrativo(Funcionario[QtdFunc]).Salario :=
    StrToCurrDef(edSalario.Text, 0);
end;

procedure TForm1.IncluirFuncionarioVendedor;
begin
  Funcionario[QtdFunc] := TVendedor.Create;
  TVendedor(Funcionario[QtdFunc]).Comissao := StrToCurrDef(edBonus.Text, 0);
  TVendedor(Funcionario[QtdFunc]).Nome := edNome.Text;
  TVendedor(Funcionario[QtdFunc]).Salario := StrToCurrDef(edSalario.Text, 0);
end;

procedure TForm1.IncuirFuncionario;
begin
  Funcionario[QtdFunc] := TPessoa.Create;
  Funcionario[QtdFunc].Nome := edNome.Text;
  Funcionario[QtdFunc].Salario := StrToCurrDef(edSalario.Text, 0);
end;

end.
