import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_examples/model/model.dart';
import 'package:flutter_examples/widgets/flutter_backdrop.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:url_launcher/url_launcher.dart';

class StepLineDashed extends StatefulWidget {
  final SubItemList sample;
  const StepLineDashed(this.sample, {Key key}) : super(key: key);

  @override
  _StepLineDashedState createState() => _StepLineDashedState(sample);
}

class _StepLineDashedState extends State<StepLineDashed> {
  final SubItemList sample;

  _StepLineDashedState(this.sample);

  bool panelOpen;
  final frontPanelVisible = ValueNotifier<bool>(true);

  @override
  void initState() {
    panelOpen = frontPanelVisible.value;
    frontPanelVisible.addListener(_subscribeToValueNotifier);
    super.initState();
  }

  void _subscribeToValueNotifier() => panelOpen = frontPanelVisible.value;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(StepLineDashed oldWidget) {
    super.didUpdateWidget(oldWidget);
    frontPanelVisible.removeListener(_subscribeToValueNotifier);
    frontPanelVisible.addListener(_subscribeToValueNotifier);
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<SampleListModel>(
        builder: (context, _, model) => SafeArea(
              child: Backdrop(
                needCloseButton: false,
                panelVisible: frontPanelVisible,
                sampleListModel: model,
                frontPanelOpenPercentage: 0.28,
                appBarAnimatedLeadingMenuIcon: AnimatedIcons.close_menu,
                appBarActions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Container(
                      height: 40,
                      width: 40,
                      child: IconButton(
                        icon: Image.asset(model.codeViewerIcon,
                            color: Colors.white),
                        onPressed: () {
                          launch(
                              'https://github.com/syncfusion/flutter-examples/blob/master/lib/samples/chart/cartesian_charts/stepLine_series/stepline_with_dashes.dart');
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Container(
                      height: 40,
                      width: 40,
                      child: IconButton(
                        icon: Image.asset(model.informationIcon,
                            color: Colors.white),
                        onPressed: () {
                          if (frontPanelVisible.value)
                            frontPanelVisible.value = false;
                          else
                            frontPanelVisible.value = true;
                        },
                      ),
                    ),
                  ),
                ],
                appBarTitle: AnimatedSwitcher(
                    duration: Duration(milliseconds: 1000),
                    child: Text(sample.title.toString())),
                backLayer: BackPanel(sample),
                frontLayer: FrontPanel(sample),
                sideDrawer: null,
                headerClosingHeight: 350,
                titleVisibleOnPanelClosed: true,
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12), bottom: Radius.circular(0)),
              ),
            ));
  }
}

class FrontPanel extends StatefulWidget {
  final SubItemList subItemList;
  FrontPanel(this.subItemList);

  @override
  _FrontPanelState createState() => _FrontPanelState(this.subItemList);
}

class _FrontPanelState extends State<FrontPanel> {
  final SubItemList sample;
  _FrontPanelState(this.sample);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<SampleListModel>(
        rebuildOnChange: true,
        builder: (context, _, model) {
          return Scaffold(
              body: Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 50),
            child: Container(child: getDashedStepLineChart(false)),
          ));
        });
  }
}

class BackPanel extends StatefulWidget {
  final SubItemList sample;

  BackPanel(this.sample);

  @override
  _BackPanelState createState() => _BackPanelState(sample);
}

class _BackPanelState extends State<BackPanel> {
  final SubItemList sample;
  GlobalKey _globalKey = GlobalKey();
  _BackPanelState(this.sample);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  _afterLayout(_) {
    _getSizesAndPosition();
  }

  _getSizesAndPosition() {
    final RenderBox renderBoxRed = _globalKey.currentContext.findRenderObject();
    final size = renderBoxRed.size;
    final position = renderBoxRed.localToGlobal(Offset.zero);
    double appbarHeight = 60;
    BackdropState.frontPanelHeight =
        position.dy + (size.height - appbarHeight) + 20;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<SampleListModel>(
      rebuildOnChange: true,
      builder: (context, _, model) {
        return Container(
          color: model.backgroundColor,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  sample.title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      color: Colors.white,
                      letterSpacing: 0.53),
                ),
                Padding(
                  key: _globalKey,
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    sample.description,
                    style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15.0,
                        color: Colors.white,
                        letterSpacing: 0.3,
                        height: 1.5),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

SfCartesianChart getDashedStepLineChart(bool isTileView) {
  return SfCartesianChart(
    plotAreaBorderWidth: 0,
    title: ChartTitle(text: isTileView ? '' : 'CO2 - Intensity analysis'),
    primaryXAxis: NumericAxis(
      majorGridLines: MajorGridLines(width: 0),
      title: AxisTitle(text: isTileView ? '' : 'Year'),
    ),
    primaryYAxis: NumericAxis(
      axisLine: AxisLine(width: 0),
      minimum: 360,
      maximum: 600,
      interval: 30,
      majorTickLines: MajorTickLines(size: 0),
      title: AxisTitle(text: isTileView ? '' : 'Intensity (g/kWh)'),
    ),
    legend: Legend(isVisible: isTileView ? false : true),
    tooltipBehavior: TooltipBehavior(enable: true),
    series: getStepLineSeries(isTileView),
  );
}

List<StepLineSeries<_StepLineData, num>> getStepLineSeries(bool isTileView) {
  final List<_StepLineData> chartData = <_StepLineData>[
    _StepLineData(2006, 378, 463, 519, 570),
    _StepLineData(2007, 416, 449, 508, 579),
    _StepLineData(2008, 404, 458, 502, 563),
    _StepLineData(2009, 390, 450, 495, 550),
    _StepLineData(2010, 376, 425, 485, 545),
    _StepLineData(2011, 365, 430, 470, 525)
  ];
  return <StepLineSeries<_StepLineData, num>>[
    StepLineSeries<_StepLineData, num>(
        dataSource: chartData,
        xValueMapper: (_StepLineData data, _) => data.x,
        yValueMapper: (_StepLineData data, _) => data.y1,
        name: 'USA',
        width: 2,
        dashArray: [10, 5]),
    StepLineSeries<_StepLineData, num>(
        dataSource: chartData,
        xValueMapper: (_StepLineData data, _) => data.x,
        yValueMapper: (_StepLineData data, _) => data.y2,
        name: 'UK',
        width: 2,
        dashArray: [10, 5]),
    StepLineSeries<_StepLineData, num>(
        dataSource: chartData,
        xValueMapper: (_StepLineData data, _) => data.x,
        yValueMapper: (_StepLineData data, _) => data.y3,
        name: 'Korea',
        width: 2,
        dashArray: [10, 5]),
    StepLineSeries<_StepLineData, num>(
        dataSource: chartData,
        xValueMapper: (_StepLineData data, _) => data.x,
        yValueMapper: (_StepLineData data, _) => data.y4,
        name: 'Japan',
        width: 2,
        dashArray: [10, 5])
  ];
}

class _StepLineData {
  _StepLineData(this.x, this.y1, this.y2, this.y3, this.y4);
  final double x;
  final double y1;
  final double y2;
  final double y3;
  final double y4;
}
