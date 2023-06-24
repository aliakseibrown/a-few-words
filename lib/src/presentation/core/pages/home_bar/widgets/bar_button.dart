import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class BarButton extends StatelessWidget {
  const BarButton({

    required this.onPressed,
    required this.icon,
    this.text = "",
    super.key,
  });

  final Function() onPressed;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(8),
      //width: 85,
      // height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          backgroundColor: whiteColor,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: secondaryColor,
              ),
            Text(
              text,
              style: const TextStyle(
                color: secondaryColor,
                fontSize: 13.0,
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}