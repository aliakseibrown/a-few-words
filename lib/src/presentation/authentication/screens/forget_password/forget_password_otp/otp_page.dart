import 'package:a_few_words/src/presentation/authentication/screens/forget_password/forget_password_options/forget_password_buttom_sheet.dart';
import 'package:a_few_words/src/presentation/authentication/screens/login/login_page.dart';
import 'package:a_few_words/src/presentation/widgets/form_header_widget.dart';
import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/images.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class OtpPage extends StatelessWidget {
  OtpPage({super.key});

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
                image: catEyeImage,
                title: verification,
                subTitle: enterCode,
                textSubAlign: TextAlign.center,
              ),
              const SizedBox(height: defaultSize,),
              OtpTextField(
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                keyboardType: TextInputType.number,
                onSubmit: (code) {
                  print({code});
                  },
              ),
              const SizedBox(height: defaultSize,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                 shape: RoundedRectangleBorder(),
                 foregroundColor: whiteColor,
                 backgroundColor: secondaryColor,
                 side: BorderSide(color: secondaryColor),
                 padding: EdgeInsets.symmetric(vertical: buttonHeight),),
                onPressed: () => Get.to(() => LoginPage()), 
                child: Text("Next"),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}