// ignore_for_file: avoid_print

import 'package:a_few_words/src/domain/models/sentence_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SentenceRepository extends GetxController {
  static SentenceRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  //User database of sentences
  updateUserSentence(SentenceModel sentence, String email) async {
    await _db
        .collection('Users')
        .doc(email)
        .collection('UserSentences')
        .doc(sentence.keyWord)
        .set(sentence.toJson());
  }
  //await _db.collection("Users").doc(user.email).update(user.toJson());

  Future<SentenceModel> getSentenceDetails(String keyWord, String email) async {
    final snapshot = await _db
        .collection('Users')
        .doc(email)
        .collection('UserSentences')
        .where("KeyWord", isEqualTo: keyWord)
        .get();
    final sentenceData =
        snapshot.docs.map((e) => SentenceModel.fromSnapshot(e)).single;
    return sentenceData;
  }

//DateTime.parse(timestamp.toDate().toString())
//FieldValue.serverTimestamp(),
  Future<List<SentenceModel>> getForgottenSentences(String email) async {
    final Timestamp now = Timestamp.fromDate(DateTime.now());
    final snapshot = await _db
        .collection('Users')
        .doc(email)
        .collection('UserSentences')
        .where("OpenedOn", isLessThan: now)
        .get();
    final sentenceData =
        snapshot.docs.map((e) => SentenceModel.fromSnapshot(e)).toList();
    return sentenceData;
  }

  Future<List<SentenceModel>> getUserSentences(String email) async {
    final snapshot = await _db
        .collection('Users')
        .doc(email)
        .collection('UserSentences')
        .where("KeyWord")
        .get();
    final sentenceData =
        snapshot.docs.map((e) => SentenceModel.fromSnapshot(e)).toList();
    return sentenceData;
  }

  //Application database of sentences


  Future<List<SentenceModel>> allSentences() async {
    final snapshot = await _db.collection("Sentences").where("KeyWord").get();
    final sentenceData =
        snapshot.docs.map((e) => SentenceModel.fromSnapshot(e)).toList();
    return sentenceData;
  }

  Future<List<SentenceModel>> getNewSentences(id, daylyLimit) async {
    final listOfId = [];
    for (int i = id; i < id + daylyLimit; i++) {
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

  createSentence(SentenceModel sentence) async {
    await _db.collection('Sentences').add(sentence.toJson()).whenComplete(() {
      Get.snackbar(
        "Success",
        "Your sentence has been created",
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

}
