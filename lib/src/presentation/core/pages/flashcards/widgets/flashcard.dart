import 'package:a_few_words/src/domain/models/sentence_model.dart';
import 'package:a_few_words/src/presentation/core/controllers/flashcards_controller.dart';
import 'package:a_few_words/src/presentation/core/pages/flashcards/widgets/repetition_scale.dart';
import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:get/get.dart';

class Flashcard extends StatelessWidget {
  Flashcard({
    super.key,
    required this.sentence,
  });

  final SentenceModel sentence;
  final controller = Get.put(FlashcardsController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(buttonHeight),
          //height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadConst),
            color: whiteColor,
          ),
          child: Column(
            children: [
              RepetitionScale(times: sentence.times),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          sentence.firstPart,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: translationSize,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          // height: 45,
                          decoration: const BoxDecoration(
                            color: boxColor,
                          ),
                          // padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: AutoSizeTextField(
                            controller: controller.word,
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            fullwidth: false,
                            minFontSize: 24,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: translationSize,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                          sentence.thirdPart,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: translationSize,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: defaultSize - 10),
        Container(
          padding: const EdgeInsets.all(buttonHeight),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadConst),
            color: whiteColor,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    sentence.keyWord,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: translationSize,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Text(
                sentence.translation,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: translationSize,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
