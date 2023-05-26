import 'package:a_few_words/src/presentation/authentication/pages/login/login_page.dart';
import 'package:a_few_words/src/presentation/core/pages/home_bar/dashboard_navigator_bar.dart';
import 'package:a_few_words/src/presentation/widgets/button_widget.dart';
import 'package:a_few_words/src/presentation/widgets/form_header_widget.dart';
import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/images.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class FlashcardsPage extends StatelessWidget {
  FlashcardsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(defaultSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              const SizedBox(height: defaultSize*4,),
              const FormHeaderWidget(
                image: plantImage,
                title: flashcards,
                subTitle: enterCode,
                textSubAlign: TextAlign.center,
              ),
              const SizedBox(height: defaultSize,),
              SizedBox(
                width: double.infinity,
                child: ButtonWidget(
                title: play,
                onPressed: () => Get.toNamed("/login"),
              )
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: DashboardNavigatorBar(),
    );
  }
}