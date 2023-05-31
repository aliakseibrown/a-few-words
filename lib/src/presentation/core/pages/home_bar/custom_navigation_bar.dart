import 'package:a_few_words/src/presentation/core/pages/home_bar/widgets/bar_button.dart';
import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 10.0,
      shape: const CircularNotchedRectangle(),
      color: whiteColor,
      child: Container(
        padding: const EdgeInsets.fromLTRB(15,5, 4, 10),
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BarButton(
            icon: IconlyLight.home,
            text: home,
            onPressed: () {
              Navigator.pop(context);
              Get.toNamed("/dashboard");
            },
          ),
          BarButton(
            icon: IconlyLight.document,
            text: review,
            onPressed: () {},
          ),
          const SizedBox(
            width: 55,
          ),
          BarButton(
            icon: IconlyBroken.graph,
            text: stats,
            onPressed: () {},
          ),
          BarButton(
            icon: IconlyBroken.setting,
            text: account,
            onPressed: () => Get.back(),
          ),
        ],
      ),
    )
      );
  }
}
