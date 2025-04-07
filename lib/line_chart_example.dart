import 'package:charts_examples/line_chart_widget.dart';
import 'package:flutter/material.dart';

class LineChartExample extends StatefulWidget {
  const LineChartExample({super.key});

  @override
  State<LineChartExample> createState() => LineChartExampleState();
}

class LineChartExampleState extends State<LineChartExample> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffeff4ff),
        title: Text('Line Chart Example'),
      ),
      body: SafeArea(
        child: Center(
            child: SizedBox(
          height: MediaQuery.sizeOf(context).height / 2,
          width: MediaQuery.sizeOf(context).width - 20,
          child: LineChartWidget(),
        )),
      ),
    );
  }
}
