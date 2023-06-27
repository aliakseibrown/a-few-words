import 'package:a_few_words/src/domain/models/sentence_model.dart';
import 'package:a_few_words/src/domain/repositories/authentication_repository/authentication_repository.dart';
import 'package:a_few_words/src/domain/repositories/core_repository/sentence_repository.dart';
import 'package:get/get.dart';

class ReviewController extends GetxController {
  static ReviewController get intance => Get.find();

  final _auth = Get.put(AuthenticationRepository());
  final _sentence = Get.put(SentenceRepository());

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
  
  createTestRepository() {
    final sentence = SentenceModel(
      id: 1,
      keyWord: 'Apple',
      fullSentence: 'fullSentence',
      translation: 'translation',
      firstPart: 'firstPart',
      secondPart: 'secondPart',
      thirdPart: 'thirdPart',
      times: 1,
      lastdate: 'lastdate',
    );
    _sentence.createSentence(sentence);
    final sentence2 = SentenceModel(
      id: 2,
      keyWord: 'Pear',
      fullSentence: 'fullSentence',
      translation: 'translation',
      firstPart: 'firstPart',
      secondPart: 'secondPart',
      thirdPart: 'thirdPart',
      times: 3,
      lastdate: 'lastdate',
    );
    _sentence.createSentence(sentence2);
    final sentence3 = SentenceModel(
      id: 3,
      keyWord: 'make',
      fullSentence: 'fullSentence',
      translation: 'translation',
      firstPart: 'firstPart',
      secondPart: 'secondPart',
      thirdPart: 'thirdPart',
      times: 5,
      lastdate: 'lastdate',
    );
    _sentence.createSentence(sentence3);
  }
}
