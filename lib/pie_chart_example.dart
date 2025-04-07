import 'package:charts_examples/pie_chart_widget.dart';
import 'package:flutter/material.dart';
import 'data_models/department.dart';

class PieChartExample extends StatefulWidget {
  const PieChartExample({super.key});

  @override
  State<StatefulWidget> createState() => PieChartExampleState();
}

class PieChartExampleState extends State<PieChartExample> {

  List<Department> get departmentsShare {
    return [
      Department(value: 40.0, color: Colors.yellow.shade700, title: 'Sales'),
      Department(value: 45.0, color: Colors.blue, title: 'IT'),
      Department(value: 30.0, color: Colors.pink, title: 'HR'),
      Department(value: 30.0, color: Colors.green, title: 'Management'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffeff4ff),
        title: Text('Pie Chart Example'),
      ),
      body: Center(
        child: PieChartWidget(departmentShares: departmentsShare),
      ),
    );
  }
}
