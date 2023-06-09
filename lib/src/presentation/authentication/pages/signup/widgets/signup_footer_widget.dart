import 'package:a_few_words/src/presentation/authentication/pages/login/login_page.dart';
import 'package:a_few_words/src/utils/constants/images.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
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
                    padding: const EdgeInsets.symmetric(vertical: buttonHeight),
                  ),
            icon: const Image(image: AssetImage(googleImage), width: 20.0),
            onPressed: () {}, 
            label: const Text(signInWithGoogle),
            ),
        ),
        const SizedBox(height: formHeight,),
        TextButton(
           onPressed: () => Get.to(() => LoginPage()), 
          child: const Text.rich(
            TextSpan(
              text: alreadyHaveAnAccount,
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: login,
                  style: TextStyle(color: Colors.blue)
                )
              ]
            )
            ))
      ],
    );
  }
}