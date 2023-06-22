import 'package:a_few_words/src/presentation/core/pages/flashcards/widgets/repetition_scale.dart';
import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';

class Flashcard extends StatelessWidget {
  const Flashcard({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      resizeDuration: null,
      onDismissed: (direction) {
        // _counter += direction == DismissDirection.endToStart ? 1 : -1;
      },
      key: new ValueKey(1), //counter
      child: Column(
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
                const RepetitionScale(),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            'Two years before that day I',
                            style: TextStyle(
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
                              controller: controller,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              fullwidth: false,
                              minFontSize: 24,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: translationSize,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const Text(
                            ' my second dream.',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: translationSize,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10,),
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
                  children: const [
                    Text(
                      'zrobić, stwoczyć',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: translationSize,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const Text(
                  'czas przeszły',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: translationSize,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}