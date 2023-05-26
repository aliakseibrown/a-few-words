import 'package:a_few_words/src/utils/constants/images.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class SignUpHeaderWidget extends StatelessWidget {
  const SignUpHeaderWidget({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Image(image: AssetImage(handImage), height: height * 0.15),
      ),
      const Text(signUpTitle, 
        style:
         TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 31,
        ),
      ),
      const Text(signUpSubTitle,  
        style:
         TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 13,
        ), 
        textAlign: TextAlign.center,
        ),
    ],
          );
  }
}