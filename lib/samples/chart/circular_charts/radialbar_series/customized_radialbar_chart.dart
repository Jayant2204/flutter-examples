import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_examples/model/model.dart';
import 'package:flutter_examples/widgets/flutter_backdrop.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:url_launcher/url_launcher.dart';

class RadialBarCustomized extends StatefulWidget {
  final SubItemList sample;
  const RadialBarCustomized(this.sample, {Key key}) : super(key: key);

  @override
  _RadialBarCustomizedState createState() => _RadialBarCustomizedState(sample);
}

class _RadialBarCustomizedState extends State<RadialBarCustomized> {
  final SubItemList sample;
  _RadialBarCustomizedState(this.sample);
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
  void didUpdateWidget(RadialBarCustomized oldWidget) {
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
                              'https://github.com/syncfusion/flutter-examples/blob/master/lib/samples/chart/circular_charts/radialbar_series/customized_radialbar_chart.dart');
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
            child: Container(child: getCustomizedRadialBarChart(false)),
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

SfCircularChart getCustomizedRadialBarChart(bool isTileView) {
  List<_RadialData> dataSources = [
    _RadialData('Vehicle', 62.70, '10%', Color.fromRGBO(69, 186, 161, 1.0)),
    _RadialData('Education', 29.20, '10%', Color.fromRGBO(230, 135, 111, 1.0)),
    _RadialData('Home', 85.20, '100%', Color.fromRGBO(145, 132, 202, 1.0)),
    _RadialData('Personal', 45.70, '100%', Color.fromRGBO(235, 96, 143, 1.0))
  ];

  List<CircularChartAnnotation> annotationSources = [
    CircularChartAnnotation(
      angle: 0,
      radius: '0%',
      child: Container(
        child: new Image.asset(
          'images/car_legend.png',
          width: 20,
          height: 20,
          color: Color.fromRGBO(69, 186, 161, 1.0),
        ),
      ),
    ),
    CircularChartAnnotation(
      angle: 0,
      radius: '0%',
      child: Container(
        child: new Image.asset(
          'images/book.png',
          width: 20,
          height: 20,
          color: Color.fromRGBO(230, 135, 111, 1.0),
        ),
      ),
    ),
    CircularChartAnnotation(
      angle: 0,
      radius: '0%',
      child: Container(
        child: new Image.asset('images/home.png',
            width: 20, height: 20, color: Color.fromRGBO(145, 132, 202, 1.0)),
      ),
    ),
    CircularChartAnnotation(
      angle: 0,
      radius: '0%',
      child: Container(
        child: new Image.asset(
          'images/personal_loan.png',
          width: 20,
          height: 20,
          color: Color.fromRGBO(235, 96, 143, 1.0),
        ),
      ),
    ),
  ];

  dynamic colors = [
    Color.fromRGBO(69, 186, 161, 1.0),
    Color.fromRGBO(230, 135, 111, 1.0),
    Color.fromRGBO(145, 132, 202, 1.0),
    Color.fromRGBO(235, 96, 143, 1.0)
  ];

  return SfCircularChart(
    title: ChartTitle(text: isTileView ? '' : 'Percentage of loan closure'),
    legend: Legend(
      isVisible: true,
      overflowMode: LegendItemOverflowMode.wrap,
      legendItemBuilder:
          (String name, dynamic series, dynamic point, int index) {
        return Container(
            height: 60,
            width: 150,
            child: Row(children: <Widget>[
              Container(
                  height: 75,
                  width: 65,
                  child: SfCircularChart(
                    annotations: <CircularChartAnnotation>[
                      annotationSources[index],
                    ],
                    series: [
                      RadialBarSeries<_RadialData, String>(
                        animationDuration: 0,
                        dataSource: [dataSources[index]],
                        maximumValue: 100,
                        radius: '100%',
                        cornerStyle: CornerStyle.bothCurve,
                        xValueMapper: (_RadialData data, _) => point.x,
                        yValueMapper: (_RadialData data, _) => data.yVal,
                        pointColorMapper: (_RadialData data, _) => data.color,
                        innerRadius: '70%',
                        pointRadiusMapper: (_RadialData data, _) =>
                            data.radius,
                      ),
                    ],
                  )),
              Container(
                  width: 70,
                  child: Text(
                    point.x,
                    style: TextStyle(
                        color: colors[index], fontWeight: FontWeight.bold),
                  )),
            ]));
      },
    ),
    series: getRadialBarCustomizedSeries(),
    tooltipBehavior:
        TooltipBehavior(enable: true, format: 'point.x : point.y%'),
    annotations: <CircularChartAnnotation>[
      CircularChartAnnotation(
        angle: 0,
        radius: '0%',
        height: '90%',
        width:'90%',
        child: Container(
          child: new Image.asset(
            'images/person.png',
            height: 100.0,
            width: 100.0,
          ),
        ),
      ),
    ],
  );
}

List<RadialBarSeries<_RadialData, String>> getRadialBarCustomizedSeries() {
  final List<_RadialData> chartData = <_RadialData>[
    _RadialData('Vehicle', 62.70, '100%', Color.fromRGBO(69, 186, 161, 1.0)),
    _RadialData('Education', 29.20, '100%', Color.fromRGBO(230, 135, 111, 1.0)),
    _RadialData('Home', 85.20, '100%', Color.fromRGBO(145, 132, 202, 1.0)),
    _RadialData('Personal', 45.70, '100%', Color.fromRGBO(235, 96, 143, 1.0))
  ];
  return <RadialBarSeries<_RadialData, String>>[
    RadialBarSeries<_RadialData, String>(
      animationDuration: 0,
      maximumValue: 100,
      gap: '10%',
      radius: '100%',
      dataSource: chartData,
      cornerStyle: CornerStyle.bothCurve,
      innerRadius: '50%',
      xValueMapper: (_RadialData data, _) => data.xVal,
      yValueMapper: (_RadialData data, _) => data.yVal,
      pointRadiusMapper: (_RadialData data, _) => data.radius,
      pointColorMapper: (_RadialData data, _) => data.color,
      legendIconType: LegendIconType.circle,
    ),
  ];
}

class _RadialData {
  _RadialData(this.xVal, this.yVal, [this.radius, this.color]);
  final String xVal;
  final double yVal;
  final String radius;
  final Color color;
}
