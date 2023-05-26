import 'package:a_few_words/src/presentation/authentication/pages/login/login_page.dart';
import 'package:a_few_words/src/presentation/authentication/pages/signup/signup_page.dart';
import 'package:a_few_words/src/presentation/widgets/button_widget.dart';
import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/images.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});
  // final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        padding: EdgeInsets.all(defaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Image(image: AssetImage(welcomeScreenImage), height: height * 0.45),
          Column(
            children: const [
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
                    shape: RoundedRectangleBorder(),
                    foregroundColor: secondaryColor,
                    side: BorderSide(color: secondaryColor),
                    padding: EdgeInsets.symmetric(vertical: buttonHeight),
                  ),
                  child: Text(login.toUpperCase())
                  )
                ),
              SizedBox(width: 10.0,),
              Expanded(
                child: ButtonWidget(
                title: signUp,
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