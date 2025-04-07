import 'package:charts_examples/bar_chart_example.dart';
import 'package:charts_examples/candlestick_chart_example.dart';
import 'package:charts_examples/line_chart_example.dart';
import 'package:charts_examples/pie_chart_example.dart';
import 'package:charts_examples/radar_chart_example.dart';
import 'package:charts_examples/scatter_chart_example.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'data_models/department.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Charts Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffeff4ff)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Charts Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  List<FlSpot> spotsData = [];

  List<Department> get departmentsShare {
    return [
      Department(value: 20.0, color: Colors.yellow, title: 'Sales'),
      Department(value: 50.0, color: Colors.blue, title: 'IT'),
      Department(value: 10.0, color: Colors.pink, title: 'HR'),
      Department(value: 20.0, color: Colors.green, title: 'Management'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffeff4ff),
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LineChartExample()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      minimumSize: Size(200, 50)),
                  child: Text('Line Chart'),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BarChartExample()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      minimumSize: Size(200, 50)),
                  child: Text('Bar Chart'),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PieChartExample()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      minimumSize: Size(200, 50)),
                  child: Text('Pie Chart'),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ScatterChartExample()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      minimumSize: Size(200, 50)),
                  child: Text('Scatter Chart'),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RadarChartExample()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      minimumSize: Size(200, 50)),
                  child: Text('Radar Chart'),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CandlestickChartExample()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      minimumSize: Size(200, 50)),
                  child: Text('CandleStick Chart'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
