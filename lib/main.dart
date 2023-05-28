import 'package:a_few_words/src/config/router/app_router.dart';
import 'package:a_few_words/src/config/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



// Future<void> main() async{
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
// }

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.light,
      initialRoute: '/welcome',
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 300),
      getPages: AppRouter,
    );
  }
}
