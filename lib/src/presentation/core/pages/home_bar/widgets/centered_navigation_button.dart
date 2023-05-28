import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class CenteredNavigationButton extends StatelessWidget {
  const CenteredNavigationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
          Navigator.pop(context);
          Get.toNamed("/flashcards");
        },
      backgroundColor: whiteColor,
      foregroundColor: secondaryColor,
      child: const Icon(IconlyBroken.arrow_right_2,),
    );
  }
}