import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_examples/model/model.dart';
import 'package:flutter_examples/widgets/flutter_backdrop.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DefaultZooming extends StatefulWidget {
  final SubItemList sample;
  const DefaultZooming(this.sample, {Key key}) : super(key: key);

  @override
  _DefaultZoomingState createState() => _DefaultZoomingState(sample);
}

class _DefaultZoomingState extends State<DefaultZooming> {
  final SubItemList sample;
  _DefaultZoomingState(this.sample);
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
  void didUpdateWidget(DefaultZooming oldWidget) {
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
                              'https://github.com/syncfusion/flutter-examples/blob/master/lib/samples/chart/user_interactions/zooming_panning/selection_zooming.dart');
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

ZoomPanBehavior zoomingBehavior;

class FrontPanel extends StatefulWidget {
  final SubItemList subItemList;
  FrontPanel(this.subItemList);

  @override
  _FrontPanelState createState() => _FrontPanelState(this.subItemList);
}

class _FrontPanelState extends State<FrontPanel> {
  final SubItemList sample;
  _FrontPanelState(this.sample);
  bool enableTooltip = false;
  bool enableMarker = false;
  bool enableDatalabel = false;

  @override
  Widget build(BuildContext context) {
    zoomingBehavior =
        ZoomPanBehavior(enablePanning: true, enableSelectionZooming: true);
    return ScopedModelDescendant<SampleListModel>(
        rebuildOnChange: true,
        builder: (context, _, model) {
          return Scaffold(
              body: Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 50),
                child: Container(child: getDefaultZoomingChart(false)),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () => setState(() {
                      zoomingBehavior.reset();
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

SfCartesianChart getDefaultZoomingChart(bool isTileView) {
  return SfCartesianChart(
    plotAreaBorderColor: Colors.transparent,
    legend: Legend(isVisible: isTileView ? false : true, opacity: 0.8),
    title: ChartTitle(text: isTileView ? '' : 'Heigth vs Weight'),
    zoomPanBehavior: zoomingBehavior,
    primaryXAxis: NumericAxis(
        minimum: 100,
        maximum: 220,
        title: AxisTitle(text: isTileView ? '' : 'Height in inches'),
        majorGridLines: MajorGridLines(width: 0),
        edgeLabelPlacement: EdgeLabelPlacement.shift),
    primaryYAxis: NumericAxis(
        minimum: 50,
        maximum: 80,
        title: AxisTitle(text: isTileView ? '' : 'Weight in Pounds')),
    series: getZoomScatterSeries(isTileView),
  );
}

List<ScatterSeries<_ChartDataModel, num>> getZoomScatterSeries(
    bool isTileView) {
  return <ScatterSeries<_ChartDataModel, num>>[
    ScatterSeries<_ChartDataModel, num>(
      dataSource: zoomData,
      opacity: 0.8,
      name: 'Male',
      xValueMapper: (_ChartDataModel data, _) => data.xVal,
      yValueMapper: (_ChartDataModel data, _) => data.yVal,
    ),
    ScatterSeries<_ChartDataModel, num>(
        dataSource: zoomData1,
        opacity: 0.8,
        name: 'Female',
        xValueMapper: (_ChartDataModel data, _) => data.xVal,
        yValueMapper: (_ChartDataModel data, _) => data.yVal,
        markerSettings: MarkerSettings(shape: DataMarkerType.diamond))
  ];
}

final List<_ChartDataModel> zoomData = <_ChartDataModel>[
  new _ChartDataModel(161, 65),
  new _ChartDataModel(150, 65),
  new _ChartDataModel(155, 65),
  new _ChartDataModel(160, 65),
  new _ChartDataModel(148, 66),
  new _ChartDataModel(145, 66),
  new _ChartDataModel(137, 66),
  new _ChartDataModel(138, 66),
  new _ChartDataModel(162, 66),
  new _ChartDataModel(166, 66),
  new _ChartDataModel(159, 66),
  new _ChartDataModel(151, 66),
  new _ChartDataModel(180, 66),
  new _ChartDataModel(181, 66),
  new _ChartDataModel(174, 66),
  new _ChartDataModel(159, 66),
  new _ChartDataModel(151, 67),
  new _ChartDataModel(148, 67),
  new _ChartDataModel(141, 67),
  new _ChartDataModel(145, 67),
  new _ChartDataModel(165, 67),
  new _ChartDataModel(168, 67),
  new _ChartDataModel(159, 67),
  new _ChartDataModel(183, 67),
  new _ChartDataModel(188, 67),
  new _ChartDataModel(187, 67),
  new _ChartDataModel(172, 67),
  new _ChartDataModel(193, 67),
  new _ChartDataModel(153, 68),
  new _ChartDataModel(153, 68),
  new _ChartDataModel(147, 68),
  new _ChartDataModel(163, 68),
  new _ChartDataModel(174, 68),
  new _ChartDataModel(173, 68),
  new _ChartDataModel(160, 68),
  new _ChartDataModel(191, 68),
  new _ChartDataModel(131, 62),
  new _ChartDataModel(140, 62),
  new _ChartDataModel(149, 62),
  new _ChartDataModel(115, 62),
  new _ChartDataModel(164, 63),
  new _ChartDataModel(162, 63),
  new _ChartDataModel(167, 63),
  new _ChartDataModel(146, 63),
  new _ChartDataModel(150, 64),
  new _ChartDataModel(141, 64),
  new _ChartDataModel(142, 64),
  new _ChartDataModel(129, 64),
  new _ChartDataModel(159, 64),
  new _ChartDataModel(158, 64),
  new _ChartDataModel(162, 64),
  new _ChartDataModel(136, 64),
  new _ChartDataModel(176, 64),
  new _ChartDataModel(170, 64),
  new _ChartDataModel(167, 64),
  new _ChartDataModel(144, 64),
  new _ChartDataModel(143, 65),
  new _ChartDataModel(137, 65),
  new _ChartDataModel(137, 65),
  new _ChartDataModel(140, 65),
  new _ChartDataModel(182, 65),
  new _ChartDataModel(168, 65),
  new _ChartDataModel(181, 65),
  new _ChartDataModel(165, 65),
  new _ChartDataModel(214, 74),
  new _ChartDataModel(211, 74),
  new _ChartDataModel(166, 74),
  new _ChartDataModel(185, 74),
  new _ChartDataModel(189, 68),
  new _ChartDataModel(182, 68),
  new _ChartDataModel(181, 68),
  new _ChartDataModel(196, 68),
  new _ChartDataModel(152, 69),
  new _ChartDataModel(173, 69),
  new _ChartDataModel(190, 69),
  new _ChartDataModel(161, 69),
  new _ChartDataModel(173, 69),
  new _ChartDataModel(185, 69),
  new _ChartDataModel(141, 69),
  new _ChartDataModel(149, 69),
  new _ChartDataModel(134, 62),
  new _ChartDataModel(183, 62),
  new _ChartDataModel(155, 62),
  new _ChartDataModel(164, 62),
  new _ChartDataModel(169, 62),
  new _ChartDataModel(122, 62),
  new _ChartDataModel(161, 62),
  new _ChartDataModel(166, 62),
  new _ChartDataModel(137, 63),
  new _ChartDataModel(140, 63),
  new _ChartDataModel(140, 63),
  new _ChartDataModel(126, 63),
  new _ChartDataModel(150, 63),
  new _ChartDataModel(153, 63),
  new _ChartDataModel(154, 63),
  new _ChartDataModel(139, 63),
  new _ChartDataModel(186, 69),
  new _ChartDataModel(188, 69),
  new _ChartDataModel(148, 69),
  new _ChartDataModel(174, 69),
  new _ChartDataModel(164, 70),
  new _ChartDataModel(182, 70),
  new _ChartDataModel(200, 70),
  new _ChartDataModel(151, 70),
  new _ChartDataModel(204, 74),
  new _ChartDataModel(177, 74),
  new _ChartDataModel(194, 74),
  new _ChartDataModel(212, 74),
  new _ChartDataModel(162, 70),
  new _ChartDataModel(200, 70),
  new _ChartDataModel(166, 70),
  new _ChartDataModel(177, 70),
  new _ChartDataModel(188, 70),
  new _ChartDataModel(156, 70),
  new _ChartDataModel(175, 70),
  new _ChartDataModel(191, 70),
  new _ChartDataModel(174, 71),
  new _ChartDataModel(187, 71),
  new _ChartDataModel(208, 71),
  new _ChartDataModel(166, 71),
  new _ChartDataModel(150, 71),
  new _ChartDataModel(194, 71),
  new _ChartDataModel(157, 71),
  new _ChartDataModel(183, 71),
  new _ChartDataModel(204, 71),
  new _ChartDataModel(162, 71),
  new _ChartDataModel(179, 71),
  new _ChartDataModel(196, 71),
  new _ChartDataModel(170, 72),
  new _ChartDataModel(184, 72),
  new _ChartDataModel(197, 72),
  new _ChartDataModel(162, 72),
  new _ChartDataModel(177, 72),
  new _ChartDataModel(203, 72),
  new _ChartDataModel(159, 72),
  new _ChartDataModel(178, 72),
  new _ChartDataModel(198, 72),
  new _ChartDataModel(167, 72),
  new _ChartDataModel(184, 72),
  new _ChartDataModel(201, 72),
  new _ChartDataModel(167, 73),
  new _ChartDataModel(178, 73),
  new _ChartDataModel(215, 73),
  new _ChartDataModel(207, 73),
  new _ChartDataModel(172, 73),
  new _ChartDataModel(204, 73),
  new _ChartDataModel(162, 73),
  new _ChartDataModel(182, 73),
  new _ChartDataModel(201, 73),
  new _ChartDataModel(172, 73),
  new _ChartDataModel(189, 73),
  new _ChartDataModel(206, 73),
  new _ChartDataModel(150, 74),
  new _ChartDataModel(187, 74),
  new _ChartDataModel(153, 74),
  new _ChartDataModel(171, 74),
];
final List<_ChartDataModel> zoomData1 = <_ChartDataModel>[
  new _ChartDataModel(115, 57),
  new _ChartDataModel(138, 57),
  new _ChartDataModel(166, 57),
  new _ChartDataModel(122, 57),
  new _ChartDataModel(126, 57),
  new _ChartDataModel(130, 57),
  new _ChartDataModel(125, 57),
  new _ChartDataModel(144, 57),
  new _ChartDataModel(150, 57),
  new _ChartDataModel(120, 57),
  new _ChartDataModel(125, 57),
  new _ChartDataModel(130, 57),
  new _ChartDataModel(103, 58),
  new _ChartDataModel(116, 58),
  new _ChartDataModel(130, 58),
  new _ChartDataModel(126, 58),
  new _ChartDataModel(136, 58),
  new _ChartDataModel(148, 58),
  new _ChartDataModel(119, 58),
  new _ChartDataModel(141, 58),
  new _ChartDataModel(159, 58),
  new _ChartDataModel(120, 58),
  new _ChartDataModel(135, 58),
  new _ChartDataModel(163, 58),
  new _ChartDataModel(119, 59),
  new _ChartDataModel(131, 59),
  new _ChartDataModel(148, 59),
  new _ChartDataModel(123, 59),
  new _ChartDataModel(137, 59),
  new _ChartDataModel(149, 59),
  new _ChartDataModel(121, 59),
  new _ChartDataModel(142, 59),
  new _ChartDataModel(160, 59),
  new _ChartDataModel(118, 59),
  new _ChartDataModel(130, 59),
  new _ChartDataModel(146, 59),
  new _ChartDataModel(119, 60),
  new _ChartDataModel(133, 60),
  new _ChartDataModel(150, 60),
  new _ChartDataModel(133, 60),
  new _ChartDataModel(149, 60),
  new _ChartDataModel(165, 60),
  new _ChartDataModel(130, 60),
  new _ChartDataModel(139, 60),
  new _ChartDataModel(154, 60),
  new _ChartDataModel(118, 60),
  new _ChartDataModel(152, 60),
  new _ChartDataModel(154, 60),
  new _ChartDataModel(130, 61),
  new _ChartDataModel(145, 61),
  new _ChartDataModel(166, 61),
  new _ChartDataModel(131, 61),
  new _ChartDataModel(143, 61),
  new _ChartDataModel(162, 61),
  new _ChartDataModel(131, 61),
  new _ChartDataModel(145, 61),
  new _ChartDataModel(162, 61),
  new _ChartDataModel(115, 61),
  new _ChartDataModel(149, 61),
  new _ChartDataModel(183, 61),
  new _ChartDataModel(121, 62),
  new _ChartDataModel(139, 62),
  new _ChartDataModel(159, 62),
  new _ChartDataModel(135, 62),
  new _ChartDataModel(152, 62),
  new _ChartDataModel(178, 62),
  new _ChartDataModel(130, 62),
  new _ChartDataModel(153, 62),
  new _ChartDataModel(172, 62),
  new _ChartDataModel(114, 62),
  new _ChartDataModel(135, 62),
  new _ChartDataModel(154, 62),
  new _ChartDataModel(126, 63),
  new _ChartDataModel(141, 63),
  new _ChartDataModel(160, 63),
  new _ChartDataModel(135, 63),
  new _ChartDataModel(149, 63),
  new _ChartDataModel(180, 63),
  new _ChartDataModel(132, 63),
  new _ChartDataModel(144, 63),
  new _ChartDataModel(163, 63),
  new _ChartDataModel(122, 63),
  new _ChartDataModel(146, 63),
  new _ChartDataModel(156, 63),
  new _ChartDataModel(133, 64),
  new _ChartDataModel(150, 64),
  new _ChartDataModel(176, 64),
  new _ChartDataModel(133, 64),
  new _ChartDataModel(149, 64),
  new _ChartDataModel(176, 64),
  new _ChartDataModel(136, 64),
  new _ChartDataModel(157, 64),
  new _ChartDataModel(174, 64),
  new _ChartDataModel(131, 64),
  new _ChartDataModel(155, 64),
  new _ChartDataModel(191, 64),
  new _ChartDataModel(136, 65),
  new _ChartDataModel(149, 65),
  new _ChartDataModel(177, 65),
  new _ChartDataModel(143, 65),
  new _ChartDataModel(149, 65),
  new _ChartDataModel(184, 65),
  new _ChartDataModel(128, 65),
  new _ChartDataModel(146, 65),
  new _ChartDataModel(157, 65),
  new _ChartDataModel(133, 65),
  new _ChartDataModel(153, 65),
  new _ChartDataModel(173, 65),
  new _ChartDataModel(141, 66),
  new _ChartDataModel(156, 66),
  new _ChartDataModel(175, 66),
  new _ChartDataModel(125, 66),
  new _ChartDataModel(138, 66),
  new _ChartDataModel(165, 66),
  new _ChartDataModel(122, 66),
  new _ChartDataModel(164, 66),
  new _ChartDataModel(182, 66),
  new _ChartDataModel(137, 66),
  new _ChartDataModel(157, 66),
  new _ChartDataModel(176, 66),
  new _ChartDataModel(149, 67),
  new _ChartDataModel(159, 67),
  new _ChartDataModel(179, 67),
  new _ChartDataModel(156, 67),
  new _ChartDataModel(179, 67),
  new _ChartDataModel(186, 67),
  new _ChartDataModel(147, 67),
  new _ChartDataModel(166, 67),
  new _ChartDataModel(185, 67),
  new _ChartDataModel(140, 67),
  new _ChartDataModel(160, 67),
  new _ChartDataModel(180, 67),
  new _ChartDataModel(145, 68),
  new _ChartDataModel(155, 68),
  new _ChartDataModel(170, 68),
  new _ChartDataModel(129, 68),
  new _ChartDataModel(164, 68),
  new _ChartDataModel(189, 68),
  new _ChartDataModel(150, 68),
  new _ChartDataModel(157, 68),
  new _ChartDataModel(183, 68),
  new _ChartDataModel(144, 68),
  new _ChartDataModel(170, 68),
  new _ChartDataModel(180, 68)
];

class _ChartDataModel {
  _ChartDataModel(this.xVal, this.yVal);
  final double xVal;
  final double yVal;
}
