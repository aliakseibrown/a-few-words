import 'package:a_few_words/src/domain/repositories/authentication_repository/authentication_repository.dart';
import 'package:a_few_words/src/domain/repositories/user_repository/user_repository.dart';
import 'package:a_few_words/src/domain/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final userRepo = Get.put(UserRepository());
// final authenticationRepository = Get.put(AuthenticationRepository());

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final repeatPassword = TextEditingController();
  final name = TextEditingController();
  final RxBool _obscureTextPassword = true.obs;
  final RxBool _obscureTextRepeatPassword = true.obs;

  get obscureTextPassword => _obscureTextPassword.value;
  get obscureTextRepeatPassword => _obscureTextRepeatPassword.value;

  switchPassword() {
    if (_obscureTextPassword.value) {
      _obscureTextPassword.value = false;
    }else {_obscureTextPassword.value = true;}
  }

  switchRepeatPassword() {
    if (_obscureTextRepeatPassword.value) {
      _obscureTextRepeatPassword.value = false;
    }else {
      _obscureTextRepeatPassword.value = true;
    }
  }
  checkPasswords(){
    if(password.text.trim() != repeatPassword.text.trim()){
      Get.snackbar('Try again', 'The passwords are not matching');
    }else{
      createUser();
    }
  }

  Future<void> createUser() async {
    final auth = AuthenticationRepository.instance;
    final user = UserModel(
      email: email.text.trim(),
      password: password.text.trim(),
      fullName: name.text.trim(),
      enteredOn: Timestamp.now(),
      createdOn: Timestamp.now(),
    );

    //final uid = auth.firebaseUser.value?.uid;
    await auth.createUserWithEmailAndPassword(user.email, user.password);
    userRepo.createUser(user);
    //auth.setInitialPage(auth.firebaseUser.value);
  }
}
