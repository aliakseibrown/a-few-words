import 'package:cloud_firestore/cloud_firestore.dart';

class SentenceModel {
  final int id;
  final String keyWord;
  final String keyWordTranslation;
  final String fullSentence;
  final String translation;
  final String firstPart;
  final String secondPart;
  final String thirdPart;
  int times;
  Timestamp openedOn;

  SentenceModel({
    required this.id,
    required this.keyWord,
    required this.keyWordTranslation,
    required this.fullSentence,
    required this.translation,
    required this.firstPart,
    required this.secondPart,
    required this.thirdPart,
    required this.times,
    required this.openedOn,
  });
  
  toJson() {
    return{
    "id": id,
    "KeyWord": keyWord,
    "KeyWordTranslation": keyWordTranslation,
    "FullSentence":  fullSentence,
    "Translation": translation,
    "FirstPart": firstPart,
    "SecondPart": secondPart,
    "ThirdPart": thirdPart,
    "Times": times,
    "OpenedOn": openedOn,
    };
  }

factory SentenceModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return SentenceModel(
      id: data['id'],
      fullSentence: data["FullSentence"],
      keyWord: data["KeyWord"],
      keyWordTranslation: data["KeyWordTranslation"],
      translation: data["Translation"],
      firstPart: data["FirstPart"],
      secondPart: data["SecondPart"],
      thirdPart: data["ThirdPart"],
      times: data["Times"],
      openedOn: data["OpenedOn"],
    );
  }

}

  List<SentenceModel> sentences = [];
  //   Sentence(
  //       word: 'shoping',
  //       translation: 'kupować',
  //       sentence: 'I go shoping',
  //       opened: '18.06.2023'),
  //   Sentence(
  //       word: 'win',
  //       translation: 'wygrać',
  //       sentence: 'I will win this game',
  //       opened: '12.06.2023'),
  //     Sentence(
  //       word: 'win',
  //       translation: 'wygrać',
  //       sentence: 'I will win this game',
  //       opened: '12.06.2023'),
  //     Sentence(
  //       word: 'win',
  //       translation: 'wygrać',
  //       sentence: 'I will win this game',
  //       opened: '12.06.2023'),
  // ];

  List<SentenceModel> getSentenceList() {
    return sentences;
  }