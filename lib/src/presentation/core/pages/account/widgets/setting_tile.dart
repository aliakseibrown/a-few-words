
import 'package:a_few_words/src/presentation/core/pages/account/models/setting.dart';
import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  final Setting setting;
  const SettingTile({
    required this.setting,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {} , //navigation
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            margin: const EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              color: cardBgColor, 
              borderRadius: BorderRadius.circular(borderRadConst),
            ),
            child: Icon(setting.icon, color: secondaryColor),
          ),
          const SizedBox(width: 15),
          Text(
            setting.title,
            style: const TextStyle(
              color: secondaryColor,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            )
          ),
          const Spacer(),
          const Icon(CupertinoIcons.chevron_forward, color: greyColor),
        ],
      ),
    );
  }
}