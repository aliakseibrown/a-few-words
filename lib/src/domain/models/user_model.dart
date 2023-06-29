import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String password;
  final Timestamp enteredOn;
  final Timestamp? createdOn;

  const UserModel({
    this.id,
    required this.email,
    required this.password,
    required this.fullName,
    required this.enteredOn,
    this.createdOn,
  });

  toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "Password": password,
      'EnteredOn': enteredOn,
      'CreatedOn': createdOn,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        id: document.id,
        fullName: data["FullName"],
        email: data["Email"],
        password: data["Password"],
        enteredOn: data['EnteredOn'],
        createdOn: data['CreatedOn']);

  }
}
