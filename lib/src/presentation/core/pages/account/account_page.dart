import 'package:a_few_words/src/domain/repositories/authentication_repository/authentication_repository.dart';
import 'package:a_few_words/src/presentation/core/controllers/account_controller.dart';
import 'package:a_few_words/src/presentation/core/pages/account/models/setting.dart';
import 'package:a_few_words/src/presentation/core/pages/account/widgets/setting_tile.dart';
import 'package:a_few_words/src/presentation/core/pages/home_bar/custom_navigation_bar.dart';
import 'package:a_few_words/src/presentation/core/pages/home_bar/widgets/centered_navigation_button.dart';
import 'package:a_few_words/src/presentation/widgets/filled_button_widget.dart';
import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AccountController());
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(defaultSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: defaultSize * 4,
              ),
              Obx(() =>  Text(
                controller.nameString.value,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),),
               Obx(() => Text(
                controller.emailString.value,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: greyColor,
                ),
                textAlign: TextAlign.center,
              ),),
              const SizedBox(height: buttonHeight),
              SizedBox(
                width: 110,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadConst),
                    ),
                    foregroundColor: whiteColor,
                    backgroundColor: secondaryColor,
                    side: const BorderSide(color: primaryColor),
                    padding: const EdgeInsets.symmetric(vertical: buttonHeight),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Get.toNamed("/updateprofile");
                  },
                  child: Text(update.toUpperCase()),
                ),
              ),
              // const SizedBox(height: defaultSize),
              ListView.builder(
                shrinkWrap: true,
                itemCount: settings.length, //items learned
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return SettingTile(
                    setting: settings[index],
                  );
                },
              ),
              const SizedBox(height: buttonHeight * 2),
              SizedBox(
                  width: double.infinity,
                  child: FilledButtonWidget(
                    title: 'Logout',
                    onPressed: () {
                      AuthenticationRepository.instance.logout();
                    },
                  )),
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