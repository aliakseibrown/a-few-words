import 'package:a_few_words/src/presentation/core/pages/dashboard/bar_graph/models/individual_bar.dart';

class BarData {
  final double sunCards;
  final double monCards;
  final double tueCards;
  final double wedCards;
  final double thurCards;
  final double friCards;
  final double satCards;

  BarData ({
    required this.sunCards,
    required this.monCards,
    required this.tueCards,
    required this.wedCards,
    required this.thurCards,
    required this.friCards,
    required this.satCards,
  });

  List<IndividualBar> barData = [];

  void inisializeBarData() {
    barData = [
      IndividualBar(x: 0, y: sunCards),
      IndividualBar(x: 1, y: monCards),
      IndividualBar(x: 2, y: tueCards),
      IndividualBar(x: 3, y: wedCards),
      IndividualBar(x: 4, y: thurCards),
      IndividualBar(x: 5, y: friCards),
      IndividualBar(x: 6, y: satCards),
    ];
  }
}