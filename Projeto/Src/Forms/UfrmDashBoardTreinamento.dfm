inherited frmDashboardTreinamento: TfrmDashboardTreinamento
  Caption = ''
  ExplicitTop = -13
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnl: TPanel
    inherited pnlDashboard: TPanel
      inherited shpCardAzul: TShape
        Tag = 1
      end
      inherited lblTituloCardAzul: TLabel
        Tag = 1
        Caption = 'Qtde De Clientes'
      end
      inherited lblValorCardAzul: TLabel
        Tag = 1
        OnClick = AcaoClickCard
      end
      inherited lblTituloDashBoard: TLabel
        Left = 431
        Width = 395
        Caption = 'DashBoard Treinamento'
        ExplicitLeft = 431
        ExplicitWidth = 395
      end
      inherited shpCardVerde: TShape
        Tag = 2
      end
      inherited shpCardAmarelo: TShape
        Tag = 3
      end
      inherited shpCardVermelho: TShape
        Tag = 3
      end
      inherited lblTituloCardVerde: TLabel
        Tag = 2
        Caption = 'N* Empregados'
        OnClick = AcaoClickCard
      end
      inherited lblValorCardVerde: TLabel
        Tag = 2
        OnClick = AcaoClickCard
      end
      inherited lblTituloCardAmarelo: TLabel
        Tag = 3
        Caption = 'Qtde de Vendas'
        OnClick = AcaoClickCard
      end
      inherited lblValorCardAmarelo: TLabel
        Tag = 3
        OnClick = AcaoClickCard
      end
      inherited lblTituloCardVermelho: TLabel
        Tag = 3
        Caption = 'Total de Vendas'
        OnClick = AcaoClickCard
      end
      inherited lblValorCardVermelho: TLabel
        Tag = 3
        OnClick = AcaoClickCard
      end
      inherited DBChartDashBoard: TDBChart
        BackWall.Brush.Gradient.EndColor = 7895160
        BackWall.Brush.Gradient.StartColor = 4605510
        BackWall.Pen.Visible = False
        Foot.Font.Color = clWhite
        Gradient.EndColor = 4605510
        Gradient.StartColor = 4605510
        Title.Font.Color = clWhite
        Title.Text.Strings = (
          'Evolu'#231#227'o das Vendas')
        BottomAxis.LabelsFormat.Font.Color = clWhite
        BottomAxis.MinorTicks.Visible = False
        BottomAxis.Ticks.Color = 8553090
        BottomAxis.Title.Font.Color = clWhite
        DepthAxis.LabelsFormat.Font.Color = clWhite
        DepthAxis.MinorTicks.Visible = False
        DepthAxis.Ticks.Color = 8553090
        DepthAxis.Title.Font.Color = clWhite
        DepthTopAxis.LabelsFormat.Font.Color = clWhite
        DepthTopAxis.MinorTicks.Visible = False
        DepthTopAxis.Ticks.Color = 8553090
        DepthTopAxis.Title.Font.Color = clWhite
        Frame.Visible = False
        LeftAxis.LabelsFormat.Font.Color = clWhite
        LeftAxis.MinorTicks.Visible = False
        LeftAxis.Ticks.Color = 8553090
        LeftAxis.Title.Font.Color = clWhite
        Legend.Brush.Gradient.Direction = gdBottomTop
        Legend.Brush.Gradient.EndColor = 7895160
        Legend.Brush.Gradient.StartColor = 4605510
        Legend.Brush.Gradient.Visible = True
        Legend.Font.Color = clWhite
        Legend.Frame.Visible = False
        Legend.Shadow.HorizSize = 0
        RightAxis.LabelsFormat.Font.Color = clWhite
        RightAxis.MinorTicks.Visible = False
        RightAxis.Ticks.Color = 8553090
        RightAxis.Title.Font.Color = clWhite
        TopAxis.LabelsFormat.Font.Color = clWhite
        TopAxis.MinorTicks.Visible = False
        TopAxis.Ticks.Color = 8553090
        TopAxis.Title.Font.Color = clWhite
        ColorPaletteIndex = -2
        ColorPalette = (
          5957320
          14456410
          2644710
          1024230)
        object Series1: TFastLineSeries
          HoverElement = []
          Selected.Hover.Visible = True
          Marks.Font.Color = clWhite
          Marks.Transparent = True
          DataSource = dmDados.cdsEvolucaoVendas
          XLabelsSource = 'MESANO'
          LinePen.Color = 5957320
          LinePen.EndStyle = esRound
          TreatNulls = tnDontPaint
          XValues.Name = 'X'
          XValues.Order = loAscending
          XValues.ValueSource = 'TOTALVENDAS'
          YValues.Name = 'Y'
          YValues.Order = loNone
          YValues.ValueSource = 'TOTALVENDAS'
        end
      end
      object DBChart2: TDBChart
        Left = 224
        Top = 317
        Width = 777
        Height = 186
        BackWall.Brush.Gradient.Direction = gdBottomTop
        BackWall.Brush.Gradient.EndColor = 7895160
        BackWall.Brush.Gradient.StartColor = 4605510
        BackWall.Brush.Gradient.Visible = True
        BackWall.Pen.Visible = False
        BackWall.Transparent = False
        Foot.Font.Color = clWhite
        Foot.Font.Name = 'Verdana'
        Gradient.Direction = gdBottomTop
        Gradient.EndColor = 4605510
        Gradient.StartColor = 4605510
        Gradient.Visible = True
        LeftWall.Color = 14745599
        RightWall.Color = 14745599
        Title.Font.Color = clWhite
        Title.Font.Name = 'Verdana'
        Title.Text.Strings = (
          'Produtos Mais Vendidos')
        BottomAxis.Axis.Color = 4210752
        BottomAxis.Grid.Color = 11119017
        BottomAxis.LabelsFormat.Font.Color = clWhite
        BottomAxis.LabelsFormat.Font.Name = 'Verdana'
        BottomAxis.MinorTicks.Visible = False
        BottomAxis.Ticks.Color = 8553090
        BottomAxis.TicksInner.Color = 11119017
        BottomAxis.Title.Font.Color = clWhite
        BottomAxis.Title.Font.Name = 'Verdana'
        DepthAxis.Axis.Color = 4210752
        DepthAxis.Grid.Color = 11119017
        DepthAxis.LabelsFormat.Font.Color = clWhite
        DepthAxis.LabelsFormat.Font.Name = 'Verdana'
        DepthAxis.MinorTicks.Visible = False
        DepthAxis.Ticks.Color = 8553090
        DepthAxis.TicksInner.Color = 11119017
        DepthAxis.Title.Font.Color = clWhite
        DepthAxis.Title.Font.Name = 'Verdana'
        DepthTopAxis.Axis.Color = 4210752
        DepthTopAxis.Grid.Color = 11119017
        DepthTopAxis.LabelsFormat.Font.Color = clWhite
        DepthTopAxis.LabelsFormat.Font.Name = 'Verdana'
        DepthTopAxis.MinorTicks.Visible = False
        DepthTopAxis.Ticks.Color = 8553090
        DepthTopAxis.TicksInner.Color = 11119017
        DepthTopAxis.Title.Font.Color = clWhite
        DepthTopAxis.Title.Font.Name = 'Verdana'
        Frame.Visible = False
        LeftAxis.Axis.Color = 4210752
        LeftAxis.Grid.Color = 11119017
        LeftAxis.LabelsFormat.Font.Color = clWhite
        LeftAxis.LabelsFormat.Font.Name = 'Verdana'
        LeftAxis.MinorTicks.Visible = False
        LeftAxis.Shape.Font.DefaultFont = True
        LeftAxis.Ticks.Color = 8553090
        LeftAxis.TicksInner.Color = 11119017
        LeftAxis.Title.Font.Color = clWhite
        LeftAxis.Title.Font.Name = 'Verdana'
        Legend.Brush.Gradient.Direction = gdBottomTop
        Legend.Brush.Gradient.EndColor = 7895160
        Legend.Brush.Gradient.StartColor = 4605510
        Legend.Brush.Gradient.Visible = True
        Legend.Font.Color = clWhite
        Legend.Font.Name = 'Verdana'
        Legend.Frame.Visible = False
        Legend.Shadow.HorizSize = 0
        Legend.Shadow.Transparency = 0
        RightAxis.Axis.Color = 4210752
        RightAxis.Grid.Color = 11119017
        RightAxis.LabelsFormat.Font.Color = clWhite
        RightAxis.LabelsFormat.Font.Name = 'Verdana'
        RightAxis.MinorTicks.Visible = False
        RightAxis.Ticks.Color = 8553090
        RightAxis.TicksInner.Color = 11119017
        RightAxis.Title.Font.Color = clWhite
        RightAxis.Title.Font.Name = 'Verdana'
        TopAxis.Axis.Color = 4210752
        TopAxis.Grid.Color = 11119017
        TopAxis.LabelsFormat.Font.Color = clWhite
        TopAxis.LabelsFormat.Font.Name = 'Verdana'
        TopAxis.MinorTicks.Visible = False
        TopAxis.Ticks.Color = 8553090
        TopAxis.TicksInner.Color = 11119017
        TopAxis.Title.Font.Color = clWhite
        TopAxis.Title.Font.Name = 'Verdana'
        TabOrder = 1
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = -2
        ColorPalette = (
          5957320
          14456410
          2644710
          1024230)
        object Series2: TPieSeries
          HoverElement = []
          Marks.Font.Color = clWhite
          Marks.Transparent = True
          DataSource = dmDados.cdsProdutoMaisVendido
          XLabelsSource = 'PRODUTO'
          XValues.Order = loAscending
          YValues.Name = 'Pie'
          YValues.Order = loNone
          YValues.ValueSource = 'TOTALVENDA'
          Frame.InnerBrush.BackColor = clRed
          Frame.InnerBrush.Gradient.EndColor = clGray
          Frame.InnerBrush.Gradient.MidColor = clWhite
          Frame.InnerBrush.Gradient.StartColor = 4210752
          Frame.InnerBrush.Gradient.Visible = True
          Frame.MiddleBrush.BackColor = clYellow
          Frame.MiddleBrush.Gradient.EndColor = 8553090
          Frame.MiddleBrush.Gradient.MidColor = clWhite
          Frame.MiddleBrush.Gradient.StartColor = clGray
          Frame.MiddleBrush.Gradient.Visible = True
          Frame.OuterBrush.BackColor = clGreen
          Frame.OuterBrush.Gradient.EndColor = 4210752
          Frame.OuterBrush.Gradient.MidColor = clWhite
          Frame.OuterBrush.Gradient.StartColor = clSilver
          Frame.OuterBrush.Gradient.Visible = True
          Frame.Width = 4
          OtherSlice.Legend.Visible = False
        end
      end
    end
  end
  inherited JvDockServer: TJvDockServer
    Left = 322
  end
end
