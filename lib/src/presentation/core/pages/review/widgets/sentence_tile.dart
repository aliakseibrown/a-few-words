import 'package:a_few_words/src/presentation/core/pages/review/models/sentence.dart';
import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SentenceTile extends StatelessWidget {

  Sentence sentence;
  SentenceTile({
    super.key,
    required this.sentence
    });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 80,
      margin: const EdgeInsets.only(bottom:25),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(borderRadConst),
      ),
      child:Column(
        children: [
          Text(
            sentence.word,
            style: const TextStyle(color: secondaryColor),
          ),
          Text(
            sentence.sentence,
            style: const TextStyle(color: secondaryColor),
          ),
          Text(
            sentence.translation,
            style: const TextStyle(color: secondaryColor),
          ),
        ],
      )
    );
  }


}