import 'package:a_few_words/src/presentation/widgets/filled_button_widget.dart';
import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class MiddleWidget extends StatelessWidget {
  const MiddleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 160,
          width: 160,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(borderRadConst),
          ),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                decoration: BoxDecoration(
                  color: lightPrimaryColor,
                  borderRadius: BorderRadius.circular(borderRadConst),
                ),
                child: const Text(
                  '字',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: dashboardBox + 170,
                    color: whiteColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(buttonHeight),
                child: Column(
                  children: [
                    const Text(
                      learnedToday,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: dashboardBox,
                        color: secondaryColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.all(11),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius:
                              BorderRadius.circular(borderRadConst - 5),
                        ),
                        child: const Text(
                          '52',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: dashboardBox + 12,
                            color: whiteColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: defaultSize),
        Column(
          children: [
            Container(
              height: 95,
              width: 160,
              padding: const EdgeInsets.all(buttonHeight),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(borderRadConst),
              ),
              child: Column(
                children: [
                  const Text(
                    allWords,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: dashboardBox,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Flexible(
                    child: Container(
                      // padding: EdgeInsets.all(11),
                      decoration: BoxDecoration(
                        //color: boxColor,
                        borderRadius: BorderRadius.circular(borderRadConst - 5),
                      ),
                      child: const Text(
                        '1252',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: dashboardBox + 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: defaultSize - 10),
            Container(
                height: 45,
                width: 160,
                decoration: BoxDecoration(
                  //color: primaryColor,
                  borderRadius: BorderRadius.circular(borderRadConst - 3),
                ),
                child: FilledButtonWidget(
                  title: details,
                  onPressed: () {},
                  color: primaryColor,
                  // colorText: secondaryColor,
                  colorBorder: primaryColor,
                )),
          ],
        ),
      ],
    );
  }
}
