import 'package:a_few_words/src/domain/models/sentence_model.dart';
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
        child: FutureBuilder(
            future: controller.getNextTenSentences(1),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  List<SentenceModel> sentenceData =
                      snapshot.data as List<SentenceModel>;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LinearBar(),
                      Obx(() {
                        return Container(
                          padding: const EdgeInsets.all(defaultSize),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flashcard(
                                  sentence:
                                      sentenceData[controller.counter.value]),
                              const SizedBox(height: defaultSize * 5),
                              SizedBox(
                                  width: 500,
                                  child: FilledButtonWidget(
                                    title: learn,
                                    onPressed: () {
                                      if (controller.word.text == sentenceData[controller.counter.value].keyWord) {
                                        controller.word.clear();
                                        if (controller.counter.value == 2) {
                                          controller.counter.value = 0;
                                        } else {
                                          controller.counter.value++;
                                        }
                                        print(controller.counter.value);
                                      }
                                    },
                                  )),
                            ],
                          ),
                        );
                      })
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return const Center(child: Text('Something went wrong'));
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: const CenteredNavigationButton(),
      // bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
