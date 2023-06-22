import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class LinearBar extends StatelessWidget {
  const LinearBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadConst),
                ),
                backgroundColor: Colors.transparent,
                foregroundColor: secondaryColor,
                padding: const EdgeInsets.symmetric(vertical: buttonHeight - 5),
              ),
              onPressed: () {
                Get.toNamed("/dashboard");
              },
              child: const Icon(IconlyLight.home),
            ),
          ),
          const SizedBox(
            width: 270,
            child: LinearProgressIndicator(
              //value: controller.value,
              value: 71 / 100,
              color: indicatorColor,
              backgroundColor: whiteColor,
              semanticsLabel: 'Linear progress indicator',
            ),
          ),
          SizedBox(
            width: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadConst),
                ),
                backgroundColor: Colors.transparent,
                foregroundColor: secondaryColor,
                padding: const EdgeInsets.symmetric(vertical: buttonHeight - 5),
              ),
              onPressed: () {
                Get.toNamed("/dashboard");
              },
              child: const Icon(IconlyLight.more_square),
            ),
          ),
        ],
      ),
    );
  }
}
