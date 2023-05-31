import 'package:a_few_words/src/presentation/core/pages/dashboard/bar_graph/models/bar_data.dart';
import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarGraph extends StatelessWidget{
  final List week;
  const BarGraph({
    super.key,
    required this.week
  });

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      sunCards: week[0], 
      monCards: week[1],
      tueCards: week[2],
      wedCards: week[3], 
      thurCards: week[4], 
      friCards: week[5], 
      satCards: week[6], 
    );
    myBarData.inisializeBarData();

    return BarChart(
      BarChartData(
        minY: 0,
        maxY: 100,
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true, 
              getTitlesWidget: getButtomTitles,
            )
          ),
        ),
        barGroups: myBarData.barData
        .map(
          (data) => BarChartGroupData(
            x: data.x,
            barRods: [
              BarChartRodData(
                toY: data.y,
                color: secondaryColor,
                width: 25,
                borderRadius: BorderRadius.circular(4),
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  toY: 100,
                  color: whiteColor,
                ),
                )
              ],
            ),
        ).
        toList(),
      ),
    );
  }
}

Widget getButtomTitles (double value, TitleMeta meta) {
  const style = TextStyle(
    color: secondaryColor,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('S', style: style);
      break;
    case 1:
      text = const Text('M', style: style);
      break;
    case 2:
      text = const Text('T', style: style);
      break;
    case 3:
      text = const Text('W', style: style);
      break;
    case 4:
      text = const Text('T', style: style);
      break;
    case 5:
      text = const Text('F', style: style);
      break;
    case 6:
      text = const Text('S', style: style);
      break;
    default: 
      text = const Text('', style: style);
      break;
  }
  return SideTitleWidget(child: text, axisSide: meta.axisSide); 
}