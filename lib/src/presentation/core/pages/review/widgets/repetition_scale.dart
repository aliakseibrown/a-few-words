import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class RepetitionScale extends StatelessWidget {
  final int times;
  const RepetitionScale({
    super.key,
    required this.times,
  });
  // sentence.times
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: scaleSize,
          height: scaleSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: times > 0? accentColor: backgroundColor,
          ),
        ),
        const SizedBox(width: 5),
        Container(
          width: scaleSize,
          height: scaleSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: times > 1? accentColor: backgroundColor,
          ),
        ),
        const SizedBox(width: 5),
        Container(
          width: scaleSize,
          height: scaleSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: times > 2? accentColor: backgroundColor,
          ),
        ),
        const SizedBox(width: 5),
        Container(
          width: scaleSize,
          height: scaleSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: times > 3? accentColor: backgroundColor,
          ),
        ),
        const SizedBox(width: 5),
        Container(
          width: scaleSize,
          height: scaleSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: times > 4? accentColor: backgroundColor,
          ),
        ),
      ],
    );
  }
}
