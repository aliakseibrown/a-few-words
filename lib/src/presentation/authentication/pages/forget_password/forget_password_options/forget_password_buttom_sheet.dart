import 'package:a_few_words/src/presentation/authentication/pages/forget_password/forget_password_options/forget_password_button_widget.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ForgetPasswordPage {
  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
                  context: context, 
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  builder: (context) => Container(
                    height: 300,
                    padding: const EdgeInsets.all(defaultSize),
                    child: Column(
                      children: [
                        const Text(forgetPasswordTitle , 
                          style:TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: headerText,
                          ), 
                        ),
                        const SizedBox(height: 10,),
                        const Text(forgetPasswordSubTitle , 
                          style:TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: usualText,
                          ), 
                        ),
                        const SizedBox(height: 30,),
                        forgetPasswordButtonWidget(
                          btnIcon: IconlyBroken.message,
                          title: email, 
                          subTitle: resetViaMail,
                          onTap: () {
                            Navigator.pop(context);
                            Get.toNamed('forgetmail');
                          }
                          ),
                      ],),
                  ));
  }
}