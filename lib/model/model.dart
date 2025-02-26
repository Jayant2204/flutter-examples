import 'package:flutter/material.dart';
import 'package:flutter_examples/samples/chart/axis_features/handling_label_collision/handling_label_collision.dart';
import 'package:flutter_examples/samples/chart/axis_features/multiple_axis_chart/multiple_axis_chart.dart';
import 'package:flutter_examples/samples/chart/axis_features/edge_label_placement/edgelabel_placement.dart';
import 'package:flutter_examples/samples/chart/axis_features/opposed_axes/opposed_axes.dart';
import 'package:flutter_examples/samples/chart/axis_types/category_types/default_category_axis.dart';
import 'package:flutter_examples/samples/chart/axis_types/category_types/indexed_category_axis.dart';
import 'package:flutter_examples/samples/chart/axis_types/category_types/label_placement.dart';
import 'package:flutter_examples/samples/chart/axis_types/date_time_types/date_time_axis_with_label_format.dart';
import 'package:flutter_examples/samples/chart/axis_types/date_time_types/default_date_time_axis.dart';
import 'package:flutter_examples/samples/chart/axis_types/numeric_types/default_numeric_axis.dart';
import 'package:flutter_examples/samples/chart/axis_types/numeric_types/inversed_numeric_axis.dart';
import 'package:flutter_examples/samples/chart/axis_types/numeric_types/numeric_axis_with_label_format.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/area_series/area_with_emptypoints.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/area_series/area_with_gradient.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/area_series/default_area_chart.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/area_series/vertical_area_chart.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/bar_series/bar_width_and_spacing.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/bar_series/bar_with_rounded_corners.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/bar_series/bar_with_track.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/bar_series/customized_bar_chart.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/bar_series/default_bar_chart.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/bubble_series/bubble_filled_with_gradient.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/bubble_series/bubble_with_multiple_series.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/bubble_series/bubble_with_various_colors.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/bubble_series/default_bubble_chart.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/column_series/back_to_back_column.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/column_series/column_width_and_spacing.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/column_series/column_with_rounded_corners.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/column_series/column_with_track.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/column_series/customized_column_chart.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/column_series/default_column_chart.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/line_series/customized_line_chart.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/line_series/default_line_chart.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/line_series/line_with_dashes.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/line_series/multi_colored_line.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/scatter_series/default_scatter_chart.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/scatter_series/scatter_with_various_shapes.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/spline_series/customized_spline_chart.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/spline_series/default_spline_chart.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/spline_series/spline_types.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/spline_series/spline_with_dashes.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/spline_series/vertical_spline_chart.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/stepLine_series/default_stepline_chart.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/stepLine_series/stepline_with_dashes.dart';
import 'package:flutter_examples/samples/chart/cartesian_charts/stepLine_series/vertical_stepline_chart.dart';
import 'package:flutter_examples/samples/chart/circular_charts/doughnut_series/default_doughnut_chart.dart';
import 'package:flutter_examples/samples/chart/circular_charts/doughnut_series/doughnut_with_center_elevation.dart';
import 'package:flutter_examples/samples/chart/circular_charts/doughnut_series/doughnut_with_color_mapping.dart';
import 'package:flutter_examples/samples/chart/circular_charts/doughnut_series/doughnut_with_rounded_corners.dart';
import 'package:flutter_examples/samples/chart/circular_charts/doughnut_series/semi_doughnut_chart.dart';
import 'package:flutter_examples/samples/chart/circular_charts/pie_series/default_pie_chart.dart';
import 'package:flutter_examples/samples/chart/circular_charts/pie_series/pie_with_grouping.dart';
import 'package:flutter_examples/samples/chart/circular_charts/pie_series/pie_with_smart_labels.dart';
import 'package:flutter_examples/samples/chart/circular_charts/pie_series/pie_with_various_radius.dart';
import 'package:flutter_examples/samples/chart/circular_charts/pie_series/semi_pie_chart.dart';
import 'package:flutter_examples/samples/chart/circular_charts/radialbar_series/customized_radialbar_chart.dart';
import 'package:flutter_examples/samples/chart/circular_charts/radialbar_series/default_radialbar_chart.dart';
import 'package:flutter_examples/samples/chart/circular_charts/radialbar_series/radialbar_with_legend.dart';
import 'package:flutter_examples/samples/chart/dynamic_updates/add_remove_data/add_remove_points.dart';
import 'package:flutter_examples/samples/chart/dynamic_updates/add_remove_data/add_remove_series.dart';
import 'package:flutter_examples/samples/chart/dynamic_updates/live_update/live_update.dart';
import 'package:flutter_examples/samples/chart/dynamic_updates/live_update/vertical_live_chart.dart';
import 'package:flutter_examples/samples/chart/dynamic_updates/update_data_source/update_data_source.dart';
import 'package:flutter_examples/samples/chart/legend/chart_with_customized_legend.dart';
import 'package:flutter_examples/samples/chart/legend/chart_with_legend.dart';
import 'package:flutter_examples/samples/chart/legend/legend_with_various_options.dart';
import 'package:flutter_examples/samples/chart/series_features/animation/series_animation.dart';
import 'package:flutter_examples/samples/chart/series_features/annotation/chart_with_annotation.dart';
import 'package:flutter_examples/samples/chart/series_features/annotation/chart_with_watermark.dart';
import 'package:flutter_examples/samples/chart/series_features/data_label/default_datalabels.dart';
import 'package:flutter_examples/samples/chart/series_features/empty_point/chart_with_empty_points.dart';
import 'package:flutter_examples/samples/chart/series_features/marker/various_marker_shapes.dart';
import 'package:flutter_examples/samples/chart/series_features/sorting/sorting_options.dart';
import 'package:flutter_examples/samples/chart/user_interactions/crosshair/chart_with_crosshair.dart';
import 'package:flutter_examples/samples/chart/user_interactions/selection/selection_modes.dart';
import 'package:flutter_examples/samples/chart/user_interactions/tooltip/default_tooltip.dart';
import 'package:flutter_examples/samples/chart/user_interactions/trackball/chart_with_trackball.dart';
import 'package:flutter_examples/samples/chart/user_interactions/zooming_panning/pinch_zooming.dart';
import 'package:flutter_examples/samples/chart/user_interactions/zooming_panning/selection_zooming.dart';
import 'package:flutter_examples/samples/chart/user_interactions/zooming_panning/zooming_with_custom_buttons.dart';

import 'package:scoped_model/scoped_model.dart';

class SampleList {
  SampleList(this.title, this.description, this.image, [this.subItemList]);
  final String title;
  final String description;
  final String image;
  final List<List<SubItemList>> subItemList;
}

class SubItemList {
  SubItemList(this.category, this.title, this.description, this.image,
      [this.previewWidget, this.codeViewerLink]);
  final String category;
  final String title;
  final String description;
  final String image;
  final String codeViewerLink;
  final Widget previewWidget;
}

class SampleListModel extends Model {
  bool isTargetMobile;
  List<SampleList> controlList;
  List<SampleList> searchControlListItems; // To handle search
  List<SubItemList> sampleList;
  List<SubItemList> searchSampleListItems; // To handle search

  int selectedIndex = 0;
  Color backgroundColor = Color.fromRGBO(0, 116, 228, 1);
  Color slidingPanelColor = Color.fromRGBO(250, 250, 250, 1);
  Color paletteColor;
  ThemeData themeData = ThemeData.light();
  Color searchBoxColor = Colors.white;
  Color listIconColor = Color.fromRGBO(0, 116, 228, 1);
  Color listDescriptionTextColor = Colors.grey;
  Color textColor = Color.fromRGBO(51, 51, 51, 1);
  String codeViewerIcon = 'images/code.png';
  String informationIcon = 'images/info.png';
  Brightness theme = Brightness.light;
  Color drawerTextIconColor = Colors.black;
  Color drawerIconColor = Colors.black;
  Color drawerBackgroundColor = Colors.white;
  Color bottomSheetBackgroundColor = Colors.white;
  final isTileView = true;
  Color cardThemeColor = Colors.white;

  // For Axis Types
  List<SubItemList> numericAxisSubItemList;
  List<SubItemList> categoryAxisSubItemList;
  List<SubItemList> dateTimeAxisSubItemList;
  List<SubItemList> axisFeaturesSubItemList;
  List<SubItemList> multipleAxisSubItemList;
  List<SubItemList> labelIntersectActionSubItemList;
  List<SubItemList> edgeLabelPlacementSubItemList;
  List<List<SubItemList>> axisSubItemList;
  List<List<SubItemList>> axesFeaturesSubItemList;

  // Cartesian Types
  List<SubItemList> lineSeriesSubItemList;
  List<SubItemList> columnSeriesSubItemList;
  List<SubItemList> splineSeriesSubItemList;
  List<SubItemList> areaSeriesSubItemList;
  List<SubItemList> barSeriesSubItemList;
  List<SubItemList> bubbleSeriesSubItemList;
  List<SubItemList> scatterSeriesSubItemList;
  List<SubItemList> stepLineSeriesSubItemList;
  List<SubItemList> legendSubItemList;
  List<SubItemList> markerSubItemList;
  List<SubItemList> dataLabelSubItemList;
  List<SubItemList> annotationSubItemList;
  List<SubItemList> sortingSubItemList;
  List<SubItemList> animationSubItemList;
  List<SubItemList> emptyPointSubItemList;
  List<List<SubItemList>> cartesianSubItemList;
  List<List<SubItemList>> accumulationSubItemList;
  List<List<SubItemList>> otherFeaturesSubItemList;
  List<List<SubItemList>> legendFeaturesSubItemList;
  List<List<SubItemList>> userInteractionSubItemList;
  List<List<SubItemList>> dynamicUpdatesSubItemList;

  // dynamic updates
  List<SubItemList> liveUpdateSubItemList;
  List<SubItemList> liveVerticalSubItemList;
  List<SubItemList> randomUpdateDataSubItemList;

  // User Interactions Types
  List<SubItemList> tooltipSubItemList;
  List<SubItemList> zoomingPanningSubItemList;
  List<SubItemList> crossHairSubItemList;
  List<SubItemList> trackballSubItemList;
  List<SubItemList> selectionSubItemList;

  // Accumulation Types
  List<SubItemList> pieSeriesSubItemList;
  List<SubItemList> doughnutSeriesSubItemList;
  List<SubItemList> radialBarSeriesSubItemList;

  SampleListModel() {
    controlList = <SampleList>[];
    searchControlListItems = <SampleList>[];
    sampleList = <SubItemList>[];
    searchSampleListItems = <SubItemList>[];

    // For Axis Types
    numericAxisSubItemList = <SubItemList>[];
    categoryAxisSubItemList = <SubItemList>[];
    dateTimeAxisSubItemList = <SubItemList>[];
    axisFeaturesSubItemList = <SubItemList>[];
    multipleAxisSubItemList = <SubItemList>[];
    labelIntersectActionSubItemList = <SubItemList>[];
    edgeLabelPlacementSubItemList = <SubItemList>[];
    axisSubItemList = <List<SubItemList>>[];
    axesFeaturesSubItemList = <List<SubItemList>>[];

    numericAxisSubItemList.add(SubItemList('Numeric', 'Default numeric axis',
        '', 'images/axes.png', getDefaultNumericAxisChart(isTileView)));
    numericAxisSubItemList.add(SubItemList(
        'Numeric',
        'Numeric axis with label format',
        '',
        'images/axes.png',
        getLabelNumericAxisChart(isTileView)));
    numericAxisSubItemList.add(SubItemList('Numeric', 'Inversed numeric axis',
        '', 'images/axes.png', getInversedNumericAxisChart(isTileView)));
    categoryAxisSubItemList.add(SubItemList('Category', 'Default category axis',
        '', 'images/axes.png', getDefaultCategoryAxisChart(isTileView)));
    categoryAxisSubItemList.add(SubItemList(
        'Category',
        'Arranged by index',
        'By default, category data points will be arranged based on the x values. In this sample, you can arrange the data points based on the index value.',
        'images/axes.png',
        getIndexedCategoryAxisChart(isTileView)));
    categoryAxisSubItemList.add(SubItemList('Category', 'Label placement', '',
        'images/axes.png', getTicksCategoryAxisChart(isTileView)));
    axisFeaturesSubItemList.add(SubItemList('Axis Features', 'Opposed axes', '',
        'images/axes.png', getOpposedNumericAxisChart(isTileView)));
    axisFeaturesSubItemList.add(SubItemList(
        'Axis Features',
        'Handling labels collision',
        'This sample demonstrates the chart with axis labels collision. This can be changed by using  the options in the properties panel.',
        'images/axes.png',
        getLabelIntersectActionChart(isTileView)));
    axisFeaturesSubItemList.add(SubItemList(
        'Axis Features',
        'Edge label placement',
        '',
        'images/axes.png',
        getEdgeLabelPlacementChart(isTileView)));
    axisFeaturesSubItemList.add(SubItemList(
        'Axis Features',
        'Multiple axis chart',
        '',
        'images/axes.png',
        getMultipleAxisLineChart(isTileView)));
    dateTimeAxisSubItemList.add(SubItemList(
        'Date time',
        'Default Date time axis',
        '',
        'images/axes.png',
        getDefaultDateTimeAxisChart(isTileView)));
    dateTimeAxisSubItemList.add(SubItemList(
        'Date time',
        'Date time axis with label format',
        '',
        'images/axes.png',
        getLabelDateTimeAxisChart(isTileView)));
    axisSubItemList.add(numericAxisSubItemList);
    axisSubItemList.add(categoryAxisSubItemList);
    axisSubItemList.add(dateTimeAxisSubItemList);
    axesFeaturesSubItemList.add(axisFeaturesSubItemList);

    // For Accumulation Types
    pieSeriesSubItemList = <SubItemList>[];
    doughnutSeriesSubItemList = <SubItemList>[];
    radialBarSeriesSubItemList = <SubItemList>[];

    pieSeriesSubItemList.add(SubItemList(
      'Pie',
      'Default pie chart',
      '',
      'images/axes.png',
      getDefaultPieChart(isTileView),
    ));
    pieSeriesSubItemList.add(SubItemList(
      'Pie',
      'Pie with various radius',
      'This sample demonstrates the pie chart with different radius for all the slices. The radius of a slice is based on a numeric value.',
      'images/axes.png',
      getRadiusPieChart(isTileView),
    ));
    pieSeriesSubItemList.add(SubItemList(
      'Pie',
      'Semi-pie chart',
      '',
      'images/axes.png',
      getSemiPieChart(isTileView),
    ));
    pieSeriesSubItemList.add(SubItemList(
      'Pie',
      'Pie with grouping',
      'This sample demonstrates the grouping functionality in a pie chart. Data points’ values less than the specified value can be grouped together.',
      'images/axes.png',
      getGroupingPieChart(isTileView),
    ));
    pieSeriesSubItemList.add(SubItemList(
      'Pie',
      'Pie with smart labels',
      '',
      'images/axes.png',
      getSmartLabelPieChart(isTileView),
    ));
    doughnutSeriesSubItemList.add(SubItemList(
      'Doughnut',
      'Default doughnut chart',
      '',
      'images/axes.png',
      getDefaultDoughnutChart(isTileView),
    ));

    doughnutSeriesSubItemList.add(SubItemList(
      'Doughnut',
      'Doughnut with center elevation',
      'The doughnut chart is rendered with elevated circle at the center using annotations feature in this sample.',
      'images/axes.png',
      getElevationDoughnutChart(isTileView),
    ));
    doughnutSeriesSubItemList.add(SubItemList(
      'Doughnut',
      'Doughnut with rounded corners',
      '',
      'images/axes.png',
      getRoundedDoughnutChart(isTileView),
    ));
    doughnutSeriesSubItemList.add(SubItemList(
      'Doughnut',
      'Doughnut with color mapping',
      '',
      'images/axes.png',
      getDoughnutCustomizationChart(isTileView),
    ));
    doughnutSeriesSubItemList.add(SubItemList(
      'Doughnut',
      'Semi-doughnut chart',
      '',
      'images/axes.png',
      getSemiDoughnutChart(isTileView),
    ));

    radialBarSeriesSubItemList.add(SubItemList(
      'Radial Bar',
      'Default radial bar chart',
      '',
      'images/axes.png',
      getDefaultRadialBarChart(isTileView),
    ));
    radialBarSeriesSubItemList.add(SubItemList(
      'Radial Bar',
      'Radial bar with legend',
      '',
      'images/axes.png',
      getAngleRadialBarChart(isTileView),
    ));
    radialBarSeriesSubItemList.add(SubItemList(
      'Radial Bar',
      'Customized radial bar chart',
      'This sample renders the radial bar chart with annotation at the center and templated legend.',
      'images/axes.png',
      getCustomizedRadialBarChart(isTileView),
    ));

    // Cartesian Types
    lineSeriesSubItemList = <SubItemList>[];
    columnSeriesSubItemList = <SubItemList>[];
    splineSeriesSubItemList = <SubItemList>[];
    areaSeriesSubItemList = <SubItemList>[];
    barSeriesSubItemList = <SubItemList>[];
    bubbleSeriesSubItemList = <SubItemList>[];
    scatterSeriesSubItemList = <SubItemList>[];
    stepLineSeriesSubItemList = <SubItemList>[];
    legendSubItemList = <SubItemList>[];
    markerSubItemList = <SubItemList>[];
    dataLabelSubItemList = <SubItemList>[];
    annotationSubItemList = <SubItemList>[];
    sortingSubItemList = <SubItemList>[];
    animationSubItemList = <SubItemList>[];
    emptyPointSubItemList = <SubItemList>[];
    cartesianSubItemList = <List<SubItemList>>[];
    accumulationSubItemList = <List<SubItemList>>[];
    otherFeaturesSubItemList = <List<SubItemList>>[];
    legendFeaturesSubItemList = <List<SubItemList>>[];
    userInteractionSubItemList = <List<SubItemList>>[];
    dynamicUpdatesSubItemList = <List<SubItemList>>[];

    // dynamic updates
    liveUpdateSubItemList = <SubItemList>[];
    liveVerticalSubItemList = <SubItemList>[];
    randomUpdateDataSubItemList = <SubItemList>[];

    // User Interactions Types
    tooltipSubItemList = <SubItemList>[];
    zoomingPanningSubItemList = <SubItemList>[];
    crossHairSubItemList = <SubItemList>[];
    trackballSubItemList = <SubItemList>[];
    selectionSubItemList = <SubItemList>[];

    lineSeriesSubItemList.add(SubItemList(
      'Line',
      'Default line chart',
      'This sample demonstrates the default line chart. Marker, tooltip and legend are enabled in this sample. Tap the marker to view information about that data point in a tooltip.',
      'images/axes.png',
      getDefaultLineChart(isTileView),
    ));
    lineSeriesSubItemList.add(SubItemList(
      'Line',
      'Line with dashes',
      'Line chart is rendered with dashes in this sample.',
      'images/axes.png',
      getDashedLineChart(isTileView),
    ));
    lineSeriesSubItemList.add(SubItemList(
      'Line',
      'Multi-colored line',
      'This sample demonstrates the rendering of a line chart with multiple colors. Colors for each data point is mapped from the data source.',
      'images/circular.png',
      getMultiColorLineChart(isTileView),
    ));
    lineSeriesSubItemList.add(SubItemList(
      'Line',
      'Customized line chart',
      '',
      'images/circular.png',
      getCustomizedLineChart(isTileView),
    ));

    // dynamic updates
    liveUpdateSubItemList.add(SubItemList(
      'Live Update',
      'Live update',
      'This sample demonstrates the live chart. A new data point is added at the end and a point is removed at the start in certain time interval continuously.',
      'images/circular.png',
      getLiveUpdateChart(isTileView),
    ));
    liveUpdateSubItemList.add(SubItemList(
      'Live Update',
      'Vertical live chart',
      'This sample demonstrates the live chart. A new data point is added at the end  in certain time interval continuously.',
      'images/circular.png',
      getVerticalLineUpdateChart(isTileView),
    ));

    liveVerticalSubItemList.add(SubItemList(
      'Add/Remove Data',
      'Add/remove points',
      'Add or remove the data points from a chart using the buttons placed in the sample.',
      'images/circular.png',
      getAddRemovePointsChart(),
    ));
    liveVerticalSubItemList.add(SubItemList(
      'Add/Remove Data',
      'Add/remove series',
      'Add or remove series from the chart using the buttons placed in the sample.',
      'images/circular.png',
      getAddRemoveSeriesChart(isTileView),
    ));
    randomUpdateDataSubItemList.add(SubItemList(
      'Update Data Source',
      'Update data source',
      'The data source bound to this chart can be changed with random values dynamically, by tapping the button placed in this sample.',
      'images/circular.png',
      getUpdateDataSourceChart(isTileView),
    ));

    // Interaction Types
    tooltipSubItemList.add(SubItemList(
      'Tooltip',
      'Default tooltip',
      'Tooltip is enabled in this sample and to see a tooltip in action, tap the data points in the chart.',
      'images/circular.png',
      getDefaultTooltipChart(isTileView),
    ));
    zoomingPanningSubItemList.add(SubItemList(
      'Zooming and Panning',
      'Pinch zooming',
      'Pinch zooming and panning is enabled in this sample. Pinch the chart to zoom it and swipe the zoomed chart to pan it.',
      'images/circular.png',
      getDefaultPanningChart(isTileView),
    ));
    zoomingPanningSubItemList.add(SubItemList(
      'Zooming and Panning',
      'Selection zooming',
      'This sample depicts the working of selection zooming. Long press and drag on the chart to select the region for zooming.',
      'images/circular.png',
      getDefaultZoomingChart(isTileView),
    ));
    zoomingPanningSubItemList.add(SubItemList(
      'Zooming and Panning',
      'Zooming with custom buttons',
      'This sample demonstrates zooming and panning with custom buttons.',
      'images/circular.png',
      getButtonZoomingChart(isTileView),
    ));
    crossHairSubItemList.add(SubItemList(
      'Crosshair',
      'Chart with crosshair',
      'Crosshair is enabled in this sample. Tap the chart to display a crosshair and drag the chart to change the position of the crosshair continuously.',
      'images/circular.png',
      getDefaultCrossHairChart(isTileView),
    ));
    trackballSubItemList.add(SubItemList(
      'Trackball',
      'Chart with trackball',
      'Trackball is enabled in this sample. Tap the chart to display the trackball and drag the chart to change the position of the trackball continuously.',
      'images/circular.png',
      getDefaultTrackballChart(isTileView),
    ));
    selectionSubItemList.add(SubItemList(
      'Selection',
      'Selection modes',
      'This sample depicts the selection feature in a chart. Tap the data points to select or unselect it.',
      'images/circular.png',
      getDefaultSelectionChart(isTileView),
    ));

    legendSubItemList.add(SubItemList(
      'Legend',
      'Chart with legend',
      '',
      'images/circular.png',
      getLegendDefaultChart(isTileView),
    ));
    legendSubItemList.add(SubItemList(
      'Legend',
      'Chart with customized legend',
      '',
      'images/circular.png',
      getLegendCustomizedChart(isTileView),
    ));
    legendSubItemList.add(SubItemList(
      'Legend',
      'Legend with various options',
      '',
      'images/circular.png',
      getLegendOptionsChart(isTileView),
    ));
    markerSubItemList.add(SubItemList(
      'Marker',
      'Various marker shapes',
      '',
      'images/circular.png',
      getMarkerDefaultChart(isTileView),
    ));
    dataLabelSubItemList.add(SubItemList(
      'Data Label',
      'Default data labels',
      '',
      'images/circular.png',
      getDataLabelDefaultChart(isTileView),
    ));
    annotationSubItemList.add(SubItemList(
      'Annotation',
      'Chart with annotation',
      'This sample renders the cartesian chart with annotation. A pie chart is rendered as an annotation here.',
      'images/circular.png',
      getWatermarkAnnotationChart(isTileView),
    ));
    annotationSubItemList.add(SubItemList(
      'Annotation',
      'Chart with watermark',
      'In this sample, annotation is placed at the center of the chart with reduced opacity to form a watermark.',
      'images/circular.png',
      getDefaultAnnotationChart(isTileView),
    ));
    sortingSubItemList.add(SubItemList(
      'Sorting',
      'Sorting options',
      'This sample depicts the sorting feature in a chart. The data points can be sorted in the ascending or descending order based on the x or y value.',
      'images/circular.png',
      getDefaultSortingChart(isTileView),
    ));
    animationSubItemList.add(SubItemList(
      'Animation',
      'Series animation',
      '',
      'images/circular.png',
      getDefaultAnimationChart(isTileView),
    ));
    emptyPointSubItemList.add(SubItemList(
      'Empty Points',
      'Chart with empty points',
      '',
      'images/circular.png',
      getEmptyPointChart(isTileView),
    ));
    splineSeriesSubItemList.add(SubItemList(
      'Spline',
      'Default spline chart',
      '',
      'images/axisfeatures.png',
      getDefaultSplineChart(isTileView),
    ));
    splineSeriesSubItemList.add(SubItemList(
      'Spline',
      'Spline with dashes',
      '',
      'images/cartesian.png',
      getDashedSplineChart(isTileView),
    ));
    splineSeriesSubItemList.add(SubItemList(
      'Spline',
      'Spline types',
      'This sample demonstrates various types of splines. Type can be changed by modifying the options in the properties panel.',
      'images/axisfeatures.png',
      getTypesSplineChart(isTileView),
    ));
    splineSeriesSubItemList.add(SubItemList(
      'Spline',
      'Vertical spline chart',
      '',
      'images/cartesian.png',
      getVerticalSplineChart(isTileView),
    ));
    splineSeriesSubItemList.add(SubItemList(
      'Spline',
      'Customized spline chart',
      '',
      'images/cartesian.png',
      getCustomizedSplineChart(isTileView),
    ));

    stepLineSeriesSubItemList.add(SubItemList(
      'Step Line',
      'Default step line chart',
      '',
      'images/cartesian.png',
      getDefaultStepLineChart(isTileView),
    ));
    stepLineSeriesSubItemList.add(SubItemList(
      'Step Line',
      'Step line with dashes',
      'A step line chart is rendered with dashes in this sample.',
      'images/cartesian.png',
      getDashedStepLineChart(isTileView),
    ));
    stepLineSeriesSubItemList.add(SubItemList(
      'Step Line',
      'Vertical step line chart',
      'The axes in this sample are transposed to form a vertical step line chart. ',
      'images/cartesian.png',
      getVerticalStepLineChart(isTileView),
    ));

    areaSeriesSubItemList.add(SubItemList(
      'Area',
      'Default area chart',
      '',
      'images/cartesian.png',
      getDefaultAreaChart(isTileView),
    ));
    areaSeriesSubItemList.add(SubItemList(
      'Area',
      'Area with gradient',
      'This sample depicts the area chart filled with gradient colors.',
      'images/cartesian.png',
      getGradientAreaChart(isTileView),
    ));
    areaSeriesSubItemList.add(SubItemList(
      'Area',
      'Area with empty points',
      'This area chart sample renders with gap for null values (empty data points).',
      'images/cartesian.png',
      getEmptyPointAreaChart(isTileView),
    ));
    areaSeriesSubItemList.add(SubItemList(
      'Area',
      'Vertical area chart',
      '',
      'images/cartesian.png',
      getVerticalAreaChart(isTileView),
    ));

    barSeriesSubItemList.add(SubItemList(
      'Bar',
      'Default bar chart',
      '',
      'images/cartesian.png',
      getDefaultBarChart(isTileView),
    ));
    barSeriesSubItemList.add(SubItemList(
      'Bar',
      'Bar with rounded corners',
      '',
      'images/cartesian.png',
      getRoundedBarChart(isTileView),
    ));
    barSeriesSubItemList.add(SubItemList(
      'Bar',
      'Bar width and spacing',
      'You can change the width and spacing of the bars by using the options in the properties panel.',
      'images/cartesian.png',
      getSpacingBarChart(isTileView),
    ));
    barSeriesSubItemList.add(SubItemList(
      'Bar',
      'Bar with track',
      'This sample renders the bar chart with track. Track is a rectangular bar drawn from minimum to maximum values of an axis.',
      'images/cartesian.png',
      getTrackerBarChart(isTileView),
    ));
    barSeriesSubItemList.add(SubItemList(
      'Bar',
      'Customized bar chart',
      'This sample demonstrates the rendering of custom bars. Here, the bars are filled with images, to look like  pattern fill.',
      'images/cartesian.png',
      getCustomizedBarChart(isTileView),
    ));
    bubbleSeriesSubItemList.add(SubItemList(
      'Bubble',
      'Default bubble chart',
      '',
      'images/cartesian.png',
      getDefaultBubbleChart(isTileView),
    ));

    bubbleSeriesSubItemList.add(SubItemList(
      'Bubble',
      'Bubble with various colors',
      '',
      'images/cartesian.png',
      getPointColorBubbleChart(isTileView),
    ));
    bubbleSeriesSubItemList.add(SubItemList(
      'Bubble',
      'Bubble filled with gradient',
      'This sample depicts the bubble chart filled with gradient colors.',
      'images/cartesian.png',
      getGradientBubbleChart(isTileView),
    ));
    bubbleSeriesSubItemList.add(SubItemList(
      'Bubble',
      'Bubble with multiple series',
      '',
      'images/cartesian.png',
      getMultipleSeriesBubbleChart(isTileView),
    ));

    scatterSeriesSubItemList.add(SubItemList(
      'Scatter',
      'Default scatter chart',
      '',
      'images/cartesian.png',
      getDefaultScatterChart(isTileView),
    ));
    scatterSeriesSubItemList.add(SubItemList(
      'Scatter',
      'Scatter with various shapes',
      'This sample demonstrates the rendering of a scatter chart with various shapes.',
      'images/cartesian.png',
      getShapesScatterChart(isTileView),
    ));

    columnSeriesSubItemList.add(SubItemList(
      'Column',
      'Default column chart',
      '',
      'images/axes.png',
      getDefaultColumnChart(isTileView),
    ));
    columnSeriesSubItemList.add(SubItemList(
      'Column',
      'Column with rounded corners',
      '',
      'images/circular.png',
      getRoundedColumnChart(isTileView),
    ));
    columnSeriesSubItemList.add(SubItemList(
      'Column',
      'Back to back column',
      'By default, the columns of various series are placed side by side. In this sample, it is changed to render back to back.',
      'images/axes.png',
      getBackColumnChart(isTileView),
    ));
    columnSeriesSubItemList.add(SubItemList(
      'Column',
      'Column with track',
      'This sample renders the column chart with track. Track is a rectangular bar drawn from minimum to maximum values of an axis.',
      'images/circular.png',
      getTrackerColumnChart(isTileView),
    ));
    columnSeriesSubItemList.add(SubItemList(
      'Column',
      'Column width and spacing',
      'You can change the width and spacing of columns by using the options in the properties panel.',
      'images/circular.png',
      getSpacingColumnChart(isTileView),
    ));
    columnSeriesSubItemList.add(SubItemList(
      'Column',
      'Customized column chart',
      'This sample demonstrates the rendering of custom columns. Here, the top edges of the columns are changed to form a triangle.',
      'images/circular.png',
      getVerticalColumnChart(isTileView),
    ));

    cartesianSubItemList.add(lineSeriesSubItemList);
    cartesianSubItemList.add(columnSeriesSubItemList);
    cartesianSubItemList.add(splineSeriesSubItemList);
    cartesianSubItemList.add(areaSeriesSubItemList);
    cartesianSubItemList.add(barSeriesSubItemList);
    cartesianSubItemList.add(bubbleSeriesSubItemList);
    cartesianSubItemList.add(scatterSeriesSubItemList);
    cartesianSubItemList.add(stepLineSeriesSubItemList);

    accumulationSubItemList.add(pieSeriesSubItemList);
    accumulationSubItemList.add(doughnutSeriesSubItemList);
    accumulationSubItemList.add(radialBarSeriesSubItemList);

    legendFeaturesSubItemList.add(legendSubItemList);
    otherFeaturesSubItemList.add(markerSubItemList);
    otherFeaturesSubItemList.add(dataLabelSubItemList);
    otherFeaturesSubItemList.add(annotationSubItemList);
    otherFeaturesSubItemList.add(sortingSubItemList);
    otherFeaturesSubItemList.add(animationSubItemList);
    otherFeaturesSubItemList.add(emptyPointSubItemList);

    userInteractionSubItemList.add(tooltipSubItemList);
    userInteractionSubItemList.add(zoomingPanningSubItemList);
    userInteractionSubItemList.add(crossHairSubItemList);
    userInteractionSubItemList.add(trackballSubItemList);
    userInteractionSubItemList.add(selectionSubItemList);

    dynamicUpdatesSubItemList.add(liveUpdateSubItemList);
    dynamicUpdatesSubItemList.add(liveVerticalSubItemList);
    dynamicUpdatesSubItemList.add(randomUpdateDataSubItemList);

    controlList.add(SampleList(
        'Cartesian Charts',
        'Demos of various chart types supported in cartesian axes',
        'images/cartesian_types.png',
        cartesianSubItemList));
    controlList.add(SampleList(
        'Circular Charts',
        'Demos of various circular chart types including pie and doughnut',
        'images/circle_series.png',
        accumulationSubItemList));
    controlList.add(SampleList(
        'Axis Types',
        'Various types of an axis available to plot the desired data',
        'images/axis_types.png',
        axisSubItemList));
    controlList.add(SampleList(
        'Axis Features',
        'Set of features helpful for customizing the axis and its elements',
        'images/axis_feature.png',
        axesFeaturesSubItemList));
    controlList.add(SampleList(
        'Series Features',
        'Set of features helpful for customizing  series and data points',
        'images/other_features.png',
        otherFeaturesSubItemList));
    controlList.add(SampleList(
        'Legend',
        'Various legend features useful in displaying additional information about the series',
        'images/legend.png',
        legendFeaturesSubItemList));
    controlList.add(SampleList(
        'User Interactions',
        'Real-time demos of the interactive features in chart',
        'images/user_interaction.png',
        userInteractionSubItemList));
    controlList.add(SampleList(
        'Dynamic Updates',
        'This sample demonstrates the chart with dynamic updates at run time',
        'images/live_update.png',
        dynamicUpdatesSubItemList));

    // For search results

    searchControlListItems.addAll(controlList);
    for (int index = 0; index < controlList.length; index++) {
      for (int categoryIndex = 0;
          categoryIndex < controlList[index].subItemList.length;
          categoryIndex++) {
        for (int sampleIndex = 0;
            sampleIndex < controlList[index].subItemList[categoryIndex].length;
            sampleIndex++) {
          searchSampleListItems
              .add(controlList[index].subItemList[categoryIndex][sampleIndex]);
        }
      }
    }
  }

  void changeTheme(ThemeData _themeData) {
    themeData = _themeData;
    switch (_themeData.brightness) {
      case Brightness.light:
        {
          drawerTextIconColor = Colors.black;
          drawerIconColor = Colors.black;
          slidingPanelColor = Colors.white;
          drawerIconColor = Colors.black;
          drawerBackgroundColor = Colors.white;
          bottomSheetBackgroundColor = Colors.white;
          backgroundColor = paletteColor ?? Color.fromRGBO(0, 116, 228, 1);
          listIconColor = paletteColor ?? Color.fromRGBO(0, 116, 228, 1);
          searchBoxColor = Colors.white;
          listDescriptionTextColor = Colors.grey;
          textColor = Color.fromRGBO(51, 51, 51, 1);
          theme = Brightness.light;
          cardThemeColor = Colors.white;
          break;
        }
      case Brightness.dark:
        {
          drawerTextIconColor = Colors.white;
          drawerIconColor = Colors.white;
          slidingPanelColor = Color.fromRGBO(32, 33, 37, 1);
          drawerBackgroundColor = Color.fromRGBO(32, 33, 37, 1);
          bottomSheetBackgroundColor = Color.fromRGBO(64, 64, 64, 1);
          backgroundColor = paletteColor ?? Color.fromRGBO(0, 116, 228, 1);
          listIconColor = paletteColor ?? Colors.white;
          searchBoxColor = Colors.white;
          listDescriptionTextColor = Colors.white;
          textColor = Colors.white;
          theme = Brightness.dark;
          cardThemeColor = Colors.black.withOpacity(0.7);
          break;
        }
      default:
        {
          drawerTextIconColor = Colors.white;
          drawerBackgroundColor = Colors.white;
          bottomSheetBackgroundColor = Colors.white;
          drawerIconColor = Colors.white;
          slidingPanelColor = Colors.white;
          backgroundColor = Color.fromRGBO(0, 116, 228, 1);
          searchBoxColor = Colors.white;
          listIconColor = Color.fromRGBO(0, 116, 228, 1);
          listDescriptionTextColor = Colors.white;
          textColor = Color.fromRGBO(51, 51, 51, 1);
          theme = Brightness.light;
          cardThemeColor = Colors.white;
          break;
        }
    }
  }
}

class ChartNumeric {
  ChartNumeric(this.x, this.y, this.y2, [this.size, this.text, this.lineColor]);
  final double x;
  final double y;
  final double y2;
  final double size;
  final String text;
  final Color lineColor;
}

class OrdinalSales1 {
  OrdinalSales1(this.year, this.androidSales, this.iphoneSales);
  final DateTime year;
  final int androidSales;
  final int iphoneSales;
}

class BubbleColors {
  BubbleColors(this.year, this.growth,
      [this.bubbleSize, this.pointColorMapper]);
  final num year;
  final num growth;
  final num bubbleSize;
  final Color pointColorMapper;
}

class ChartDataCollection {
  ChartDataCollection(this.year, this.category, this.numeric, this.sales1,
      this.sales2, this.sales3, this.sales4);
  final DateTime year;
  final String category;
  final num numeric;
  final num sales1;
  final num sales2;
  final num sales3;
  final num sales4;
}

class DoughnutData {
  DoughnutData(this.xVal, this.yVal, [this.text, this.radius]);
  final String xVal;
  final int yVal;
  final String text;
  final String radius;
}

class ChartData {
  ChartData(this.xVal, this.yVal, [this.radius]);
  final String xVal;
  final int yVal;
  final String radius;
}
