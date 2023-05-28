import 'package:a_few_words/src/presentation/widgets/filled_button_widget.dart';
import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
      padding: const EdgeInsets.symmetric(vertical: formHeight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: formHeight,),
            TextFormField( 
              decoration: const InputDecoration(
                prefixIcon: Icon(IconlyBroken.profile),
                labelText: name,
                hintText: name,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: formHeight,),
            TextFormField( 
              decoration: const InputDecoration(
                //contentPadding: EdgeInsets.only(top: 25),
                prefixIcon: Icon(IconlyBroken.message),
                labelText: email,
                hintText: email,
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: formHeight,),
            TextFormField( 
              decoration: const InputDecoration(
                prefixIcon: Icon(IconlyBroken.password),
                labelText: password,
                hintText: password,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: null, 
                  icon: Icon(IconlyBroken.show)),
              ),
            ),
            const SizedBox(height: formHeight,),
            TextFormField( 
              decoration: const InputDecoration(
                prefixIcon: Icon(IconlyBroken.password),
                labelText: repeatThePassword,
                hintText: repeatThePassword,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: null, 
                  icon: Icon(IconlyBroken.show)),
              ),
            ),
            const SizedBox(height: formHeight,),
            const SizedBox(height: formHeight,),
            SizedBox(
              height: buttonSizeHeight,
              width: double.infinity,
              child: FilledButtonWidget(
                title: signUp,
                onPressed: () => Get.toNamed("/signup"),
                )
            )
          ],
        ),
      ),
    );
  }
} 