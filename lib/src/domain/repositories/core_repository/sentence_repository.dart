import 'package:a_few_words/src/domain/models/sentence_model.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SentenceRepository extends GetxController {
  static SentenceRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createSentence(SentenceModel sentence) async {
    await _db.collection('Sentences').add(sentence.toJson()).whenComplete(() {
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

  updateSentence(SentenceModel sentence) async {
    await _db
        .collection('Users')
        .doc(email)
        //.where("Email", isEqualTo: email)
        .collection('UserSentences')
        .add(sentence.toJson());
  }

  Future<List<SentenceModel>> getNextListSentences(int id) async {
    final listOfId = [];
    for (int i = id; i < id + 3; i++) {
      listOfId.add(i);
    }
    final snapshot = await _db
        .collection("Sentences")
        .where("id", whereIn: listOfId)
        .limit(5)
        .get();
    final sentenceData =
        snapshot.docs.map((e) => SentenceModel.fromSnapshot(e)).toList();
    return sentenceData;
  }

  Future<SentenceModel> getSentenceDetails(String keyWord) async {
    final snapshot = await _db
        .collection("Sentences")
        .where("KeyWord", isEqualTo: keyWord)
        .get();
    final sentenceData =
        snapshot.docs.map((e) => SentenceModel.fromSnapshot(e)).single;
    return sentenceData;
  }

  Future<List<SentenceModel>> allSentences() async {
    final snapshot = await _db.collection("Sentences").where("KeyWord").get();
    final sentenceData =
        snapshot.docs.map((e) => SentenceModel.fromSnapshot(e)).toList();
    return sentenceData;
  }
}
