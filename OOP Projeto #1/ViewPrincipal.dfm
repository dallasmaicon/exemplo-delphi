object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 186
  ClientWidth = 423
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 35
    Height = 13
    Caption = 'Fun'#231#227'o'
  end
  object Label2: TLabel
    Left = 16
    Top = 43
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label3: TLabel
    Left = 173
    Top = 43
    Width = 32
    Height = 13
    Caption = 'Salario'
  end
  object Label4: TLabel
    Left = 306
    Top = 43
    Width = 29
    Height = 13
    Caption = 'Bonus'
  end
  object cbCargo: TComboBox
    Left = 48
    Top = 8
    Width = 369
    Height = 21
    ItemIndex = 0
    TabOrder = 0
    Text = 'Administrativo'
    Items.Strings = (
      'Administrativo'
      'Vendedor'
      'Funcionario Normal')
  end
  object edNome: TEdit
    Left = 48
    Top = 35
    Width = 103
    Height = 21
    TabOrder = 1
  end
  object edSalario: TEdit
    Left = 211
    Top = 35
    Width = 73
    Height = 21
    TabOrder = 2
  end
  object edBonus: TEdit
    Left = 344
    Top = 35
    Width = 73
    Height = 21
    TabOrder = 3
  end
  object btCadastrar: TBitBtn
    Left = 8
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 4
    OnClick = btCadastrarClick
  end
  object BitBtn1: TBitBtn
    Left = 329
    Top = 80
    Width = 41
    Height = 25
    Caption = '<<'
    TabOrder = 5
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 376
    Top = 80
    Width = 41
    Height = 25
    Caption = '>>'
    TabOrder = 6
    OnClick = BitBtn2Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 111
    Width = 409
    Height = 68
    TabOrder = 7
  end
  object btCalcSalario: TBitBtn
    Left = 231
    Top = 80
    Width = 90
    Height = 25
    Caption = 'Calcular Salario'
    TabOrder = 8
    OnClick = btCalcSalarioClick
  end
end
