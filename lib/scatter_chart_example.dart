import 'package:flutter/material.dart';
import 'package:charts_examples/scatter_chart_widget.dart';

class ScatterChartExample extends StatefulWidget {
  const ScatterChartExample({super.key});

  @override
  State<ScatterChartExample> createState() => ScatterChartExampleState();
}

class ScatterChartExampleState extends State<ScatterChartExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffeff4ff),
        title: Text('Scatter Chart Example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 40.0, right: 35.0, bottom: 40.0,),
          child: ScatterChartWidget(),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
