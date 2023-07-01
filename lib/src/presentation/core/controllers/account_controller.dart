// ignore_for_file: avoid_print, invalid_use_of_protected_member
import 'package:a_few_words/src/domain/models/day_model.dart';
import 'package:a_few_words/src/domain/models/sentence_model.dart';
import 'package:a_few_words/src/domain/models/user_model.dart';
import 'package:a_few_words/src/domain/repositories/authentication_repository/authentication_repository.dart';
import 'package:a_few_words/src/domain/repositories/core_repository/day_repository.dart';
import 'package:a_few_words/src/domain/repositories/core_repository/sentence_repository.dart';
import 'package:a_few_words/src/domain/repositories/user_repository/user_repository.dart';
import 'package:a_few_words/src/presentation/authentication/controllers/signup_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  static AccountController get intance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final repeatPassword = TextEditingController();
  final RxBool _obscureTextPassword = true.obs;
  final RxBool _obscureTextRepeatPassword = true.obs;

  get obscureTextPassword => _obscureTextPassword.value;
  get obscureTextRepeatPassword => _obscureTextRepeatPassword.value;
  final RxString nameString = ''.obs;
  final RxString emailString = ''.obs;
  late final UserModel user;

  final GetStorage _storage = GetStorage();
  late Rx<UserModel> _currentUser;
  UserModel get currentUser => _currentUser.value;
  late DayModel yesterday;
  var storedUser;

  Future<UserModel> getNameEmail() async{
    final email = _authRepo.firebaseUser.value?.email;
    user = await _userRepo.getUserDetails(email!);
    nameString.value = user.fullName;
    emailString.value = user.email;
    return user;
  }
  @override

  void onReady() {
    getNameEmail();
    updateUser();
    readUser();
    Future.delayed(const Duration(seconds: 3));
    super.onInit();
  }

  switchPassword() {
    if (_obscureTextPassword.value) {
      _obscureTextPassword.value = false;
    } else {
      _obscureTextPassword.value = true;
    }
  }

  switchRepeatPassword() {
    if (_obscureTextRepeatPassword.value) {
      _obscureTextRepeatPassword.value = false;
    } else {
      _obscureTextRepeatPassword.value = true;
    }
  }

  checkPasswords() {
    if (password.text.trim() != repeatPassword.text.trim()) {
      Get.snackbar('Try again', 'The passwords are not matching');
    } else {
      updateUser();
    }
  }

  void notificationDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('Notification'),
        content: const Text('Would you like to turn of the notification'),
        actions: [
          TextButton(
            child: const Text("Close"),
            onPressed: () => Get.back(),
          ),
        ],
      ),
    );
  }

  Future<UserModel> getUser() async {
    final email = _authRepo.firebaseUser.value?.email;
    _currentUser.value = await _userRepo.getUserDetails(email!) as UserModel;
    String keyUser = 'User_$email';
    _storage.write(keyUser, _currentUser);
    return _currentUser.value;
  }

  Future<void> updateUser() async {
    //final email = _authRepo.firebaseUser.value?.email;
    final user = UserModel(
      email: email.text.trim(),
      password: password.text.trim(),
      fullName: name.text.trim(),
      enteredOn: Timestamp.now(),
    );
    await _userRepo.updateUserRecord(user);
  }

  Future<UserModel> readUser() async {
    final email = _authRepo.firebaseUser.value?.email;
    String keyUser = 'User_$email';
    if (_currentUser.value.email != email!) {
      _currentUser = _storage.read(keyUser);
    } else {
      getUser();
    }
    return _currentUser.value;
  }
}
