import 'dart:math';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_examples/model/model.dart';
import 'package:flutter_examples/widgets/flutter_backdrop.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateDataSource extends StatefulWidget {
  final SubItemList sample;

  const UpdateDataSource(this.sample, {Key key}) : super(key: key);

  @override
  _LiveVerticalState createState() => _LiveVerticalState(sample);
}

List<_ChartData> chartData = chartData = <_ChartData>[
  _ChartData(1, 30),
  _ChartData(3, 13),
  _ChartData(5, 80),
  _ChartData(7, 30),
  _ChartData(9, 72)
];
int count = 11;

class _LiveVerticalState extends State<UpdateDataSource> {
  final SubItemList sample;
  _LiveVerticalState(this.sample);
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
  void didUpdateWidget(UpdateDataSource oldWidget) {
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
                        icon:
                            Image.asset('images/code.png', color: Colors.white),
                        onPressed: () {
                          launch(
                              'https://github.com/syncfusion/flutter-examples/blob/master/lib/samples/chart/dynamic_updates/update_data_source/update_data_source.dart');
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
                        icon: Icon(
                          Icons.info_outline,
                          color: Colors.white,
                        ),
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
  final Random random = Random();
  num getRandomInt(num min, num max) {
    return min + random.nextInt(max - min);
  }

  List<_ChartData> getChartData(SampleListModel model) {
    chartData.add(_ChartData(1, getRandomInt(10, 100)));
    chartData.add(_ChartData(3, getRandomInt(10, 100)));
    chartData.add(_ChartData(5, getRandomInt(10, 100)));
    chartData.add(_ChartData(7, getRandomInt(10, 100)));
    chartData.add(_ChartData(9, getRandomInt(10, 100)));
    return chartData;
  }

  List<_ChartData> getChartData1(SampleListModel model) {
    // ignore: invalid_use_of_protected_member
    if (chartData != null && chartData.isNotEmpty)
      chartData.removeAt(chartData.length - 1);
    count = count - 1;
    return chartData;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<SampleListModel>(
        rebuildOnChange: true,
        builder: (context, _, model) {
          return Scaffold(
              body: Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 60),
                child: Container(
                    child: getUpdateDataSourceChart(false, chartData)),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () => setState(() {
                      chartData = [];
                      chartData = getChartData(model);
                    }),
                child: Icon(Icons.refresh, color: Colors.white),
                backgroundColor: model.backgroundColor,
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

SfCartesianChart getUpdateDataSourceChart(bool isTileView,
    [List<_ChartData> chartData]) {
  return SfCartesianChart(
    plotAreaBorderColor: Colors.transparent,
    primaryXAxis: NumericAxis(
        minimum: 0, interval: 1, majorGridLines: MajorGridLines(width: 0)),
    primaryYAxis: NumericAxis(
        rangePadding: ChartRangePadding.additional,
        axisLine: AxisLine(width: 0),
        majorTickLines: MajorTickLines(size: 0),
        minorGridLines: MinorGridLines(width: 0)),
    series: getColumnSeries(),
  );
}

List<ColumnSeries<_ChartData, num>> getColumnSeries() {
  return <ColumnSeries<_ChartData, num>>[
    ColumnSeries<_ChartData, num>(
        dataSource: chartData,
        xValueMapper: (_ChartData sales, _) => sales.country,
        yValueMapper: (_ChartData sales, _) => sales.sales,
        dataLabelSettings: DataLabelSettings(isVisible: true)),
  ];
}

class _ChartData {
  _ChartData(this.country, this.sales);
  final num country;
  final int sales;
}
