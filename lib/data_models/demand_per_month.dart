import 'package:fl_chart/fl_chart.dart';

class DemandPerMonth {
  late double demand;
  late double month;
  DemandPerMonth({required this.demand, required this.month});
}

List<FlSpot> getTheSpots(int forProduct) {
  final List<DemandPerMonth> demandPerMonthDataForProductInitial = [
    DemandPerMonth(demand: 0, month: 1),
    DemandPerMonth(demand: 0, month: 2),
    DemandPerMonth(demand: 0, month: 3),
    DemandPerMonth(demand: 0, month: 4),
    DemandPerMonth(demand: 0, month: 5)
  ];
  final List<DemandPerMonth> demandPerMonthDataForProduct1 = [
    DemandPerMonth(demand: 30, month: 1),
    DemandPerMonth(demand: 50, month: 2),
    DemandPerMonth(demand: 20, month: 3),
    DemandPerMonth(demand: 80, month: 4),
    DemandPerMonth(demand: 60, month: 5)
  ];
  final List<DemandPerMonth> demandPerMonthDataForProduct2 = [
    DemandPerMonth(demand: 50, month: 1),
    DemandPerMonth(demand: 40, month: 2),
    DemandPerMonth(demand: 80, month: 3),
    DemandPerMonth(demand: 50, month: 4),
    DemandPerMonth(demand: 70, month: 5)
  ];
  List<FlSpot> spotsData = [];
  switch (forProduct) {
    case 0:
      spotsData = demandPerMonthDataForProductInitial
          .map((point) => FlSpot(point.month, point.demand))
          .toList();
      break;
    case 1:
      spotsData = demandPerMonthDataForProduct1
          .map((point) => FlSpot(point.month, point.demand))
          .toList();
      break;
    case 2:
      spotsData = demandPerMonthDataForProduct2
          .map((point) => FlSpot(point.month, point.demand))
          .toList();
      break;
  }
  return spotsData;
}