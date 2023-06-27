import 'package:a_few_words/src/domain/repositories/authentication_repository/authentication_repository.dart';
import 'package:a_few_words/src/domain/repositories/core_repository/sentence_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlashcardsController extends GetxController {
  static FlashcardsController get intance => Get.find();

  final _auth = Get.put(AuthenticationRepository());
  final _sentence = Get.put(SentenceRepository());
  final word = TextEditingController();
  Rx<int> counter = 0.obs;

  checkWord(String keyWord) {
    if(keyWord == word){

    }
  }

  getAllSentences() {
    final email = _auth.firebaseUser.value?.email;
    if (email != null) {
      return _sentence.allSentences();
    } else {
      Get.snackbar('Error', 'Login to continue');
    }
  }

  getNextTenSentences(int id){
    final email = _auth.firebaseUser.value?.email;
    if (email != null) {
      return _sentence.getNextListSentences(id);
    } else {
      Get.snackbar('Error', 'Login to continue');
    }
  }
  
}