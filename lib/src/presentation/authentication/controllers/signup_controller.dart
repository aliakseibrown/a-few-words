import 'package:a_few_words/src/domain/repositories/authentication_repository/authentication_repository.dart';
import 'package:a_few_words/src/domain/repositories/user_repository/user_repository.dart';
import 'package:a_few_words/src/domain/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//final userRepo = Get.put(UserRepository());
// final authenticationRepository = Get.put(AuthenticationRepository());

class SignUpController extends GetxController {
  static SignUpController get instance =>  Get.find();


  final email = TextEditingController();
  final password = TextEditingController();
  final repeatPassword = TextEditingController();
  final name = TextEditingController();

  Future<void> createUser() async {
    final user = UserModel(
      email: email.text.trim(),
      password: password.text.trim(),
      fullName: name.text.trim(),
    );

    final auth = AuthenticationRepository.instance;
    await auth.createUserWithEmailAndPassword(user.email, user.password);
    await UserRepository.instance.createUser(user);
    auth.setInitialPage(auth.firebaseUser.value);
  }
}


