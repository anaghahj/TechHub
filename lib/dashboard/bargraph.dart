import 'dart:convert';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:techub/db/insertion.dart';

int count = 0;

class bargraphe extends StatefulWidget {
  final uid;
  const bargraphe({super.key, this.uid});

  @override
  State<bargraphe> createState() => _bargrapheState();
}

class _bargrapheState extends State<bargraphe> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: fetchDatabar(widget.uid),
      builder: (context, snapshot) {
        print(snapshot.data);
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? ItemList(
                list: snapshot!.data,
              )
            : Center(
                child: new CircularProgressIndicator(),
              );
      },
    );
  }
}

List<Point> point = [];

class ItemList extends StatelessWidget {
  final List? list;
  ItemList({this.list});
  void add() {
    count++;
    if (count == 1) {
      point.add(
        //Point(0, double.parse(list![0]["Package_gt_15"])),
        Point(0, list![0]["Package_gt_15"]),
      );
      point.add(
        //Point(1, double.parse(list![0]["Package_bw_5_15"])),
        Point(1, list![0]["Package_bw_5_15"]),
      );
      point.add(
          //Point(2, double.parse(list![0]["Package_lt_5"]))
          Point(2, list![0]["Package_lt_5"]));
    }
  }

  @override
  Widget build(BuildContext context) {
    add();
    return AspectRatio(
      aspectRatio: 1.65,
      child: BarChart(BarChartData(
        barTouchData: BarTouchData(
            touchTooltipData:
                BarTouchTooltipData(tooltipBgColor: Colors.yellow)),
        barGroups: _chartgroups(),
        borderData: FlBorderData(
            border: Border(
          bottom: BorderSide(width: 3),
          left: BorderSide(width: 3),
        )),
        gridData: FlGridData(show: true),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
              sideTitles: _bottomTitles,
              axisNameWidget:
                  Text("LPA", style: TextStyle(fontWeight: FontWeight.w500))),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
      )),
    );
  }
}

List<BarChartGroupData> _chartgroups() {
  //add();
  return point
      .map((point) => BarChartGroupData(
              x: point.x.toInt(),
              barsSpace: BorderSide.strokeAlignInside,
              barRods: [
                BarChartRodData(
                  toY: point.y.toDouble(),
                  width: 30,
                  borderRadius: BorderRadius.circular(4),
                  gradient: LinearGradient(colors: [
                    Colors.black,
                    const Color.fromARGB(255, 43, 43, 43),
                    Color.fromARGB(255, 75, 75, 75),
                  ]),
                )
              ]))
      .toList();
}

SideTitles get _bottomTitles => SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      String text = "";
      switch (value.toInt()) {
        case 0:
          text = '>15';
          break;
        case 1:
          text = "15<x<12";
          break;
        case 2:
          text = "<12";
          break;
      }
      return Text(text);
    });
