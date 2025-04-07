import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'data_models/department.dart';

class PieChartWidget extends StatefulWidget {
  final List<Department> departmentShares;
  const PieChartWidget({super.key, required this.departmentShares});

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  int touchedIndex = -1;
  List<PieChartSectionData> getSectionData() {
    return widget.departmentShares.map((department) {
      final indexValue = widget.departmentShares.indexOf(department);
      final textToShow = "${department.title}\n(${department.value.round()}%)";
      return PieChartSectionData(
        color: department.color,
        value: department.value,
        title: textToShow,
        titleStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        radius: (touchedIndex == indexValue) ? 200.0 : 180,
        titlePositionPercentageOffset: 0.5,
        borderSide: (touchedIndex == indexValue)
            ? BorderSide(
                style: BorderStyle.solid,
                width: 2.0,
                color: Colors.black,
              )
            : BorderSide(
                style: BorderStyle.solid,
                width: 2.0,
                color: Colors.white,
              ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: PieChart(
        swapAnimationDuration: const Duration(milliseconds: 300),
        swapAnimationCurve: Curves.easeInCirc,
        PieChartData(
          sections: getSectionData(),
          centerSpaceRadius: 10.0,
          sectionsSpace: 2,
          startDegreeOffset: 0,
          pieTouchData: PieTouchData(
            enabled: true,
            touchCallback: (FlTouchEvent event, touchResponse) {
              setState(
                () {
                  if (touchResponse == null ||
                      touchResponse.touchedSection == null) {
                    touchedIndex = -1;
                    return;
                  }
                  touchedIndex =
                      touchResponse.touchedSection!.touchedSectionIndex;
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
