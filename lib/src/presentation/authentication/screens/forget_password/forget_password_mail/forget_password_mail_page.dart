import 'package:a_few_words/src/presentation/authentication/screens/forget_password/forget_password_otp/otp_page.dart';
import 'package:a_few_words/src/presentation/widgets/form_header_widget.dart';
import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/images.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordMailPage extends StatelessWidget {
  ForgetPasswordMailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(defaultSize),
          child: Column(
            children:[
              SizedBox(height: defaultSize*4,),
              FormHeaderWidget(
                image: eyeImage,
                title: resetViaMail,
                subTitle: forgetMailSubTitle,
                textSubAlign: TextAlign.center,
              ),
              SizedBox(height: defaultSize,),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text(email),
                        hintText: email,
                        prefixIcon: Icon(Icons.mail_outline_rounded),
                      ),
                    ),
                    SizedBox(height: defaultSize-10,),
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
                        onPressed: () => Get.to(() => OtpPage()), 
                      child: Text("Next"),
                      ),
                    ),
                  ],
                ) ,
              )
            ],
          ),
        ),
      ),
    );
  }
}