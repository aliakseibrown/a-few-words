import 'package:a_few_words/src/presentation/authentication/controllers/signup_controller.dart';
import 'package:a_few_words/src/domain/models/user_model.dart';
import 'package:a_few_words/src/presentation/widgets/filled_button_widget.dart';
import 'package:a_few_words/src/utils/constants/sizes.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: formHeight),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: formHeight,),
              TextFormField( 
                controller: controller.name,
                decoration: const InputDecoration(
                  prefixIcon: Icon(IconlyBroken.profile),
                  labelText: name,
                  hintText: name,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: formHeight,),
              TextFormField( 
                controller: controller.email,
                decoration: const InputDecoration(
                  prefixIcon: Icon(IconlyBroken.message),
                  labelText: email,
                  hintText: email,
                  border: OutlineInputBorder()
                ),
              ),
              const SizedBox(height: formHeight,),
              TextFormField( 
                controller: controller.password,
                decoration: const InputDecoration(
                  prefixIcon: Icon(IconlyBroken.password),
                  labelText: password,
                  hintText: password,
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: null, 
                    icon: Icon(IconlyBroken.show)),
                ),
              ),
              const SizedBox(height: formHeight,),
              TextFormField( 
                controller: controller.repeatPassword,
                decoration: const InputDecoration(
                  prefixIcon: Icon(IconlyBroken.password),
                  labelText: repeatThePassword,
                  hintText: repeatThePassword,
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: null, 
                    icon: Icon(IconlyBroken.show)),
                ),
              ),
              const SizedBox(height: formHeight,),
              const SizedBox(height: formHeight,),
              SizedBox(
                height: buttonSizeHeight,
                width: double.infinity,
                child: FilledButtonWidget(
                  title: signUp,
                  onPressed: () {
                    if(formKey.currentState!.validate()) {
                    // final user = UserModel(
                    //   email: controller.email.text.trim(),
                    //   password: controller.password.text.trim(),
                    //   fullName: controller.name.text.trim(),
                    // );
                      controller.createUser();
                    //SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());

                    }
                  },
                  )
              )
            ],
          ),
        ),
    );
  }
} 