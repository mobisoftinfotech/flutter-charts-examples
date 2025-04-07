import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:charts_examples/data_models/demand_per_month.dart';

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({super.key});

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 2,
        child: LineChart(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          LineChartData(
            borderData: FlBorderData(
              border: Border(
                bottom: BorderSide(),
                left: BorderSide(),
              ),
            ),
            minX: 1,
            minY: 0,
            maxY: 100,
            gridData: FlGridData(
              show: true,
              drawHorizontalLine: true,
              drawVerticalLine: false,
            ),
            titlesData: FlTitlesData(
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: bottomTitles,
                )),
            lineBarsData: [
              LineChartBarData(
                  spots: changeState ? getTheSpots(1) : getTheSpots(0),
                  isCurved: true,
                  barWidth: 3,
                  color: Colors.blue),
              LineChartBarData(
                  spots: changeState ? getTheSpots(2) : getTheSpots(0),
                  isCurved: true,
                  barWidth: 3,
                  color: Colors.green),
            ],
            lineTouchData: LineTouchData(
              enabled: true,
              touchTooltipData: LineTouchTooltipData(
                getTooltipItems: (touchedSpot) {
                  return touchedSpot
                      .map(
                        (spot) => LineTooltipItem(
                          spot.y.toString(),
                          TextStyle(color: Colors.white),
                        ),
                      )
                      .toList();
                },
                getTooltipColor: (touchedSpot) => Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        interval: 1,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 1:
              text = 'Jan';
              break;
            case 2:
              text = 'Feb';
              break;
            case 3:
              text = 'Mar';
              break;
            case 4:
              text = 'Apr';
              break;
            case 5:
              text = 'May';
              break;
            case 6:
              text = 'Jun';
              break;
            case 7:
              text = 'Jul';
              break;
            case 8:
              text = 'Aug';
              break;
            case 9:
              text = 'Sep';
              break;
            case 10:
              text = 'Oct';
              break;
            case 11:
              text = 'Nov';
              break;
            case 12:
              text = 'Dec';
              break;
          }
          return Text(text);
        },
      );
}
