import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.imageSize = 0.25,
    this.imageColor,
    this.textTitleAlign,
    this.textSubAlign
  });

  final String image, title, subTitle;
  final CrossAxisAlignment crossAxisAlignment;
  final double imageSize;
  final Color? imageColor;
  final TextAlign? textTitleAlign, textSubAlign;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: crossAxisAlignment,
    children: [
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Image(image: AssetImage(image), color: imageColor, height: height * imageSize),
      ),
      Text(title, 
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: wordSize,),
        textAlign: textTitleAlign,
      ),
      Text(subTitle,  
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: wordSize,),
      textAlign: textSubAlign,),
    ],
          );
  }
}