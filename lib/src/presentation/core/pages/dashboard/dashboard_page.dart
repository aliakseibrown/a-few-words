import 'package:a_few_words/src/presentation/core/controllers/review_controller.dart';
import 'package:a_few_words/src/presentation/core/pages/dashboard/bar_graph/widgets/bar_graph.dart';
import 'package:a_few_words/src/presentation/core/pages/dashboard/widgets/header_widget.dart';
import 'package:a_few_words/src/presentation/core/pages/dashboard/widgets/middle_widget.dart';
import 'package:a_few_words/src/presentation/core/pages/home_bar/widgets/centered_navigation_button.dart';
import 'package:a_few_words/src/presentation/core/pages/home_bar/custom_navigation_bar.dart';
import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const HeaderWidget(),
            Container(
              padding: const EdgeInsets.all(defaultSize),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //const SizedBox(height: defaultSize),
                  SizedBox(
                    height: 120,
                    width: 500,
                    child: BarGraph(
                      week: week,
                    ),
                  ),
                  SizedBox(height: defaultSize),
                  MiddleWidget(),
                  SizedBox(height: defaultSize),
                  // SizedBox(
                  //     width: double.infinity,
                  //     child: FilledButtonWidget(
                  //       title: check,
                  //       onPressed: () => Get.toNamed("/flashcards"),
                  //     )),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const CenteredNavigationButton(),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
