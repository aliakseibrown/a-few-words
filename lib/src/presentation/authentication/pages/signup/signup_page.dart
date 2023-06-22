import 'package:a_few_words/src/presentation/widgets/form_header_widget.dart';
import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/images.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

import 'widgets/signup_footer_widget.dart';
import 'widgets/signup_form_widget.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: whiteColor,
      body: Container(
        padding: EdgeInsets.all(defaultSize),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              FormHeaderWidget(
                image: handImage,
                title: signUpTitle,
                subTitle: signUpSubTitle,
                imageSize: 0.15,
              ),
              SignUpForm(),
              SignUpFooterWidget(),
            ]),
      ),
    );
  }
}
