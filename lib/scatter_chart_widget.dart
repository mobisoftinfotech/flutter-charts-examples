import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ScatterChartWidget extends StatelessWidget {
  const ScatterChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScatterChart(
      ScatterChartData(
        minX: 0,
        minY: 0,
        maxX: 100,
        maxY: 100,
        gridData: FlGridData(show: true),
        borderData: FlBorderData(
          show: false,
          border: Border(
            top: BorderSide.none,
            right: BorderSide.none,
            left: BorderSide(),
            bottom: BorderSide(),
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
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
        scatterTouchData: ScatterTouchData(
          enabled: true,
          touchTooltipData: ScatterTouchTooltipData(
            getTooltipColor: (touchedSpot) => Colors.black,
          ),
        ),
        scatterSpots: getScatterSpots(),
      ),
    );
  }

  List<ScatterSpot> getScatterSpots() {
    return [
      ScatterSpot(
        55,
        17,
        dotPainter: FlDotCirclePainter(
          radius: 8,
          color: Colors.red,
          strokeWidth: 2,
          strokeColor: Colors.black,
        ),
      ),
      ScatterSpot(
        55,
        29,
        dotPainter: FlDotCirclePainter(
          radius: 10,
          color: Colors.orange,
          strokeWidth: 2,
          strokeColor: Colors.black,
        ),
      ),
      ScatterSpot(
        55,
        75,
        dotPainter: FlDotCirclePainter(
          radius: 12,
          color: Colors.green,
          strokeWidth: 2,
          strokeColor: Colors.black,
        ),
      ),
      ScatterSpot(
        43,
        65,
        dotPainter: FlDotCirclePainter(
          radius: 12,
          color: Colors.green,
          strokeWidth: 2,
          strokeColor: Colors.black,
        ),
      ),
      ScatterSpot(
        65,
        65,
        dotPainter: FlDotCirclePainter(
          radius: 12,
          color: Colors.green,
          strokeWidth: 2,
          strokeColor: Colors.black,
        ),
      ),
      ScatterSpot(
        55,
        55,
        dotPainter: FlDotCirclePainter(
          radius: 6,
          color: Colors.yellow,
          strokeWidth: 2,
          strokeColor: Colors.black,
        ),
      ),
      ScatterSpot(
        70,
        45,
        dotPainter: FlDotCirclePainter(
          radius: 6,
          color: Colors.yellow,
          strokeWidth: 2,
          strokeColor: Colors.black,
        ),
      ),
      ScatterSpot(
        40,
        45,
        dotPainter: FlDotCirclePainter(
          radius: 6,
          color: Colors.yellow,
          strokeWidth: 2,
          strokeColor: Colors.black,
        ),
      ),
      ScatterSpot(
        30,
        90,
        dotPainter: FlDotCirclePainter(
          radius: 15,
          color: Colors.blue,
          strokeWidth: 2,
          strokeColor: Colors.black,
        ),
      ),
      ScatterSpot(
        80,
        90,
        dotPainter: FlDotCirclePainter(
          radius: 15,
          color: Colors.blue,
          strokeWidth: 2,
          strokeColor: Colors.black,
        ),
      ),
    ];
  }
}
