import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'data_models/celebrity_data.dart';

class RadarChartWidget extends StatefulWidget {
  const RadarChartWidget({super.key});

  @override
  State<RadarChartWidget> createState() => _RadarChartWidgetState();
}

class _RadarChartWidgetState extends State<RadarChartWidget> {
  int selectedDataSetIndex = -1;

  // List of titles
  List<String> titles = myDataSetList.map((data) => data.title).toList();

  List<RadarDataSet> getDataSets() {
    return myDataSetList.asMap().entries.map((entry) {
      final index = entry.key;
      final data = entry.value;
      final isSelected = (index == selectedDataSetIndex) ? true : false;

      final List<RadarEntry> dataEntries = data.values.map(
        (value) {
          return RadarEntry(value: value);
        },
      ).toList();

      return RadarDataSet(
        borderColor: isSelected ? Colors.green : Colors.white30,
        borderWidth: isSelected ? 5.0 : 2.0,
        dataEntries: dataEntries,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: RadarChart(
        RadarChartData(
          radarShape: RadarShape.circle,
          dataSets: getDataSets(),
          radarBorderData: BorderSide(color: Colors.transparent),
          tickCount: 4,
          ticksTextStyle: const TextStyle(color: Colors.blueGrey),
          tickBorderData: BorderSide(color: Colors.red),
          gridBorderData: const BorderSide(color: Colors.green),
          getTitle: (index, _) => RadarChartTitle(text: titles[index]),
          titleTextStyle: TextStyle(color: Colors.blue, fontSize: 20.0),
          titlePositionPercentageOffset: 0.1,
          radarTouchData:
              RadarTouchData(touchCallback: (FlTouchEvent event, response) {
            if (!event.isInterestedForInteractions) {
              setState(() {
                selectedDataSetIndex = -1;
              });
              return;
            } else {
              setState(() {
                selectedDataSetIndex =
                    response?.touchedSpot?.touchedDataSetIndex ?? -1;
              });
            }
          }),
        ),
      ),
    );
  }
}

List<CelebrityData> get myDataSetList {
  return [
    CelebrityData(
      title: 'Beetles',
      values: [100, 200, 300],
    ),
    CelebrityData(
      title: 'Snoop',
      values: [200, 300, 400],
    ),
    CelebrityData(
      title: 'Taylor',
      values: [300, 400, 500],
    ),
  ];
}
