// ignore_for_file: avoid_print, invalid_use_of_protected_member
import 'package:a_few_words/src/domain/models/day_model.dart';
import 'package:a_few_words/src/domain/models/sentence_model.dart';
import 'package:a_few_words/src/domain/repositories/authentication_repository/authentication_repository.dart';
import 'package:a_few_words/src/domain/repositories/core_repository/day_repository.dart';
import 'package:a_few_words/src/domain/repositories/core_repository/sentence_repository.dart';
import 'package:a_few_words/src/utils/constants/text_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class FlashcardsController extends GetxController {
  static FlashcardsController get intance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _sentenceRepo = Get.put(SentenceRepository());
  final _dayRepo = Get.put(DayRepository());

  final word = TextEditingController();

  final GetStorage _storage = GetStorage();
  final sentencesList = <SentenceModel>[].obs;
  final _forgottenList = <SentenceModel>[].obs;
  final _newList = <SentenceModel>[].obs;
  final _activeList = <SentenceModel>[].obs;
  final dailyMax = 10;

  List<SentenceModel> get forgottenList => _forgottenList;
  List<SentenceModel> get newList => _newList;
  List<SentenceModel> get activeList => _activeList;

  Rx<int> index = 0.obs;
  Rx<int> newIndex = 0.obs;
  Rx<int> overall = 0.obs;
  Rx<int> _lastNewID = 1.obs;
  String keyNewID = 'lastNewID';
  late DayModel yesterday;
  var storedForgotten;
  var storedNew;

  @override
  void onReady() {
    if(overall.value == 0) {
      getYesterday();
    }
    index.value = 0;
    if (_lastNewID.value == 0) {
      _lastNewID.value = _storage.read(keyNewID);
    }
    Future.delayed(const Duration(seconds: 3));
    super.onInit();
    getNewSentences();
    //_activeList.value  = getNewSentences() as List<SentenceModel>;
    //getActiveSentences();
    // _forgottenList = getForgottenSentences();
    // _newList = getNewSentences();
    // _activeList = getActiveSentences();
  }

  checkWord(String keyWord) {
    print(keyWord);
    print(word.text);
    print(index);
    if (word.text == keyWord) {
      if (index.value < newList.length) {
        uploadUserSentence();
        overall.value = overall.value + index.value;
        uploadDay();
        word.clear();
        index.value++;
        _lastNewID.value++;
        _storage.write(keyNewID, _lastNewID.value);
      } else {
        index.value = 0;
        getActiveSentences();
        Get.snackbar("Good", "See you tomorrow");
      }
      print(index.value);
    }else{
      Get.snackbar("Try again", "The word is incorrect");
    }
  }

  Future<void> uploadUserSentence() async {
    //10 minutes, 1 hour, 1 day, 5 days, 25 days, 60 days
    final email = _authRepo.firebaseUser.value?.email;
    SentenceModel sentence = _activeList[index.value];
    // SentenceModel userSentence = SentenceModel(
    //     id: sentence.id,
    //     keyWord: sentence.keyWord,
    //     keyWordTranslation: sentence.keyWordTranslation,
    //     fullSentence: sentence.fullSentence,
    //     translation: sentence.translation,
    //     firstPart: sentence.firstPart,
    //     secondPart: sentence.secondPart,
    //     thirdPart: sentence.thirdPart,
    //     times: sentence.times,
    //     openedOn: sentence.openedOn);

    if (email != null) {
      if (sentence.times == 5) {
        var now = DateTime.now().add(const Duration(days: 60));
        sentence.openedOn = Timestamp.fromDate(now);
      } else if (sentence.times == 4) {
        sentence.times = 5;
        var now = DateTime.now().add(const Duration(days: 25));
        sentence.openedOn = Timestamp.fromDate(now);
      } else if (sentence.times == 3) {
        sentence.times = 4;
        var now = DateTime.now().add(const Duration(days: 5));
        sentence.openedOn = Timestamp.fromDate(now);
      } else if (sentence.times == 2) {
        sentence.times = 3;
        var now = DateTime.now().add(const Duration(days: 1));
        sentence.openedOn = Timestamp.fromDate(now);
      } else if (sentence.times == 1) {
        sentence.times = 2;
        var now = DateTime.now().add(const Duration(hours: 1));
        sentence.openedOn = Timestamp.fromDate(now);
      } else if (sentence.times == 0) {
        sentence.times = 1;
        var now = DateTime.now().add(const Duration(minutes: 1));
        sentence.openedOn = Timestamp.fromDate(now);
      }
      _sentenceRepo.updateUserSentence(sentence, email);
    }
  }

  Future<List<SentenceModel>> getForgottenSentences() async {
    final email = _authRepo.firebaseUser.value?.email;
    final key = 'sentencesUser_forgottenList_$email';
    sentencesList.value = await _sentenceRepo.getForgottenSentences(email!);
    // if (sentencesList.isNotEmpty) {
    //   _storage.write(key, sentencesList.value);
    // }
    // _forgottenList.value = _storage.read(key);
    _forgottenList.value = sentencesList.value;
    return _forgottenList.value;
  }

  Future<List<SentenceModel>> getNewSentences() async {
    final email = _authRepo.firebaseUser.value?.email;
    final key = 'sentences_newList_$email';
    sentencesList.value = await _sentenceRepo.getNewSentences(0, 10);
    // if (sentencesList.isNotEmpty) {
    //   _storage.write(key, sentencesList.value);
    // }
    // _newList.value = _storage.read(key);
    _newList.value = sentencesList.value;
    return _newList.value;
  }

  Future<List<SentenceModel>> getActiveSentences() async {
    index.value = 0;
    getForgottenSentences();
    if (_forgottenList.value != []) {
      print('_forgottenList is NOT EMPTY');
      _activeList.value = _forgottenList;
    } else {
      getNewSentences();
      print('_forgottenList is EMPTY');
      _activeList.value = _newList;
    }
    return _activeList;
  }

  Future<void> getYesterday() async{
    final email = _authRepo.firebaseUser.value?.email;
     yesterday = await  _dayRepo.getYesterday(email!);
     overall.value = yesterday.overall;
  }

  Future<void> uploadDay() async {
    final email = _authRepo.firebaseUser.value?.email;
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    Timestamp myTimeStamp = Timestamp.fromDate(date);

    final day = DayModel(
        email: email!,
        repeatLast: _lastNewID.value,
        newLast: 0,
        newDone: 0,
        today: index.value,
        overall: overall.value,
        date: myTimeStamp);
        
    await _dayRepo.updateDay(day, email);
    //auth.setInitialPage(auth.firebaseUser.value);
  }
}
