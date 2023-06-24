import 'package:a_few_words/src/domain/repositories/authentication_repository/exceptions/signup_email_password_failure.dart';
import 'package:a_few_words/src/presentation/authentication/pages/welcome/welcome_page.dart';
import 'package:a_few_words/src/presentation/core/pages/dashboard/dashboard_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  
  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialPage);
  }

  _setInitialPage(User? user) {
    user == null ? Get.offAll(() => WelcomePage()) : Get.offAll(() => const DashboardPage());
  }

  void createUserWithEmailAndPassword(String email, String password) async {
    print('');
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ? Get.offAll(() =>  const DashboardPage()) : Get.to(() =>  WelcomePage());
    } on FirebaseAuthException catch(e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE EXCEPTOIN - ${ex.message}');
      throw ex;
    } catch(_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTOIN - ${ex.message}');
      throw ex;
    }
  }

  void loginWithEmailAndPassword(String email, String password) async {
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e) {

    } catch(_) {}
  }

  Future<void> logout() async => await _auth.signOut();

}