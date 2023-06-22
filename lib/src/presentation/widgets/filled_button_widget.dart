import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class FilledButtonWidget extends StatelessWidget {
  const FilledButtonWidget({
    super.key,
    this.color = secondaryColor,
    this.colorText = whiteColor,
    this.colorBorder = secondaryColor,
    required this.onPressed,
    required this.title,
  });
  final Function() onPressed;
  final String title;
  final Color color;
  final Color colorText;
  final Color colorBorder;



  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadConst),
        ),
        foregroundColor: colorText,
        backgroundColor: color,
        side: BorderSide(color: colorBorder),
        padding: const EdgeInsets.symmetric(vertical: buttonHeight),),
      onPressed: onPressed,
    child: Text(title.toUpperCase()),
    );
  }
}