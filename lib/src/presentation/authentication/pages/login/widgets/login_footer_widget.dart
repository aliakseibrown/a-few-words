import 'package:a_few_words/src/presentation/authentication/pages/signup/signup_page.dart';
import 'package:a_few_words/src/presentation/core/pages/dashboard/dashboard_page.dart';
import 'package:a_few_words/src/utils/constants/images.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(height: formHeight,),
        SizedBox(
          height: buttonSizeHeight,
          width: double.infinity,
          child: OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  ),
                padding: EdgeInsets.symmetric(vertical: buttonHeight),
                  ),
            icon: Image(image: AssetImage(googleImage), width: 20.0),
            onPressed: () {},
            label: Text(signInWithGoogle),
            ),
        ),
        const SizedBox(height: formHeight,),
        TextButton(
          onPressed: () =>Get.toNamed('/signup'), 
          child: const Text.rich(
            TextSpan(
              text: dontHaveAnAccount,
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: signUp,
                  style: TextStyle(color: Colors.blue)
                )
              ]
            )
            ))
      ],
    );
  }
}