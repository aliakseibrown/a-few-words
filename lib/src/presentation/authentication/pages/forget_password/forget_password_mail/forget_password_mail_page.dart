import 'package:a_few_words/src/presentation/widgets/filled_button_widget.dart';
import 'package:a_few_words/src/presentation/widgets/form_header_widget.dart';
import 'package:a_few_words/src/utils/constants/images.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ForgetPasswordMailPage extends StatelessWidget {
  const ForgetPasswordMailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(defaultSize),
          child: Column(
            children:[
              const SizedBox(height: defaultSize*4,),
              const FormHeaderWidget(
                image: eyeImage,
                title: resetViaMail,
                subTitle: forgetMailSubTitle,
                textSubAlign: TextAlign.center,
              ),
              const SizedBox(height: defaultSize,),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text(email),
                        hintText: email,
                        prefixIcon: Icon(IconlyBroken.message),
                      ),
                    ),
                    const SizedBox(height: defaultSize-10,),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButtonWidget(
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
