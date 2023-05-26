import 'package:a_few_words/src/utils/constants/images.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
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
        child: Image(image: AssetImage(leafImage), height: height * 0.25),
      ),
      const Text(loginTitle, 
        style:
         TextStyle(
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          fontFamily: 'RobotoMono',
          fontSize: 31,
        ),
      ),
      const Text(loginSubTitle,  
        style:
         TextStyle(
          fontWeight: FontWeight.w900,
          fontStyle: FontStyle.normal,
          fontFamily: 'RobotoMono',
          fontSize: 13,
        ), 
      textAlign: TextAlign.center,),
    ],
          );
  }
}