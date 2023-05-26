import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

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
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: name,
                hintText: name,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: formHeight,),
            TextFormField( 
              decoration: const InputDecoration(
                //contentPadding: EdgeInsets.only(top: 25),
                prefixIcon: Icon(Icons.mail_outline_outlined),
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
            TextFormField( 
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                labelText: repeatThePassword,
                hintText: repeatThePassword,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: null, 
                  icon: Icon(Icons.remove_red_eye_sharp)),
              ),
            ),
            const SizedBox(height: formHeight,),
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
                child: Text(signUp.toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }
} 