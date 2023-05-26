import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'signup_footer_widget.dart';
import 'signup_form_widget.dart';
import 'signup_header_widget.dart';


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
          children: [ 
            SignUpHeaderWidget(height: height),
            const SignUpForm(),
            SignUpFooterWidget(),
        
        ]),
      ),
    );
  }
}