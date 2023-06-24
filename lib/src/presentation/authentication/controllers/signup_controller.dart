import 'package:a_few_words/src/domain/repositories/authentication_repository/authentication_repository.dart';
import 'package:a_few_words/src/domain/repositories/user_repository/user_repository.dart';
import 'package:a_few_words/src/presentation/authentication/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final userRepo = Get.put(UserRepository());
// final authenticationRepository = Get.put(AuthenticationRepository());

class SignUpController extends GetxController {
  static SignUpController get instance =>  Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final repeatPassword = TextEditingController();
  final name = TextEditingController();

  void registerUser(String email, String password) {
    String? error = AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString(),));
    }
  }

  Future<void> createUser(UserModel user ) async {
    await userRepo.createUser(user);
    registerUser(user.email, user.password);
    emailAuthetication(user.email, user.password);
    //phoneAuthetication(user.phone);
  }

  void emailAuthetication(String email, String password) {
    String? error = AuthenticationRepository.instance.loginWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString(),));
    }
  }
}

