import 'package:a_few_words/src/domain/repositories/core_repository/sentence_repository.dart';
import 'package:a_few_words/src/presentation/core/controllers/review_controller.dart';
import 'package:get/get.dart';

import 'src/domain/repositories/authentication_repository/authentication_repository.dart';

class AuthenticationBindings implements Bindings {
  @override
  void dependencies() {
    //Get.lazyPut<CounterController>(() => CounterController());
  }
}

class SettingsBindings implements Bindings {
  @override
  void dependencies() {
    //Get.lazyPut<CounterController>(() => CounterController());
  }
}

class ReviewBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewController>(() => ReviewController());
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
    Get.lazyPut<SentenceRepository>(() => SentenceRepository());
  }
}