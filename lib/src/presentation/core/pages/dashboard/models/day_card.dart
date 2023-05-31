import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class DayCard extends StatelessWidget{
  DayCard({
    required this.day,
    required this.cards,
    this.maxCards = 100,
  });
  final String day;
  final int cards;
  final int maxCards;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 20,
      decoration: BoxDecoration(
        //border: Border.all(width: 3.0),
        borderRadius: BorderRadius.all( Radius.circular(5.0)),
        color: primaryColor,
      ),
      child: Column(
        children: [

        ],
      ),

    );
  }
}