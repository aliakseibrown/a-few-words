import 'package:a_few_words/src/presentation/core/pages/dashboard/models/day_card.dart';
import 'package:a_few_words/src/presentation/core/pages/dashboard/bar_graph/widgets/bar_graph.dart';
import 'package:a_few_words/src/presentation/core/pages/home_bar/widgets/centered_navigation_button.dart';
import 'package:a_few_words/src/presentation/core/pages/home_bar/custom_navigation_bar.dart';
import 'package:a_few_words/src/presentation/widgets/filled_button_widget.dart';
import 'package:a_few_words/src/presentation/widgets/form_header_widget.dart';
import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/images.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});



  @override
  Widget build(BuildContext context) {
    const List<double> week = [
    2.0,
    20.0,
    87,
    12,
    76,
    34,
    54,
  ];

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(defaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Container(
                padding: EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //SizedBox(width: 75, height: 75),
                    Container(
                      height: 45,
                      width: 45,
                      child: OutlinedButton(
                        // onPressed: () =>Get.toNamed("/login"), 
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(borderRadConst-5),
                        ),
                      backgroundColor: whiteColor,
                      foregroundColor: secondaryColor,
                      //side: BorderSide(color: secondaryColor),
                      padding: EdgeInsets.symmetric(vertical: buttonHeight),
                    ),
                    child: Text(currentLanguage.toUpperCase())
                    )
                    ),
                    const SizedBox(
                      width: defaultSize,
                    ),
                    Container(
                      child: const Text(hiuser, 
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: headerText,
                          ),
                          textAlign: TextAlign.left,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: defaultSize,),
              Container(
                child: const Text(yourstats, 
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: headerText,
                ),
                textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: defaultSize),
              // Container(
              //   height: 150,
              //   decoration: const BoxDecoration(
              //     color: Colors.lightBlue
              //   ),
              //   child: ListView.builder(
              //     //itemCount: daysList.length,
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (context, index) {
              //       return DayCard(
              //         daysList[index][0],
              //       )
              //     }
              //     ),
              // ),
              const SizedBox(
                height: 200,
                width: 500,
                child: BarGraph(
                  week: week,
                ),
              ),
              // const FormHeaderWidget(
              //   image: plantImage,
              //   title: dashboard,
              //   subTitle: enterCode,
              //   textSubAlign: TextAlign.center,
              // ),
              const SizedBox(height: defaultSize,),
              SizedBox(
                width: double.infinity,
                child: FilledButtonWidget(
                title: check,
                onPressed: () => Get.toNamed("/login"),
              )
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const CenteredNavigationButton(),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}