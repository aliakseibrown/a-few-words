import 'package:a_few_words/src/presentation/widgets/form_header_widget.dart';
import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/images.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

import 'widgets/login_footer_widget.dart';
import 'widgets/login_form_widget.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Container(
        padding: const EdgeInsets.all(defaultSize),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            FormHeaderWidget(
              image: leafImage,
              title: loginTitle,
              subTitle: loginSubTitle,
            ),
            LoginForm(),
            LoginFooterWidget(),
        ]),
      ),
    );
  }
}