import 'package:a_few_words/src/presentation/widgets/filled_button_widget.dart';
import 'package:a_few_words/src/presentation/widgets/form_header_widget.dart';
import 'package:a_few_words/src/utils/constants/images.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(defaultSize),
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
                child: FilledButtonWidget(
                title: next,
                onPressed: () => Get.toNamed("/login"),
              )
              ),
            ],
          ),
        ),
      ),
    );
  }
}