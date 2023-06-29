import 'package:a_few_words/src/domain/repositories/authentication_repository/authentication_repository.dart';
import 'package:a_few_words/src/domain/repositories/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final userRepo = Get.put(UserRepository());

class LoginController extends GetxController {
  static LoginController get instance =>  Get.find();


  final showPassword = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  
  void login() async {
    final auth = AuthenticationRepository.instance;
    await auth.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
    //auth.setInitialPage(auth.firebaseUser.value);
  }
}

