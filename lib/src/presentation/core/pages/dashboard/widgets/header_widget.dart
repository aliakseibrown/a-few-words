import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/images.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      color: Colors.transparent,
      child: Container(
          decoration: const BoxDecoration(
            color: lightPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(40.0),
              bottomLeft: Radius.circular(40.0),
            ),
            // boxShadow: [
            //   BoxShadow(
            //     //color: Color.fromARGB(255, 54, 54, 54).withOpacity(0.7),
            //     color: primaryColor,
            //     spreadRadius: 1,
            //     blurRadius: 10,
            //     offset: Offset(0,1), // changes position of shadow
            //   ),
            // ],
          ),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.fromLTRB(160, 0, 0, 0),
                child: const Text(
                  '说',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: dashboardBox + 320,
                    color: backgroundColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(defaultSize),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 40),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: 45,
                              width: 45,
                              child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          borderRadConst - 5),
                                    ),
                                    backgroundColor: accentColor,
                                    foregroundColor: whiteColor,
                                    //side: BorderSide(color: secondaryColor),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: buttonHeight),
                                  ),
                                  child: Text(currentLanguage.toUpperCase()))),
                          const SizedBox(
                            width: defaultSize - 10,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: buttonHeight),
                    const Text(
                      hiuser,
                      style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.w700,
                        fontSize: headerText,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: buttonHeight*3-2),
                    // const Text(
                    //   study,
                    //   style: TextStyle(
                    //     color: whiteColor,
                    //     fontWeight: FontWeight.w500,
                    //     fontSize: headerText - 8,
                    //   ),
                    //   textAlign: TextAlign.left,
                    // ),
                    const SizedBox(height: buttonHeight),
                    // SizedBox(
                    //   height: 45.0,
                    //   width: 200.0,
                    //   child: ElevatedButton(
                    //     style: ElevatedButton.styleFrom(
                    //       elevation: 0,
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(borderRadConst),
                    //       ),
                    //       foregroundColor: whiteColor,
                    //       backgroundColor: primaryColor,
                    //       //side: const BorderSide(color: secondaryColor),
                    //       padding: const EdgeInsets.symmetric(
                    //           vertical: buttonHeight),
                    //     ),
                    //     onPressed: () => Get.toNamed('/flashcards'),
                    //     child: Text(learn.toUpperCase()),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
