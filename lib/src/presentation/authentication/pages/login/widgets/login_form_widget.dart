import 'package:a_few_words/src/presentation/authentication/pages/forget_password/forget_password_options/forget_password_buttom_sheet.dart';
import 'package:a_few_words/src/presentation/core/pages/dashboard/dashboard_page.dart';
import 'package:a_few_words/src/presentation/widgets/button_widget.dart';
import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
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
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: email,
                hintText: email,
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: formHeight,),
            TextFormField( 
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                labelText: password,
                hintText: password,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: null, 
                  icon: Icon(Icons.remove_red_eye_sharp)),
              ),
            ),
            const SizedBox(height: formHeight,),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ForgetPasswordPage().buildShowModalBottomSheet(context);
                },
                child: Text(forgetPasword),
              ),
            ),
            const SizedBox(height: formHeight,),
            SizedBox(
              height: buttonSizeHeight,
              width: double.infinity,
              child: ButtonWidget(
                title: login,
                onPressed: () => Get.toNamed("/dashboard"),
              )
            )
          ],
        ),
      ),
    );
  }
}