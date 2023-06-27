import 'package:cloud_firestore/cloud_firestore.dart';

class SentenceModel {
  final int id;
  final String keyWord;
  final String fullSentence;
  final String translation;
  final String firstPart;
  final String secondPart;
  final String thirdPart;
  final int times;
  final String lastdate;

  SentenceModel({
    required this.id,
    required this.keyWord,
    required this.fullSentence,
    required this.translation,
    required this.firstPart,
    required this.secondPart,
    required this.thirdPart,
    required this.times,
    required this.lastdate,
  });
  
  toJson() {
    return{
    "id": id,
    "KeyWord": keyWord,
    "FullSentence":  fullSentence,
    "Translation": translation,
    "FirstPart": firstPart,
    "SecondPart": secondPart,
    "ThirdPart": thirdPart,
    "Times": times,
    "LastDate": lastdate,
    };
  }

factory SentenceModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return SentenceModel(
      id: data['id'],
      fullSentence: data["FullSentence"],
      keyWord: data["KeyWord"],
      translation: data["Translation"],
      firstPart: data["FirstPart"],
      secondPart: data["SecondPart"],
      thirdPart: data["ThirdPart"],
      times: data["Times"],
      lastdate: data["LastDate"],
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