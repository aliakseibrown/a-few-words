import 'package:a_few_words/src/domain/models/sentence_model.dart';
import 'package:a_few_words/src/presentation/core/controllers/review_controller.dart';
import 'package:a_few_words/src/presentation/core/pages/home_bar/widgets/centered_navigation_button.dart';
import 'package:a_few_words/src/presentation/core/pages/home_bar/custom_navigation_bar.dart';
import 'package:a_few_words/src/presentation/core/pages/review/widgets/sentence_tile.dart';
import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller  = Get.put(ReviewController());
    //final ReviewController controller = Get.find();

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(defaultSize),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: defaultSize,
                ),
                const Text(
                  yourstats,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: headerText,
                  ),
                  textAlign: TextAlign.left,
                ),
                Column(
                  children: [ 
                   Obx(() => ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.userList.length, //items learned
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return SentenceTile(
                            sentence: controller.userList[index],
                          );
                        },
                      ),),
                  ],
                ),
              ],
            ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const CenteredNavigationButton(),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
