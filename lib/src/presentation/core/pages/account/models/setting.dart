import 'package:flutter/cupertino.dart';

class Setting {
  final String title;
  final String route;
  final IconData icon;

  Setting({
    required this.title,
    required this.route,
    required this.icon,
  });
}

final List<Setting> settings = [
  Setting(
    title: "Change Password",
    route: "/",
    icon: CupertinoIcons.lock,
    ),
    Setting(
    title: "Notification",
    route: "/",
    icon: CupertinoIcons.bell,
    ),
    Setting(
    title: "Personal Data",
    route: "/",
    icon: CupertinoIcons.person,
    ),
];