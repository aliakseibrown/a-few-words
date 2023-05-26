import 'package:a_few_words/src/config/themes/app_themes.dart';
import 'package:a_few_words/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import 'src/config/router/app_router.dart';
import 'src/presentation/authentication/screens/login/login_page.dart';
import 'src/presentation/authentication/screens/welcome/welcome_page.dart';
import 'src/presentation/authentication/screens/signup/signup_page.dart';
import 'src/presentation/authenticationView.dart';
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.light,
      initialRoute: '/welcome',
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 200),
      getPages: [ //transfer to a appRoute
        GetPage(
          name: '/welcome',
          page: () => WelcomePage(),
          //binding: AuthenticationBindings(),
        ),
        GetPage(
          name: '/login',
          page: () => LoginPage(),
          //binding: AuthenticationBindings(),
        ),
        GetPage(
          name: '/signup',
          page: () => SignUpPage(),
          //binding: SettingsBindings(),
        ),
      ],
    );
  }
}
