inherited frmCadastroVendedor: TfrmCadastroVendedor
  Caption = 'Cadastro de Vendedor'
  ClientHeight = 299
  ClientWidth = 678
  ExplicitWidth = 684
  ExplicitHeight = 328
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoes: TPanel
    Top = 256
    Width = 678
    TabOrder = 13
    ExplicitTop = 256
    ExplicitWidth = 678
  end
  object cxGroupBox1: TcxGroupBox [1]
    Left = 10
    Top = 4
    Caption = 'C'#243'digo '
    TabOrder = 0
    DesignSize = (
      100
      44)
    Height = 44
    Width = 100
    object edtCodigo: TcxDBTextEdit
      Left = 10
      Top = 16
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'CODIGO'
      DataBinding.DataSource = dsCadastro
      TabOrder = 0
      Width = 80
    end
  end
  object cxGroupBox2: TcxGroupBox [2]
    Left = 10
    Top = 100
    Caption = 'Data de Nascimento'
    TabOrder = 6
    DesignSize = (
      137
      44)
    Height = 44
    Width = 137
    object edtDataNascimento: TcxDBDateEdit
      Left = 10
      Top = 16
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'DATANASCIMENTO'
      DataBinding.DataSource = dsCadastro
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 0
      ExplicitWidth = 114
      Width = 117
    end
  end
  object rdgTipoPessoa: TcxDBRadioGroup [3]
    Left = 120
    Top = 2
    TabStop = False
    Caption = 'Tipo de Pessoa'
    DataBinding.DataField = 'PESSOAJURIDICA'
    DataBinding.DataSource = dsCadastro
    Properties.Columns = 2
    Properties.DefaultValue = 'N'
    Properties.ImmediatePost = True
    Properties.Items = <
      item
        Caption = 'Pessoa F'#237'sica'
        Value = 'N'
      end
      item
        Caption = 'Pessoa Jur'#237'dica'
        Value = 'S'
      end>
    TabOrder = 1
    Height = 44
    Width = 195
  end
  object CPF: TcxGroupBox [4]
    Left = 325
    Top = 4
    Caption = 'CPF/CNPJ'
    TabOrder = 2
    DesignSize = (
      164
      44)
    Height = 44
    Width = 164
    object btnBuscarDadosInscricao: TSpeedButton
      Left = 132
      Top = 12
      Width = 26
      Height = 27
      Hint = 'Buscar Dados do CNPJ'
      Anchors = [akTop, akRight]
      Flat = True
      Glyph.Data = {
        B60D0000424DB60D000000000000360000002800000030000000180000000100
        180000000000800D0000120B0000120B00000000000000000000CCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCACACACACACACACACACACACACACACACACACACACACACACACACACACACACACA
        CACACACACACACACACACACACACACACACACACACACACACACACACACACACACACACACA
        CACACACACACACACACACACCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCACACACACACACACACACACACACACA
        CACACACACACACACACACACACACACACACACACACACACACACACACACACACACACACACA
        CACACACACACACACACACACACACACACACACACACACACACACACACACACCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC7C7C7BBBBBBB3B3B3AFAEAFADAD
        ADB2B1B1BBBBBBC7C7C7CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCACACACACACACACACACACACACACACACACACACACACACACACAC6C6C6B9B9B9
        B2B2B2ADADADABABABAFAFAFB9B9B9C6C6C6CACACACACACACACACACACACACACA
        CACACACACACACACACACACCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC8C8C8B5
        B5B5B2B0B2B6B4B6B1B2B1A6AFA7A1AAA1A1A3A1A19FA1A2A1A2B2B2B2C7C7C7
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCACACACACACACACACACACACACACA
        CACACACAC7C7C7B4B4B4AEAEAEB3B3B3B0B0B0ABABABA6A6A6A1A1A19E9E9EA0
        A0A0B0B0B0C6C6C6CACACACACACACACACACACACACACACACACACACCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCC2C2C2B5B4B5C7C7C7AAC0A96AAE6941AC4431B13A33B3
        4042B05060A96B8BA48FA09FA0A4A3A4C1C1C1CCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCACACACACACACACACACACACACACACAC1C1C1B3B3B3C6C6C6B8B8B8999999
        8D8D8D8D8D8D9090909292929494949D9D9D9E9E9EA1A1A1C0C0C0CACACACACA
        CACACACACACACACACACACCCCCCCCCCCCCCCCCCCCCCCCC2C2C2B9B8B9CED2CD73
        AF6C22A21B16AF1418B81E39C44431C64423C63D26C6432EBB4960A96E9EA49F
        A2A1A1C1C1C1CCCCCCCCCCCCCCCCCCCCCCCCCACACACACACACACACACACACAC1C1
        C1B7B7B7CFCFCF9B9B9B7A7A7A8282828A8A8A9E9E9E9E9E9E9B9B9B9D9D9D97
        9797959595A1A1A1A0A0A0C0C0C0CACACACACACACACACACACACACCCCCCCCCCCC
        CCCCCCC8C8C8B7B7B8CCD0CB5AA14E159A0416A70D1EB01D5DC361B4D4B752CA
        6424C5412CC94E2DCB5028C5464EAC5E9DA49EA4A4A4C7C7C7CCCCCCCCCCCCCC
        CCCCCACACACACACACACACAC7C7C7B6B6B6CDCDCD8989896F6F6F7A7A7A858585
        A5A5A5C9C9C9AAAAAA9B9B9BA2A2A2A5A5A59C9C9C939393A1A1A1A2A2A2C6C6
        C6CACACACACACACACACACCCCCCCCCCCCCCCCCCBABABACDCCCD75A66B16900116
        9A042CAA2285C784CAD1CACED0CE8ACF9557CC6D37CB582DCA522BC94B23C53D
        5DA867A1A1A1B2B1B2CCCCCCCCCCCCCCCCCCCACACACACACACACACAB9B9B9CACA
        CA9494946767676F6F6F838383B3B3B3CDCDCDCDCDCDBCBCBCAEAEAEA6A6A6A4
        A4A4A1A1A19A9A9A939393A0A0A0AFAFAFCACACACACACACACACACCCCCCCCCCCC
        C8C8C8BEBDBEB4C2B12B8B16178F0036A224AFD2ACDCDBDCD6D6D6D2D2D2D0CF
        D0CAD1CBA4D3AE4CCD6627C64424C73C26B93788A38BA2A0A2C7C7C7CCCCCCCC
        CCCCCACACACACACAC7C7C7BCBCBCBBBBBB6A6A6A6767677D7D7DC6C6C6D9D9D9
        D5D5D5D1D1D1CFCFCFCECECEC5C5C5ACACAC9D9D9D9C9C9C9191919A9A9A9F9F
        9FC6C6C6CACACACACACACCCCCCCCCCCCBEBEBECAC9CA7EA5731C86001A8B002C
        981691C589DADFD9DEDDDED8D8D8D5D5D5D2D0D2D1CFD1B0D2B63DC75121C334
        1BC22A5AA75FA1A0A1BABABACCCCCCCCCCCCCACACACACACABCBCBCC7C7C79797
        97616161646464737373B3B3B3DCDCDCDDDDDDD6D6D6D4D4D4CFCFCFCFCFCFC8
        C8C8A3A3A39898989393939191919F9F9FB9B9B9CACACACACACACCCCCCCCCCCC
        BCBCBCCCCBCC71A1631F84021C87001A8B001F960C66B85DC8DBC7DDDFDD8ACD
        8DABD1ADD3D2D3D1D0D180CC881FBF2D19C02439AD3EA0A3A0B1B1B1CCCCCCCC
        CCCCCACACACACACABABABACACACA9090906060606262626464646F6F6F9D9D9D
        D4D4D4DCDCDCB8B8B8C5C5C5D1D1D1CFCFCFB6B6B69393939191918C8C8CA1A1
        A1AFAFAFCACACACACACACCCCCCCCCCCCBCBCBCCACAC999BA8E4F9C371F84021D
        87011D8E041B970A42AD39A2D19F4ABC4C3DBA41C3D6C3D8D4D8AFD1B128BD2F
        17BC1B2AAF2C9FA99FADADADCCCCCCCCCCCCCACACACACACABABABAC8C8C8AEAE
        AE7F7F7F6060606262626767676E6E6E8B8B8BC1C1C19B9B9B969696D0D0D0D3
        D3D3C6C6C69292928C8C8C898989A4A4A4ABABABCACACACACACACCCCCCCCCCCC
        BCBCBCC8C9C8A9C19F8FBD7E64A74F9BC88FB0D5A886C37C1E980E26A21C25A8
        1F23AC21ADD4ADDFDBDFBED5BF2DBA2D13B6112AAC27A4AEA4AEADAECCCCCCCC
        CCCCCACACACACACABABABAC7C7C7B7B7B7ABABAB8E8E8EB8B8B8C7C7C7AEAEAE
        7070707A7A7A808080848484C7C7C7DBDBDBCDCDCD919191868686868686A9A9
        A9ABABABCACACACACACACCCCCCCCCCCCBCBCBCC6C6C7B2C3ABA0C5909CC48CE5
        F0E1FFFFFFE3EFE142A230169303169A083DAE35CCDFCCE5E2E5B5D6B425B31F
        19B3113FA838AFB2AFB2B2B3CCCCCCCCCCCCCACACACACACABABABAC5C5C5BBBB
        BBB5B5B5B4B4B4EAEAEAFEFEFEE9E9E98181816A6A6A7070708B8B8BD8D8D8E1
        E1E1CCCCCC888888848484878787B0B0B0B1B1B1CACACACACACACCCCCCCCCCCC
        BFBFBFC4C4C4BCC3B9AECCA0A0C591CCE0C4FFFFFFFFFFFFC8E3C370B8616CBA
        60BEDDBAEEEDEEECEAEC96D08F36B3282EB21F6FAD68B6B5B6BBBBBBCCCCCCCC
        CCCCCACACACACACABDBDBDC3C3C3BFBFBFBFBFBFB5B5B5D7D7D7FEFEFEFEFEFE
        D9D9D99F9F9FA0A0A0D2D2D2ECECECEAEAEABCBCBC8B8B8B888888999999B4B4
        B4B9B9B9CACACACACACACCCCCCCCCCCCC8C8C8BDBDBDC2C3C2BBCDB2ACCB9EAE
        CEA2E9F2E6FFFFFFFFFFFFFCFDFCFBFBFBFBFAFCF8F7F9D3E7D066BD5746B536
        43AB35ACC0AAB2B1B2C7C7C7CCCCCCCCCCCCCACACACACACAC7C7C7BCBCBCC2C2
        C2C4C4C4BEBEBEC1C1C1EDEDEDFEFEFEFEFEFEFBFBFBFAFAFAF9F9F9F5F5F5E0
        E0E0A0A0A0919191898989B9B9B9AFAFAFC6C6C6CACACACACACACCCCCCCCCCCC
        CCCCCCBCBCBCC4C4C4BFC3BCBCD3B2AECCA0B5D2AAE1EDDDFBFCFAFFFFFFFFFF
        FFF8FAF7D1E7CC80C3735CB74B50B24186B67EC7C7C7B5B5B5CCCCCCCCCCCCCC
        CCCCCACACACACACACACACABABABAC3C3C3BFBFBFC8C8C8BFBFBFC7C7C7E7E7E7
        FBFBFBFEFEFEFEFEFEF7F7F7DFDFDFACACAC979797919191A5A5A5C6C6C6B4B4
        B4CACACACACACACACACACCCCCCCCCCCCCCCCCCC8C8C8BBBBBBC4C4C4C0C6BCBF
        D4B4B0CEA3ACCD9FB8D5AEC5DEBDC0DCB7A5CF9981BF7271BA6067B65780B277
        CED2CDB5B4B5C7C7C7CCCCCCCCCCCCCCCCCCCACACACACACACACACAC7C7C7B9B9
        B9C3C3C3C1C1C1CACACAC1C1C1BFBFBFC9C9C9D4D4D4D0D0D0BFBFBFA9A9A9A1
        A1A19B9B9BA1A1A1CFCFCFB3B3B3C6C6C6CACACACACACACACACACCCCCCCCCCCC
        CCCCCCCCCCCCC3C3C3BCBCBCC4C4C4C0C4BEC0D1B8B6D1ABAACC9DA0C89297C4
        888FC27F87BF7882B7759CBA95CFD1CEB9B8B9C1C1C1CCCCCCCCCCCCCCCCCCCC
        CCCCCACACACACACACACACACACACAC2C2C2BABABAC3C3C3C1C1C1C9C9C9C6C6C6
        BEBEBEB9B9B9B2B2B2AFAFAFAAAAAAA3A3A3AFAFAFCECECEB7B7B7C0C0C0CACA
        CACACACACACACACACACACCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC3C3C3BBBBBBC4
        C4C4C3C4C3C0C5BDBCC9B6B6CAAEAEC7A5A8C0A0ADBFA8C3C9C1CDCCCDB8B7B8
        C2C2C2CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCACACACACACACACACACACACACACA
        CAC2C2C2B9B9B9C3C3C3C3C3C3C1C1C1C2C2C2C1C1C1BDBDBDB7B7B7B7B7B7C6
        C6C6CACACAB6B6B6C1C1C1CACACACACACACACACACACACACACACACCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCC8C8C8BCBCBCBDBDBDC4C4C4C7C6C7C9C9C9CACB
        CACBCBCBC9C8C9BEBDBEB9B9B9C7C7C7CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCACACACACACACACACACACACACACACACACACAC7C7C7BABABABCBCBCC3C3C3
        C5C5C5C7C7C7C9C9C9CACACAC7C7C7BCBCBCB8B8B8C6C6C6CACACACACACACACA
        CACACACACACACACACACACCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCC7C7C7BFBFBFBCBCBCBBBBBBBBBBBBBBBBBBBEBEBEC7C7C7CCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCACACACACACACACACACACACACACA
        CACACACACACACACACACAC6C6C6BDBDBDBABABAB9B9B9B9B9B9B9B9B9BCBCBCC6
        C6C6CACACACACACACACACACACACACACACACACACACACACACACACACCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCACACACACACACACACACACACACACACACACACACACACACACACACACACACACACA
        CACACACACACACACACACACACACACACACACACACACACACACACACACACACACACACACA
        CACACACACACACACACACACCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCACACACACACACACACACACACACACA
        CACACACACACACACACACACACACACACACACACACACACACACACACACACACACACACACA
        CACACACACACACACACACACACACACACACACACACACACACACACCCCCC}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
    end
    object edtInscricao: TcxDBMaskEdit
      Left = 10
      Top = 16
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'CNPJCPF'
      DataBinding.DataSource = dsCadastro
      Properties.EditMask = '000\.000\.000\-999;0; '
      TabOrder = 0
      Width = 116
    end
  end
  object NOME: TcxGroupBox [5]
    Left = 10
    Top = 52
    Caption = ' Nome do Vendedor'
    TabOrder = 4
    DesignSize = (
      479
      44)
    Height = 44
    Width = 479
    object edtNomeVendedor: TcxDBTextEdit
      Left = 10
      Top = 16
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'NOME'
      DataBinding.DataSource = dsCadastro
      TabOrder = 0
      Width = 459
    end
  end
  object cxGroupBox3: TcxGroupBox [6]
    Left = 304
    Top = 147
    Caption = 'Cidade'
    TabOrder = 10
    DesignSize = (
      185
      44)
    Height = 44
    Width = 185
    object edtCidade: TcxDBTextEdit
      Left = 10
      Top = 16
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'CIDADE'
      DataBinding.DataSource = dsCadastro
      TabOrder = 0
      Width = 165
    end
  end
  object cxGroupBox4: TcxGroupBox [7]
    Left = 10
    Top = 147
    Caption = 'Bairro'
    TabOrder = 9
    DesignSize = (
      284
      44)
    Height = 44
    Width = 284
    object edtBairro: TcxDBTextEdit
      Left = 10
      Top = 16
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'BAIRRO'
      DataBinding.DataSource = dsCadastro
      TabOrder = 0
      Width = 264
    end
  end
  object cxGroupBox7: TcxGroupBox [8]
    Left = 304
    Top = 100
    Caption = 'Endere'#231'o '
    TabOrder = 8
    DesignSize = (
      337
      44)
    Height = 44
    Width = 337
    object edtEndereco: TcxDBTextEdit
      Left = 10
      Top = 16
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'ENDERECO'
      DataBinding.DataSource = dsCadastro
      TabOrder = 0
      Width = 317
    end
  end
  object cxGroupBox10: TcxGroupBox [9]
    Left = 499
    Top = 147
    Caption = 'UF'
    TabOrder = 11
    DesignSize = (
      142
      44)
    Height = 44
    Width = 142
    object edtUF: TcxDBComboBox
      Left = 10
      Top = 16
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'UF'
      DataBinding.DataSource = dsCadastro
      Properties.Items.Strings = (
        'AC - Acre'
        'AL - Alagoas'
        'AM - Amazonas'
        'AP - Amap'#225
        'BA - Bahia'
        'CE - Cear'#225
        'DF - Distrito Federal'
        'DV - Diversos'
        'ES - Esp'#237'rito Santo'
        'GO - Goi'#225's'
        'MA - Maranh'#227'o'
        'MG - Minas Gerais'
        'MS - Mato Grosso do Sul'
        'MT - Mato Grosso'
        'PA - Par'#225
        'PB - Para'#237'ba'
        'PE - Pernambuco'
        'PI - Piau'#237
        'PR - Paran'#225
        'RJ - Rio de Janeiro'
        'RN - Rio Grande do Norte'
        'RO - Rond'#244'nia'
        'RR - Roraima'
        'RS - Rio Grande do Sul'
        'SC - Santa Catarina'
        'SE - Sergipe'
        'SP - S'#227'o Paulo'
        'TO - Tocantins'
        'XX - Indefinido')
      TabOrder = 0
      Width = 122
    end
  end
  object cxGroupBox9: TcxGroupBox [10]
    Left = 499
    Top = 4
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Telefone'
    TabOrder = 3
    DesignSize = (
      149
      44)
    Height = 44
    Width = 149
    object edtTelefone: TcxDBMaskEdit
      Left = 10
      Top = 16
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'TELEFONE'
      DataBinding.DataSource = dsCadastro
      Properties.EditMask = '!\(99\)00000-0000;1; '
      TabOrder = 0
      Width = 129
    end
  end
  object edtValorCusto: TcxGroupBox [11]
    Left = 499
    Top = 52
    Caption = 'Percentual Comiss'#227'o'
    TabOrder = 5
    DesignSize = (
      142
      44)
    Height = 44
    Width = 142
    object edtPercentualComissao: TcxDBCalcEdit
      Left = 10
      Top = 16
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'PERCENTUALCOMISSAO'
      DataBinding.DataSource = dsCadastro
      Properties.DisplayFormat = '0.00#%'
      TabOrder = 0
      Width = 122
    end
  end
  object CEP: TcxGroupBox [12]
    Left = 157
    Top = 100
    Caption = 'CEP'
    TabOrder = 7
    DesignSize = (
      137
      44)
    Height = 44
    Width = 137
    object btnBuscarDadosCEP: TSpeedButton
      Left = 106
      Top = 11
      Width = 26
      Height = 27
      Hint = 'Buscar Dados do CEP'
      Anchors = [akTop, akRight]
      Flat = True
      Glyph.Data = {
        B60D0000424DB60D000000000000360000002800000030000000180000000100
        180000000000800D0000120B0000120B00000000000000000000CCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCACACACACACACACACACACACACACACACACACACACACACACACACACACACACACA
        CACACACACACACACACACACACACACACACACACACACACACACACACACACACACACACACA
        CACACACACACACACACACACCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCACACACACACACACACACACACACACA
        CACACACACACACACACACACACACACACACACACACACACACACACACACACACACACACACA
        CACACACACACACACACACACACACACACACACACACACACACACACACACACCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC7C7C7BBBBBBB3B3B3AFAEAFADAD
        ADB2B1B1BBBBBBC7C7C7CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCACACACACACACACACACACACACACACACACACACACACACACACAC6C6C6B9B9B9
        B2B2B2ADADADABABABAFAFAFB9B9B9C6C6C6CACACACACACACACACACACACACACA
        CACACACACACACACACACACCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC8C8C8B5
        B5B5B2B0B2B6B4B6B1B2B1A6AFA7A1AAA1A1A3A1A19FA1A2A1A2B2B2B2C7C7C7
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCACACACACACACACACACACACACACA
        CACACACAC7C7C7B4B4B4AEAEAEB3B3B3B0B0B0ABABABA6A6A6A1A1A19E9E9EA0
        A0A0B0B0B0C6C6C6CACACACACACACACACACACACACACACACACACACCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCC2C2C2B5B4B5C7C7C7AAC0A96AAE6941AC4431B13A33B3
        4042B05060A96B8BA48FA09FA0A4A3A4C1C1C1CCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCACACACACACACACACACACACACACACAC1C1C1B3B3B3C6C6C6B8B8B8999999
        8D8D8D8D8D8D9090909292929494949D9D9D9E9E9EA1A1A1C0C0C0CACACACACA
        CACACACACACACACACACACCCCCCCCCCCCCCCCCCCCCCCCC2C2C2B9B8B9CED2CD73
        AF6C22A21B16AF1418B81E39C44431C64423C63D26C6432EBB4960A96E9EA49F
        A2A1A1C1C1C1CCCCCCCCCCCCCCCCCCCCCCCCCACACACACACACACACACACACAC1C1
        C1B7B7B7CFCFCF9B9B9B7A7A7A8282828A8A8A9E9E9E9E9E9E9B9B9B9D9D9D97
        9797959595A1A1A1A0A0A0C0C0C0CACACACACACACACACACACACACCCCCCCCCCCC
        CCCCCCC8C8C8B7B7B8CCD0CB5AA14E159A0416A70D1EB01D5DC361B4D4B752CA
        6424C5412CC94E2DCB5028C5464EAC5E9DA49EA4A4A4C7C7C7CCCCCCCCCCCCCC
        CCCCCACACACACACACACACAC7C7C7B6B6B6CDCDCD8989896F6F6F7A7A7A858585
        A5A5A5C9C9C9AAAAAA9B9B9BA2A2A2A5A5A59C9C9C939393A1A1A1A2A2A2C6C6
        C6CACACACACACACACACACCCCCCCCCCCCCCCCCCBABABACDCCCD75A66B16900116
        9A042CAA2285C784CAD1CACED0CE8ACF9557CC6D37CB582DCA522BC94B23C53D
        5DA867A1A1A1B2B1B2CCCCCCCCCCCCCCCCCCCACACACACACACACACAB9B9B9CACA
        CA9494946767676F6F6F838383B3B3B3CDCDCDCDCDCDBCBCBCAEAEAEA6A6A6A4
        A4A4A1A1A19A9A9A939393A0A0A0AFAFAFCACACACACACACACACACCCCCCCCCCCC
        C8C8C8BEBDBEB4C2B12B8B16178F0036A224AFD2ACDCDBDCD6D6D6D2D2D2D0CF
        D0CAD1CBA4D3AE4CCD6627C64424C73C26B93788A38BA2A0A2C7C7C7CCCCCCCC
        CCCCCACACACACACAC7C7C7BCBCBCBBBBBB6A6A6A6767677D7D7DC6C6C6D9D9D9
        D5D5D5D1D1D1CFCFCFCECECEC5C5C5ACACAC9D9D9D9C9C9C9191919A9A9A9F9F
        9FC6C6C6CACACACACACACCCCCCCCCCCCBEBEBECAC9CA7EA5731C86001A8B002C
        981691C589DADFD9DEDDDED8D8D8D5D5D5D2D0D2D1CFD1B0D2B63DC75121C334
        1BC22A5AA75FA1A0A1BABABACCCCCCCCCCCCCACACACACACABCBCBCC7C7C79797
        97616161646464737373B3B3B3DCDCDCDDDDDDD6D6D6D4D4D4CFCFCFCFCFCFC8
        C8C8A3A3A39898989393939191919F9F9FB9B9B9CACACACACACACCCCCCCCCCCC
        BCBCBCCCCBCC71A1631F84021C87001A8B001F960C66B85DC8DBC7DDDFDD8ACD
        8DABD1ADD3D2D3D1D0D180CC881FBF2D19C02439AD3EA0A3A0B1B1B1CCCCCCCC
        CCCCCACACACACACABABABACACACA9090906060606262626464646F6F6F9D9D9D
        D4D4D4DCDCDCB8B8B8C5C5C5D1D1D1CFCFCFB6B6B69393939191918C8C8CA1A1
        A1AFAFAFCACACACACACACCCCCCCCCCCCBCBCBCCACAC999BA8E4F9C371F84021D
        87011D8E041B970A42AD39A2D19F4ABC4C3DBA41C3D6C3D8D4D8AFD1B128BD2F
        17BC1B2AAF2C9FA99FADADADCCCCCCCCCCCCCACACACACACABABABAC8C8C8AEAE
        AE7F7F7F6060606262626767676E6E6E8B8B8BC1C1C19B9B9B969696D0D0D0D3
        D3D3C6C6C69292928C8C8C898989A4A4A4ABABABCACACACACACACCCCCCCCCCCC
        BCBCBCC8C9C8A9C19F8FBD7E64A74F9BC88FB0D5A886C37C1E980E26A21C25A8
        1F23AC21ADD4ADDFDBDFBED5BF2DBA2D13B6112AAC27A4AEA4AEADAECCCCCCCC
        CCCCCACACACACACABABABAC7C7C7B7B7B7ABABAB8E8E8EB8B8B8C7C7C7AEAEAE
        7070707A7A7A808080848484C7C7C7DBDBDBCDCDCD919191868686868686A9A9
        A9ABABABCACACACACACACCCCCCCCCCCCBCBCBCC6C6C7B2C3ABA0C5909CC48CE5
        F0E1FFFFFFE3EFE142A230169303169A083DAE35CCDFCCE5E2E5B5D6B425B31F
        19B3113FA838AFB2AFB2B2B3CCCCCCCCCCCCCACACACACACABABABAC5C5C5BBBB
        BBB5B5B5B4B4B4EAEAEAFEFEFEE9E9E98181816A6A6A7070708B8B8BD8D8D8E1
        E1E1CCCCCC888888848484878787B0B0B0B1B1B1CACACACACACACCCCCCCCCCCC
        BFBFBFC4C4C4BCC3B9AECCA0A0C591CCE0C4FFFFFFFFFFFFC8E3C370B8616CBA
        60BEDDBAEEEDEEECEAEC96D08F36B3282EB21F6FAD68B6B5B6BBBBBBCCCCCCCC
        CCCCCACACACACACABDBDBDC3C3C3BFBFBFBFBFBFB5B5B5D7D7D7FEFEFEFEFEFE
        D9D9D99F9F9FA0A0A0D2D2D2ECECECEAEAEABCBCBC8B8B8B888888999999B4B4
        B4B9B9B9CACACACACACACCCCCCCCCCCCC8C8C8BDBDBDC2C3C2BBCDB2ACCB9EAE
        CEA2E9F2E6FFFFFFFFFFFFFCFDFCFBFBFBFBFAFCF8F7F9D3E7D066BD5746B536
        43AB35ACC0AAB2B1B2C7C7C7CCCCCCCCCCCCCACACACACACAC7C7C7BCBCBCC2C2
        C2C4C4C4BEBEBEC1C1C1EDEDEDFEFEFEFEFEFEFBFBFBFAFAFAF9F9F9F5F5F5E0
        E0E0A0A0A0919191898989B9B9B9AFAFAFC6C6C6CACACACACACACCCCCCCCCCCC
        CCCCCCBCBCBCC4C4C4BFC3BCBCD3B2AECCA0B5D2AAE1EDDDFBFCFAFFFFFFFFFF
        FFF8FAF7D1E7CC80C3735CB74B50B24186B67EC7C7C7B5B5B5CCCCCCCCCCCCCC
        CCCCCACACACACACACACACABABABAC3C3C3BFBFBFC8C8C8BFBFBFC7C7C7E7E7E7
        FBFBFBFEFEFEFEFEFEF7F7F7DFDFDFACACAC979797919191A5A5A5C6C6C6B4B4
        B4CACACACACACACACACACCCCCCCCCCCCCCCCCCC8C8C8BBBBBBC4C4C4C0C6BCBF
        D4B4B0CEA3ACCD9FB8D5AEC5DEBDC0DCB7A5CF9981BF7271BA6067B65780B277
        CED2CDB5B4B5C7C7C7CCCCCCCCCCCCCCCCCCCACACACACACACACACAC7C7C7B9B9
        B9C3C3C3C1C1C1CACACAC1C1C1BFBFBFC9C9C9D4D4D4D0D0D0BFBFBFA9A9A9A1
        A1A19B9B9BA1A1A1CFCFCFB3B3B3C6C6C6CACACACACACACACACACCCCCCCCCCCC
        CCCCCCCCCCCCC3C3C3BCBCBCC4C4C4C0C4BEC0D1B8B6D1ABAACC9DA0C89297C4
        888FC27F87BF7882B7759CBA95CFD1CEB9B8B9C1C1C1CCCCCCCCCCCCCCCCCCCC
        CCCCCACACACACACACACACACACACAC2C2C2BABABAC3C3C3C1C1C1C9C9C9C6C6C6
        BEBEBEB9B9B9B2B2B2AFAFAFAAAAAAA3A3A3AFAFAFCECECEB7B7B7C0C0C0CACA
        CACACACACACACACACACACCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC3C3C3BBBBBBC4
        C4C4C3C4C3C0C5BDBCC9B6B6CAAEAEC7A5A8C0A0ADBFA8C3C9C1CDCCCDB8B7B8
        C2C2C2CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCACACACACACACACACACACACACACA
        CAC2C2C2B9B9B9C3C3C3C3C3C3C1C1C1C2C2C2C1C1C1BDBDBDB7B7B7B7B7B7C6
        C6C6CACACAB6B6B6C1C1C1CACACACACACACACACACACACACACACACCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCC8C8C8BCBCBCBDBDBDC4C4C4C7C6C7C9C9C9CACB
        CACBCBCBC9C8C9BEBDBEB9B9B9C7C7C7CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCACACACACACACACACACACACACACACACACACAC7C7C7BABABABCBCBCC3C3C3
        C5C5C5C7C7C7C9C9C9CACACAC7C7C7BCBCBCB8B8B8C6C6C6CACACACACACACACA
        CACACACACACACACACACACCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCC7C7C7BFBFBFBCBCBCBBBBBBBBBBBBBBBBBBBEBEBEC7C7C7CCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCACACACACACACACACACACACACACA
        CACACACACACACACACACAC6C6C6BDBDBDBABABAB9B9B9B9B9B9B9B9B9BCBCBCC6
        C6C6CACACACACACACACACACACACACACACACACACACACACACACACACCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCACACACACACACACACACACACACACACACACACACACACACACACACACACACACACA
        CACACACACACACACACACACACACACACACACACACACACACACACACACACACACACACACA
        CACACACACACACACACACACCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCACACACACACACACACACACACACACA
        CACACACACACACACACACACACACACACACACACACACACACACACACACACACACACACACA
        CACACACACACACACACACACACACACACACACACACACACACACACCCCCC}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 57
    end
    object edtCep: TcxDBMaskEdit
      Left = 10
      Top = 16
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'CEP'
      DataBinding.DataSource = dsCadastro
      Properties.EditMask = '00\.000\-999;0; '
      TabOrder = 0
      ExplicitWidth = 77
      Width = 92
    end
  end
  object cxGroupBox5: TcxGroupBox [13]
    Left = 8
    Top = 197
    Caption = 'Volume Geral Vendas'
    TabOrder = 12
    DesignSize = (
      134
      44)
    Height = 44
    Width = 134
    object edtVolumeGeralVendas: TcxDBCalcEdit
      Left = 10
      Top = 16
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'VOLUMEGERALVENDAS'
      DataBinding.DataSource = dsCadastro
      Properties.DisplayFormat = 'R$ #0.00'
      TabOrder = 0
      Width = 114
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsVendedores
  end
end
