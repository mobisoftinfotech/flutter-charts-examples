// import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// import 'data_models/sales_per_month.dart';

class BarChartWidget extends StatefulWidget {
  final List<BarChartGroupData> spotsData;
  const BarChartWidget({super.key, required this.spotsData});

  @override
  State<BarChartWidget> createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<BarChartWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(5),
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 1,
        child: BarChart(
          swapAnimationDuration: Duration(milliseconds: 300),
          swapAnimationCurve: Curves.easeInOut,
          BarChartData(
            borderData: FlBorderData(
              show: true,
              border: Border(
                top: BorderSide.none,
                right: BorderSide.none,
                left: BorderSide(),
                bottom: BorderSide(),
              )
            ),
            barTouchData: BarTouchData(
              enabled: true,
              touchTooltipData: BarTouchTooltipData(
                getTooltipItem: (group, groupIndex, rod, rodIndex) {
                  String weekDay = rod.toY.toString();
                  return BarTooltipItem(
                    weekDay,
                    TextStyle(color: Colors.white),
                  );
                },
                getTooltipColor: (touchedSpot) => Colors.black,
              ),
            ),
            gridData: FlGridData(
              show: true,
              drawHorizontalLine: true,
              drawVerticalLine: false,
            ),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: bottomTitles,
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
            ),
            barGroups: widget.spotsData,
            backgroundColor: Colors.white,
            alignment: BarChartAlignment.spaceEvenly,
          ),
        ),
      ),
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
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
