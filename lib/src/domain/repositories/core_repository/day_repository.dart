// ignore_for_file: avoid_print
import 'package:a_few_words/src/domain/models/day_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DayRepository extends GetxController {
  static DayRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  updateDay(DayModel day, String email) async {
    await _db
        .collection('Users')
        .doc(email)
        .collection('UserCalendar')
        .doc(day.date.toString())
        .set(day.toJson());
  }

  Future<List<DayModel>> getLastWeek(int id) async {
    final listOfId = [];
    for (int i = id; i < id + 3; i++) {
      listOfId.add(i);
    }
    final snapshot = await _db
        .collection("Sentences")
        .where("id", whereIn: listOfId)
        .limit(5)
        .get();
    final dayData = snapshot.docs.map((e) => DayModel.fromSnapshot(e)).toList();
    return dayData;
  }

  Future<DayModel> getDayDetails(Timestamp date, String email) async {
    final snapshot = await _db
        .collection('Users')
        .doc(email)
        .collection('UserCalendar')
        .where("Date", isEqualTo: date)
        .get();
    final dayData = snapshot.docs.map((e) => DayModel.fromSnapshot(e)).single;
    return dayData;
  }

  Future<List<DayModel>> allDays(String email) async {
    final snapshot = await _db
        .collection('Users')
        .doc(email)
        .collection('UserCalendar')
        .where("Date")
        .get();
    final dayData = snapshot.docs.map((e) => DayModel.fromSnapshot(e)).toList();
    return dayData;
  }
}
