import 'package:a_few_words/src/domain/models/day_model.dart';
import 'package:a_few_words/src/domain/models/user_model.dart';
import 'package:a_few_words/src/domain/repositories/authentication_repository/authentication_repository.dart';
import 'package:a_few_words/src/domain/repositories/core_repository/day_repository.dart';
import 'package:a_few_words/src/domain/repositories/core_repository/sentence_repository.dart';
import 'package:a_few_words/src/domain/repositories/user_repository/user_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

//10 minutes, 1 hour, 1 day, 5 days, 25 days

class DashboardController extends GetxController {
  static DashboardController get intance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _dayRepo = Get.put(DayRepository());
  final _userRepo = Get.put(UserRepository());
  final GetStorage _storage = GetStorage();
  final daysList = <DayModel>[].obs;
  final RxString name = ''.obs;
  final RxInt todayCards = 0.obs;
  final RxInt overallCards = 0.obs;
  late DayModel today;

  late final UserModel user;

  final now = DateTime.now();
  //String formatter = DateFormat('yMd').format(now);

  @override
  void onInit() {
    getName();
    Future.delayed(const Duration(seconds: 3));
    super.onInit();
    getToday();
    // _forgottenList = getForgottenSentences();
    // _newList = getNewSentences();
    // _activeList = getActiveSentences();
  }

  Future<UserModel> getName() async{
    final email = _authRepo.firebaseUser.value?.email;
    user = await _userRepo.getUserDetails(email!);
    name.value = user.fullName;
    return user;
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

  Future<DayModel> getToday() async{
    final email = _authRepo.firebaseUser.value?.email;
    today = await _dayRepo.getToday(email!);
    todayCards.value = today.today;
    overallCards.value = today.overall;
    return today;
  }
}
