import 'package:a_few_words/src/presentation/views/authentication/screens/forget_password/forget_password_options/forget_password_button_widget.dart';
import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

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
                //contentPadding: EdgeInsets.only(top: 25),
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
                  showModalBottomSheet(
                    context: context, 
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    builder: (context) => Container(
                      height: 300,
                      padding: const EdgeInsets.all(defaultSize),
                      child: Column(
                        children: [
                          const Text(forgetPasswordTitle , 
                            style:TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: headerText,
                            ), 
                          ),
                          const SizedBox(height: 10,),
                          const Text(forgetPasswordSubTitle , 
                            style:TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: usualText,
                            ), 
                          ),
                          const SizedBox(height: 30,),
                          forgetPasswordButtonWidget(
                            btnIcon: Icons.mail_outline_rounded,
                            title: email, 
                            subTitle: resetViaMail,
                            onTap: () {},
                            ),
                        ],),
                    ));
                },
                child: Text(forgetPasword),
              ),
            ),
            const SizedBox(height: formHeight,),
            SizedBox(
              height: buttonSizeHeight,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(),
                    foregroundColor: whiteColor,
                    backgroundColor: secondaryColor,
                    side: BorderSide(color: secondaryColor),
                    padding: EdgeInsets.symmetric(vertical: buttonHeight),
                  ),
                onPressed: () {},
                child: Text(login.toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }
}