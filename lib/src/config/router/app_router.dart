
import 'package:a_few_words/src/presentation/authentication/pages/forget_password/forget_password_mail/forget_password_mail_page.dart';
import 'package:a_few_words/src/presentation/authentication/pages/forget_password/forget_password_otp/otp_page.dart';
import 'package:a_few_words/src/presentation/authentication/pages/login/login_page.dart';
import 'package:a_few_words/src/presentation/authentication/pages/signup/signup_page.dart';
import 'package:a_few_words/src/presentation/authentication/pages/welcome/welcome_page.dart';
import 'package:a_few_words/src/presentation/core/pages/account/account_page.dart';
import 'package:a_few_words/src/presentation/core/pages/account/update_profile.dart';
import 'package:a_few_words/src/presentation/core/pages/dashboard/dashboard_page.dart';
import 'package:a_few_words/src/presentation/core/pages/flashcards/flashcards_page.dart';
import 'package:a_few_words/src/presentation/core/pages/review/review_page.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> get AppRouter {
    return [
      GetPage(
        name: '/welcome',
        page: () => WelcomePage(),
        //binding: AuthenticationBindings(),
      ),
      GetPage(
        name: '/login',
        page: () => LoginPage(),
      ),
      GetPage(
        name: '/signup',
        page: () => SignUpPage(),
      ),
      GetPage(
        name: '/forgetmail',
        page: () => ForgetPasswordMailPage(),
      ),
      GetPage(
        name: '/otp',
        page: () => OtpPage(),
      ),
      GetPage(
        name: '/dashboard',
        page: () => DashboardPage(),
      ),
      GetPage(
        name: '/flashcards',
        page: () => FlashcardsPage(),
      ),
      GetPage(
        name: '/account',
        page: () => AccountPage(),
      ),
      GetPage(
        name: '/review',
        page: () => ReviewPage(),
      ),
      GetPage(
        name: '/updateprofile',
        page: () => UpdateProfilePage(),
      ),
    ];
}