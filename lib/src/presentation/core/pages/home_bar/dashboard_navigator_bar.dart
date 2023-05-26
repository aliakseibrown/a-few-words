
import 'package:a_few_words/src/presentation/core/pages/dashboard/dashboard_page.dart';
import 'package:a_few_words/src/presentation/core/pages/flashcards/flashcards_page.dart';
import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class DashboardNavigatorBar extends StatelessWidget {
  DashboardNavigatorBar({super.key});

  int currentTab = 0;
  final List<Widget> pages = [
    DashboardPage(),
    //VocabularyPage(),
    FlashcardsPage(),
    //StatisticPage(),
    //AccountPage(),
  ];

  Widget currentPage = DashboardPage();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      height: 80.0,
      decoration: BoxDecoration(
        color: secondaryColor,
        boxShadow: [BoxShadow(
         color: Colors.black.withOpacity(0.4),
         spreadRadius: 1,
         blurRadius: 8,
        ),],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            width: 130,
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                backgroundColor: secondaryColor,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () { },
              child: Column(
                children: [
                  Icon(
                    Icons.home_outlined,
                    color: whiteColor,
                    ),
                  Text(
                    dashboard,
                    style: TextStyle(
                      color: whiteColor,
                    )),
                ],
              ),
            ),
            
          ),
        ],
      ),
    );
  }
}

// FloatingActionButton(
//             child: Icon(Icons.skip_next_outlined),
//             onPressed: () {},
//             ),
//           floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,