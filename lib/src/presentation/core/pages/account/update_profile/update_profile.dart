import 'package:a_few_words/src/presentation/core/controllers/account_controller.dart';
import 'package:a_few_words/src/presentation/core/pages/home_bar/custom_navigation_bar.dart';
import 'package:a_few_words/src/presentation/core/pages/home_bar/widgets/centered_navigation_button.dart';
import 'package:a_few_words/src/presentation/widgets/filled_button_widget.dart';
import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class UpdateProfilePage extends StatelessWidget {
  const UpdateProfilePage({super.key});
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
              Obx(() => Text(
                controller.currentUser.fullName,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),),
              Obx(() => Text(
                controller.currentUser.email,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: greyColor,
                ),
                textAlign: TextAlign.center,
              ),),
              // const SizedBox(height: defaultSize),
              Container(
                padding: const EdgeInsets.symmetric(vertical: formHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: formHeight,
                    ),
                    Obx(() => TextFormField(
                      controller: controller.name,
                      initialValue: controller.currentUser.fullName,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(IconlyBroken.profile),
                        labelText: name,
                        hintText: name,
                        border: OutlineInputBorder(),
                      ),
                    ),),
                    const SizedBox(
                      height: formHeight,
                    ),
                    Obx(() => TextFormField(
                      controller: controller.email,
                      initialValue: controller.currentUser.email,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(IconlyBroken.message),
                          labelText: email,
                          hintText: email,
                          border: OutlineInputBorder()),
                    ),),
                    const SizedBox(
                      height: formHeight,
                    ),
                    Obx(() => TextFormField(
                      controller: controller.password,
                      obscureText: controller.obscureTextPassword,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(IconlyBroken.password),
                        labelText: password,
                        hintText: password,
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: null, icon: Icon(IconlyBroken.show)),
                      ),
                    ),),
                    const SizedBox(
                      height: formHeight,
                    ),
                    Obx(() => TextFormField(
                      controller: controller.repeatPassword,
                      obscureText: controller.obscureTextRepeatPassword,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(IconlyBroken.password),
                        labelText: repeatThePassword,
                        hintText: repeatThePassword,
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: null, icon: Icon(IconlyBroken.show)),
                      ),
                    ),),
                    const SizedBox(
                      height: formHeight,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: buttonHeight-10),
              SizedBox(
                  width: 150,
                  child: FilledButtonWidget(
                    color: accentColor,
                    title: 'delete account',
                    onPressed: () {
                      //Get.toNamed("/account");
                    },
                  )),
              const SizedBox(height: buttonHeight * 2),
              SizedBox(
                  width: double.infinity,
                  child: FilledButtonWidget(
                    title: 'save',
                    onPressed: () {
                      controller.checkPasswords();
                      Get.back();
                      //Get.toNamed("/account");
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
