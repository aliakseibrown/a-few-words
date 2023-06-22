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
    //int _counter = 0;
    TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LinearBar(),
            Container(
              padding: const EdgeInsets.all(defaultSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flashcard(controller: controller),
                  const SizedBox(height: defaultSize*15),
                  
                  SizedBox(
                      width: double.infinity,
                      child: FilledButtonWidget(
                        title: learn,
                        onPressed: () => Get.toNamed("/dashboard"),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: const CenteredNavigationButton(),
      // bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
