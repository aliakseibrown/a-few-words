import 'package:a_few_words/src/presentation/authentication/pages/forget_password/forget_password_otp/otp_page.dart';
import 'package:a_few_words/src/presentation/widgets/button_widget.dart';
import 'package:a_few_words/src/presentation/widgets/form_header_widget.dart';
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
              const FormHeaderWidget(
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
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text(email),
                        hintText: email,
                        prefixIcon: Icon(Icons.mail_outline_rounded),
                      ),
                    ),
                    SizedBox(height: defaultSize-10,),
                    SizedBox(
                      width: double.infinity,
                      child: ButtonWidget(
                        title: "NEXT",
                        onPressed: () => Get.toNamed("/otp"),
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
