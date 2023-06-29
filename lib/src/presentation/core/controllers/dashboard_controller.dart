import 'package:a_few_words/src/domain/models/day_model.dart';
import 'package:a_few_words/src/domain/repositories/authentication_repository/authentication_repository.dart';
import 'package:a_few_words/src/domain/repositories/core_repository/day_repository.dart';
import 'package:a_few_words/src/domain/repositories/core_repository/sentence_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

//10 minutes, 1 hour, 1 day, 5 days, 25 days

class DashboardController extends GetxController {
  static DashboardController get intance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _dayRepo = Get.put(DayRepository());
  final GetStorage _storage = GetStorage();
  final daysList = <DayModel>[].obs;

  final now = DateTime.now();
  //String formatter = DateFormat('yMd').format(now);

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3));
    super.onInit();
    // _forgottenList = getForgottenSentences();
    // _newList = getNewSentences();
    // _activeList = getActiveSentences();
  }

  Future<List<DayModel>> getLastWeek() async {
    final email = _authRepo.firebaseUser.value?.email;
    final key = 'sentencesUser_calendar_$email';
    daysList.value = await _dayRepo.getLastWeek(email!);
    if (daysList.isNotEmpty) {
      _storage.write(key, daysList.value);
    }
    daysList.value = _storage.read(key);
    return daysList.value;
  }

  getTodayDay() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      //return _day.getDayDetails(today);
    } else {
      Get.snackbar('Error', 'Login to continue');
    }
  }
}
