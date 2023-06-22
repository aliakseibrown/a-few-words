import 'package:a_few_words/src/presentation/core/pages/home_bar/custom_navigation_bar.dart';
import 'package:a_few_words/src/presentation/core/pages/home_bar/widgets/centered_navigation_button.dart';
import 'package:a_few_words/src/presentation/widgets/filled_button_widget.dart';
import 'package:a_few_words/src/utils/constants/colors.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class UpdateProfilePage extends StatelessWidget {
  UpdateProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
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
              const Text(
                'name',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const Text(
                'email@gmail.com',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: greyColor,
                ),
                textAlign: TextAlign.center,
              ),
              // const SizedBox(height: defaultSize),
              Container(
                padding: const EdgeInsets.symmetric(vertical: formHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: formHeight,
                    ),
                    TextFormField(
                      //controller: controller.name,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(IconlyBroken.profile),
                        labelText: name,
                        hintText: name,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: formHeight,
                    ),
                    TextFormField(
                      //controller: controller.email,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(IconlyBroken.message),
                          labelText: email,
                          hintText: email,
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: formHeight,
                    ),
                    TextFormField(
                      //controller: controller.password,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(IconlyBroken.password),
                        labelText: password,
                        hintText: password,
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: null, icon: Icon(IconlyBroken.show)),
                      ),
                    ),
                    const SizedBox(
                      height: formHeight,
                    ),
                    TextFormField(
                      //controller: controller.repeatPassword,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(IconlyBroken.password),
                        labelText: repeatThePassword,
                        hintText: repeatThePassword,
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: null, icon: Icon(IconlyBroken.show)),
                      ),
                    ),
                    const SizedBox(
                      height: formHeight,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: buttonHeight * 2),
              SizedBox(
                  width: double.infinity,
                  child: FilledButtonWidget(
                    title: 'save',
                    onPressed: () {
                      Navigator.pop(context);
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
