import 'package:a_few_words/src/domain/repositories/authentication_repository/authentication_repository.dart';
import 'package:a_few_words/src/domain/repositories/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final userRepo = Get.put(UserRepository());

class LoginController extends GetxController {
  static LoginController get instance =>  Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  
  void emailAuthetication(String email, String password) {
    String? error = AuthenticationRepository.instance.loginWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString(),));
    }
  }
}

