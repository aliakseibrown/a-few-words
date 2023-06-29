import 'package:a_few_words/src/presentation/widgets/filled_button_widget.dart';
import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/images.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  // final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: lightPrimaryColor,
      body: Container(
        padding: const EdgeInsets.all(defaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Image(image: const AssetImage(welcomeScreenImage), height: height * 0.45),
          const Column(
            children: [
              Text(welcomeTitle, 
                style:
                 TextStyle(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'RobotoMono',
                  fontSize: 40,
                ),
              ),
              Text(welcomeSubTitle,  
                style:
                 TextStyle(
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'RobotoMono',
                  fontSize: 15,
                ), 
              textAlign: TextAlign.center,),
            ],
          ),
          Row(
            children:[
              Expanded(
                child: OutlinedButton(
                  onPressed: () =>Get.toNamed("/login"), 
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      ),
                    foregroundColor: secondaryColor,
                    side: const BorderSide(color: secondaryColor),
                    padding: const EdgeInsets.symmetric(vertical: buttonHeight),
                  ),
                  child: Text(login.toUpperCase())
                  )
                ),
              const SizedBox(width: 10.0,),
              Expanded(
                child: FilledButtonWidget(
                title: signUp,
                color: primaryColor,
                onPressed: () => Get.toNamed("/signup"),
                )
              )
            ] ,
            ),
        ]),
      ),
    );
  }
}