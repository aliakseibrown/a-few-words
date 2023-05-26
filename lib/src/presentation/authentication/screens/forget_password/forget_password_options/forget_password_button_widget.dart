import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class forgetPasswordButtonWidget extends StatelessWidget {
  const forgetPasswordButtonWidget({
    required this.btnIcon,
    required this.title,
    required this.subTitle,
    required this.onTap,
    super.key,
  });
  final IconData btnIcon;
  final String title, subTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.shade200,
        ),
        child: Row(
          children: [
            Icon(
              btnIcon, size: 60.0),
              SizedBox(width: 15.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Text(title, 
                    style:TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    ), ), 
                    Text(subTitle, 
                    style:TextStyle(
                    fontSize: usualText,
                    ), ), 
                ],
              ),
          ]),
        ),
    );
  }
} 