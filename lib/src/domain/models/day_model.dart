import 'package:cloud_firestore/cloud_firestore.dart';

class DayModel {
  String email;
  int repeatLast;
  int newLast;
  int newDone;
  int today;
  int overall;
  Timestamp date;

  DayModel({
      required this.email,
      required this.repeatLast,
      required this.newLast,
      required this.newDone,
      required this.today,
      required this.overall,
      required this.date});

  toJson() {
    return {
      "Email": email,
      "RepeatLast": repeatLast,
      "NewLast": newLast,
      "NewDone": newDone,
      "Today": today,
      'Overall': overall,
      'Date': date,
    };
  }

  factory DayModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return DayModel(
      email: data['Email'],
      repeatLast: data["RepeatLast"],
      newLast: data["NewLast"],
      newDone: data["NewDone"],
      today: data["Today"],
      overall: data["Overall"],
      date: data["Date"],
    );
  }
}
