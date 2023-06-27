import 'package:a_few_words/src/domain/models/sentence_model.dart';
import 'package:a_few_words/src/presentation/core/pages/review/widgets/repetition_scale.dart';
import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SentenceTile extends StatelessWidget {
  SentenceModel sentence;
  SentenceTile({super.key, required this.sentence});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 280,
        height: 80,
        margin: const EdgeInsets.only(bottom: 25),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(borderRadConst),
        ),
        child: Container(
          margin: const EdgeInsets.all(cardMargin),
          child: Column(
            children: [
              Container(
                child: Row(
                //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width:buttonHeight-5),
                    RepetitionScale(times: sentence.times),
                    const SizedBox(width:defaultSize*2),
                    Text(
                      sentence.keyWord,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: wordSize,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: cardMargin-2 ),
              Text(
                sentence.fullSentence,
                style: const TextStyle(
                    //fontWeight: FontWeight.w700,
                    fontSize: sentenceReviewSize,
                  ),
              ),
              const SizedBox(height: cardMargin-2 ),
              Text(
                sentence.translation,
                style: const TextStyle(
                    //fontWeight: FontWeight.w700,
                    fontSize: transactionReviewSize,
                  ),
              ),
            ],
          ),
        ));
  }
}
