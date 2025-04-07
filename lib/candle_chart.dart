import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'data_models/stock_price_data.dart';

class CandleChart extends StatelessWidget {
  const CandleChart({super.key, required this.stockPricesList});

  final List<StockPriceData> stockPricesList;
  @override
  Widget build(BuildContext context) {
    int i = 0;
    const Color positiveColor = Colors.green;
    const Color negativeColor = Colors.red;

    List<StockPriceData> stockPricesDataList = stockPricesList;
    var barChartGroups = List<BarChartGroupData>.empty(growable: true);
    int minY = stockPricesDataList[0].low;
    int maxY = stockPricesDataList[0].high;
    for (var stockPrice in stockPricesDataList) {
      barChartGroups.add(
        BarChartGroupData(
          x: i,
          groupVertically: true,
          barRods: [
            BarChartRodData(
                fromY: stockPrice.open.toDouble(),
                toY: stockPrice.close.toDouble(),
                width: 20,
                color:
                    stockPrice.open < stockPrice.close ? positiveColor : negativeColor,
                borderRadius: BorderRadius.zero),
            BarChartRodData(
              fromY: stockPrice.low.toDouble(),
              toY: stockPrice.high.toDouble(),
              width: 1,
              color:
                  stockPrice.open < stockPrice.close ? positiveColor : negativeColor,
            )
          ],
        ),
      );
      i++;
      minY = min(minY, stockPrice.low);
      maxY = max(maxY, stockPrice.high);
    }
    return BarChart(
      BarChartData(
        barGroups: barChartGroups,
        minY: minY.toDouble(),
        maxY: maxY.toDouble(),
        borderData: FlBorderData(
          border: Border.all(style: BorderStyle.solid),
        ),
        groupsSpace: 10,
        backgroundColor: Colors.white,
        titlesData: FlTitlesData(
          show: true,
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (value, meta) {
                int index = value.toInt();
                var stockChartData = stockPricesDataList[index];
                int day = stockChartData.day;
                var date = DateTime.parse(day.toString());
                final dateToShow = date.day.toString();
                return Text(
                  dateToShow,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.blue,
                  ),
                );
              },
            ),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (value, meta) {
                return Text(
                  meta.formattedValue,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.blue,
                  ),
                );
              },
            ),
          ),
        ),
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            getTooltipColor: (touchedSpot) => Colors.yellow,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              var stockChartData = stockPricesDataList[groupIndex];
              int day = stockChartData.day;
              var date = DateTime.parse(day.toString());
              String touchData =
                  'open: ${stockChartData.open}\n close: ${stockChartData.close}\n high: ${stockChartData.high}\n low: ${stockChartData.low}\n day:${date.year % 100} . ${date.month} . ${date.day}';
              return BarTooltipItem(
                touchData,
                TextStyle(
                  color: stockChartData.open < stockChartData.close
                      ? positiveColor
                      : negativeColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
