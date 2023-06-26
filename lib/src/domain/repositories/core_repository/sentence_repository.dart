import 'package:a_few_words/src/domain/models/sentence_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SentenceRepository extends GetxController {
  static SentenceRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createSentence(SentenceModel user) async {
    await _db.collection('Sentences').add(user.toJson()).whenComplete(() {
      Get.snackbar(
        "Success",
        "Your account has been created",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
      );
    }).catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }

  Future<SentenceModel> getSentenceDetails(String keyWord) async {
    final snapshot = await _db.collection("Sentences").where("KeyWord", isEqualTo: keyWord).get();
    final sentenceData = snapshot.docs.map((e) => SentenceModel.fromSnapshot(e)).single; 
    return sentenceData;
  }
  
  Future<List<SentenceModel>> allSentences() async {
    final snapshot = await _db.collection("Sentences").where("KeyWord").get();
    final sentenceData = snapshot.docs.map((e) => SentenceModel.fromSnapshot(e)).toList(); 
    return sentenceData;
  }

}
