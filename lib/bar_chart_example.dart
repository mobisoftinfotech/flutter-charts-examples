import 'dart:async';

import 'package:charts_examples/bar_chart_widget.dart';
import 'package:charts_examples/data_models/sales_per_month.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartExample extends StatefulWidget {
  const BarChartExample({super.key});

  @override
  State<StatefulWidget> createState() => BarChartExampleState();
}

class BarChartExampleState extends State<BarChartExample> {
  var changeState = false;
  late Timer _timer;
  int _start = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(milliseconds: 500);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            changeState = !changeState;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  List<BarChartGroupData> _chartGroupsMultiRods() {
    final points = [
      SalesPerMonth(month: 1, leads: 100, sales: 50),
      SalesPerMonth(month: 2, leads: 50, sales: 50),
      SalesPerMonth(month: 3, leads: 90, sales: 70),
      SalesPerMonth(month: 4, leads: 80, sales: 30),
      SalesPerMonth(month: 5, leads: 60, sales: 50)
    ];
    return points
        .map(
          (point) => BarChartGroupData(
              x: point.month.toInt(),
              barRods: [
                BarChartRodData(
                    toY: point.leads,
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                    width: 15),
                BarChartRodData(
                    toY: point.sales,
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                    width: 15),
              ],
              barsSpace: 0),
        )
        .toList();
  }

  List<BarChartGroupData> _chartGroupsInitialData() {
    final points = [
      SalesPerMonth(month: 1, leads: 10, sales: 0),
      SalesPerMonth(month: 2, leads: 10, sales: 0),
      SalesPerMonth(month: 3, leads: 10, sales: 0),
      SalesPerMonth(month: 4, leads: 10, sales: 0),
      SalesPerMonth(month: 5, leads: 10, sales: 0),
    ];
    return points
        .map(
          (point) => BarChartGroupData(
          x: point.month.toInt(),
          barRods: [
            BarChartRodData(
                toY: point.leads,
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5),
                width: 15),
            BarChartRodData(
                toY: point.sales,
                color: Colors.green,
                borderRadius: BorderRadius.circular(5),
                width: 15),
          ],
          barsSpace: 0),
    )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffeff4ff),
        title: Text('Bar Chart Example'),
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height / 2,
          child: BarChartWidget(
            spotsData:
                changeState ? _chartGroupsMultiRods() : _chartGroupsInitialData(),
          ),
        ),
      ),
    );
  }
}
