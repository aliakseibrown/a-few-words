import 'package:a_few_words/src/presentation/core/controllers/account_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
final controller = Get.put(AccountController());
class Setting {
  final String title;
  final String route;
  final IconData icon;
  final onTap;

  Setting({
    required this.title,
    required this.route,
    required this.icon,
    required this.onTap,
  });
  
}

final List<Setting> settings = [
    Setting(
    title: "Notification",
    route: "/",
    onTap: controller.notificationDialog,
    icon: CupertinoIcons.bell,
    ),
    Setting(
    title: "Personal Data",
    route: "/",
    onTap: () {},
    icon: CupertinoIcons.person,
    ),
];