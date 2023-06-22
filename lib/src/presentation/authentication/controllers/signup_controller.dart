import 'package:a_few_words/src/domain/repositories/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance =>  Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final repeatPassword = TextEditingController();
  final name = TextEditingController();

  void registerUser(String email, String password) {
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
  }

}