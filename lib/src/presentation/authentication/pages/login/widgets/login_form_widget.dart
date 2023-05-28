import 'package:a_few_words/src/presentation/authentication/pages/forget_password/forget_password_options/forget_password_buttom_sheet.dart';
import 'package:a_few_words/src/presentation/core/pages/dashboard/dashboard_page.dart';
import 'package:a_few_words/src/presentation/widgets/filled_button_widget.dart';
import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

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
                prefixIcon: Icon(IconlyBroken.profile),
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
              child: FilledButtonWidget(
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