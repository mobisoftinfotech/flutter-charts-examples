import 'package:charts_examples/radar_chart_widget.dart';
import 'package:flutter/material.dart';

class RadarChartExample extends StatefulWidget {
  const RadarChartExample({super.key});

  @override
  State<RadarChartExample> createState() => RadarChartExampleState();
}

class RadarChartExampleState extends State<RadarChartExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffeff4ff),
        title: Text('Radar Chart Example'),
      ),
      body: Center(
        child: RadarChartWidget(),
      ),
    );
  }
}