// ignore_for_file: avoid_print
import 'package:a_few_words/src/domain/models/day_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DayRepository extends GetxController {
  static DayRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  updateDay(DayModel day, String email) async {
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    await _db
        .collection('Users')
        .doc(email)
        .collection('UserCalendar')
        .doc(date.toString())
        .set(day.toJson());
  }

  Future<List<DayModel>> getLastWeek(String email) async {
    final snapshot = await _db
        .collection("Users")
        .doc(email)
        .collection('UserCalendar')
        .limit(7)
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
  Future<DayModel> getToday(String email) async {
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    Timestamp today = Timestamp.fromDate(date);
    final snapshot = await _db
        .collection('Users')
        .doc(email)
        .collection('UserCalendar')
        .where("Date", isEqualTo: today)
        .get();
    final dayData = snapshot.docs.map((e) => DayModel.fromSnapshot(e)).single;
    return dayData;
  }

  Future<DayModel> getYesterday(String email) async {
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    var yesteday = date.subtract(Duration(days: 1));
    Timestamp myTimeStamp = Timestamp.fromDate(yesteday);
    final snapshot = await _db
        .collection('Users')
        .doc(email)
        .collection('UserCalendar')
        .where("Date", isEqualTo: myTimeStamp)
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
