import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:techub/db/insertion.dart';

class PieGraph extends StatefulWidget {
  final uid;

  const PieGraph({Key? key, this.uid}) : super(key: key);

  @override
  State<PieGraph> createState() => _PieGraphState();
}

class _PieGraphState extends State<PieGraph> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: fetchDatapie(widget.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? ItemList(data: snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}

class ItemList extends StatelessWidget {
  final List? data;
  ItemList({this.data});

  @override
  Widget build(BuildContext context) {
    if (data == null || data!.isEmpty) {
      return Center(child: Text('No data available'));
    }

    List<ChartData> chartData = data!
        .map((item) => ChartData(
            item['Name'], double.parse(item['No_of_Students'].toString())))
        .toList();

    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height,
      child: SfCircularChart(
        legend: Legend(
            position: LegendPosition.left,
            isVisible: true,
            alignment: ChartAlignment.center,
            orientation: LegendItemOrientation.vertical),
        series: <CircularSeries>[
          RadialBarSeries<ChartData, String>(
            dataLabelMapper: (datum, index) => datum.y.toString(),
            name: "Domains",
            strokeColor: Colors.black26,
            legendIconType: LegendIconType.rectangle,
            enableTooltip: true,
            radius: '90%',
            innerRadius: '25%',
            maximumValue: 1450,
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
            ),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}
