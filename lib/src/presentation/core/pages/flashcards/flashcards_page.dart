// ignore_for_file: avoid_print
import 'package:a_few_words/src/presentation/core/controllers/flashcards_controller.dart';
import 'package:a_few_words/src/presentation/core/pages/flashcards/widgets/flashcard.dart';
import 'package:a_few_words/src/presentation/core/pages/flashcards/widgets/linear_bar.dart';
import 'package:a_few_words/src/presentation/widgets/filled_button_widget.dart';
import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlashcardsPage extends StatelessWidget {
  const FlashcardsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FlashcardsController());
    //int _counter = 0;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              return LinearBar(index: controller.index.value);
            }),
            Obx(() {
                  if (controller.index.value < controller.dailyMax) {
                    return Container(
                      padding: const EdgeInsets.all(defaultSize),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flashcard(
                              sentence: controller
                                  .newList[controller.index.value]),
                          const SizedBox(height: defaultSize * 5),
                          SizedBox(
                              width: 500,
                              child: FilledButtonWidget(
                                title: learn,
                                onPressed: () {
                                  controller.checkWord(controller
                                      .newList[controller.index.value]
                                      .keyWord);
                                },
                              )),
                        ],
                      ),
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(defaultSize),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(borderRadConst),
                              color: whiteColor,
                            ),
                            child: const Text(
                              'Check for new words later',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: translationSize,
                              ),
                              textAlign: TextAlign.center,
                            )),
                      ],
                    );
                  }
                })
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: const CenteredNavigationButton(),
      // bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
