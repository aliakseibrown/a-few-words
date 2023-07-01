import 'package:a_few_words/src/domain/models/sentence_model.dart';
import 'package:a_few_words/src/domain/repositories/authentication_repository/authentication_repository.dart';
import 'package:a_few_words/src/domain/repositories/core_repository/sentence_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class ReviewController extends GetxController {
  //static ReviewController get intance => Get.find();

  final _auth = Get.put(AuthenticationRepository());
  final _sentence = Get.put(SentenceRepository());

  final GetStorage _storage = GetStorage();
  final sentencesList = <SentenceModel>[].obs;
  var _userList = <SentenceModel>[].obs;

  List<SentenceModel> get userList => _userList;
  
  //get sentencesList => _sentencesList;

  Future<String?> getEmail() async {
    var user = await _auth.firebaseUser.value?.email;
    return user;
  }

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 6));
    //sentencesList.bindStream(allSentences());
    //getAllSentences();
    getUserSentences();
    super.onInit();
  }

  Future<List<SentenceModel>> toStorage() async {
    
    return sentencesList;
  }

  Future<List<SentenceModel>> getAllSentences() async {
    sentencesList.value = await _sentence.allSentences();
    return sentencesList;
  }

  Future<List<SentenceModel>> getUserSentences() async {
    final email = _auth.firebaseUser.value?.email;
    final key = 'sentences_userList_$email';
    sentencesList.value = await _sentence.getUserSentences(email!);
    if(sentencesList.isNotEmpty) {
      _storage.write(key, sentencesList.value);
    }
    _userList.value = _storage.read(key);
    return _userList.value;
  } 



  createTestRepository() {
    final sentence = SentenceModel(
      id: 15,
      keyWord: 'shirt',
      keyWordTranslation: "bluzka",
      fullSentence: 'Okay, take the shirt off, honey.',
      translation: 'Okay, zdejmnij bluzkę, kochanie.',
      firstPart: 'Okay, take the',
      secondPart: ' ',
      thirdPart: 'off, honey.',
      times: 0,
      openedOn: Timestamp.now(),
    );
    _sentence.createSentence(sentence);
    final sentence2 = SentenceModel(
      id: 16,
      keyWord: 'hire',
      keyWordTranslation: "wynająć",
      fullSentence: 'Someone decided to hire in-town shooters.',
      translation: 'Ktoś zdecydował, aby wynająć morderców z miasta.',
      firstPart: 'Someone decided to',
      secondPart: ' ',
      thirdPart: 'in-town shooters.',
      times: 0,
      openedOn: Timestamp.now(),
    );
    _sentence.createSentence(sentence2);
    final sentence3 = SentenceModel(
      id: 17,
      keyWord: 'bird',
      keyWordTranslation: "ptak",
      fullSentence: 'So you look like a big bird, wonderful.',
      translation: 'Wyglądasz jak wielki ptak, cudownie',
      firstPart: 'So you look like a big',
      secondPart: ' ',
      thirdPart: ', wonderful.',
      times: 0,
      openedOn: Timestamp.now(),
    );
    _sentence.createSentence(sentence3);
    final sentence4 = SentenceModel(
      id: 18,
      keyWord: 'bike',
      keyWordTranslation: "rower",
      fullSentence: 'My first bike had one gear.',
      translation: 'Mój pierwszy rower miał przerzutkę z jednym biegiem.',
      firstPart: 'My first',
      secondPart: ' ',
      thirdPart: 'had one gear.',
      times: 0,
      openedOn: Timestamp.now(),
    );
    _sentence.createSentence(sentence4);
    final sentence5 = SentenceModel(
      id: 19,
      keyWord: 'bet',
      keyWordTranslation: "Założyć (się)",
      fullSentence: 'I bet we got another watcher.',
      translation: 'Założę się, że mamy tu kolejnego obserwatora',
      firstPart: 'I',
      secondPart: ' ',
      thirdPart: 'we got another watcher.',
      times: 0,
      openedOn: Timestamp.now(),
    );
    _sentence.createSentence(sentence5);
    final sentence6 = SentenceModel(
      id: 20,
      keyWord: 'eat',
      keyWordTranslation: "jeść, zjeść",
      fullSentence: 'Shall we eat inside or outside...',
      translation: 'Możemy zjeść na zewnątrz, albo w środku.',
      firstPart: 'Shall we',
      secondPart: ' ',
      thirdPart: 'inside or outside...',
      times: 0,
      openedOn: Timestamp.now(),
    );
    _sentence.createSentence(sentence6);
    final sentence7 = SentenceModel(
      id: 21,
      keyWord: 'count',
      keyWordTranslation: "liczyć (się)",
      fullSentence: 'It can count as my birthday gift.',
      translation: 'To może się liczyć, jako mój prezent urodzinowy.',
      firstPart: 'It can',
      secondPart: ' ',
      thirdPart: 'as my birthday gift.',
      times: 0,
      openedOn: Timestamp.now(),
    );
    _sentence.createSentence(sentence7);
    final sentence8 = SentenceModel(
      id: 22,
      keyWord: 'tree',
      keyWordTranslation: "drzewo",
      fullSentence: 'And then I climbed back up the tree.',
      translation: 'A potem znowu wspiałem się na drzewo.',
      firstPart: 'And then I climbed back up the ',
      secondPart: ' ',
      thirdPart: ' ',
      times: 0,
      openedOn: Timestamp.now(),
    );
    _sentence.createSentence(sentence8);
  }
}
