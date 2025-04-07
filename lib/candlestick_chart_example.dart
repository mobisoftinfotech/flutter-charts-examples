import 'package:flutter/material.dart';
import 'candle_chart.dart';
import 'data_models/stock_price_data.dart';

class CandlestickChartExample extends StatefulWidget {
  const CandlestickChartExample({super.key});

  @override
  State<StatefulWidget> createState() => CandlestickChartExampleState();
}

class CandlestickChartExampleState extends State<CandlestickChartExample> {
  List<StockPriceData> sampleData = [
    StockPriceData(open: 100, high: 120, low: 95, close: 110, day: 20250112),
    StockPriceData(open: 110, high: 125, low: 100, close: 115, day: 20250113),
    StockPriceData(open: 115, high: 130, low: 105, close: 125, day: 20250114),
    StockPriceData(open: 125, high: 130, low: 96, close: 105, day: 20250115),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffeff4ff),
        title: Text('Candlesticks Chart Example'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: CandleChart(stockPricesList: sampleData),
          ),
        ),
      ),
    );
  }
}
