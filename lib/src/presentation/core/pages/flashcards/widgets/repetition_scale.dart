
import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class RepetitionScale extends StatelessWidget {
  const RepetitionScale({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: scaleSize,
          height: scaleSize,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: accentColor
          ),
        ),
        const SizedBox(width: 5),
        Container(
          width: scaleSize,
          height: scaleSize,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: accentColor
          ),
        ),
        const SizedBox(width: 5),
        Container(
          width: scaleSize,
          height: scaleSize,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor
          ),
        ),
        const SizedBox(width: 5),
        Container(
          width: scaleSize,
          height: scaleSize,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor
          ),
        ),
        const SizedBox(width: 5),
        Container(
          width: scaleSize,
          height: scaleSize,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor
          ),
        ),
      ],
    );
  }
}
