import 'package:a_few_words/src/domain/repositories/authentication_repository/exceptions/signup_email_password_failure.dart';
import 'package:a_few_words/src/presentation/authentication/pages/login/login_page.dart';
import 'package:a_few_words/src/presentation/authentication/pages/welcome/welcome_page.dart';
import 'package:a_few_words/src/presentation/core/pages/dashboard/dashboard_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    //setInitialPage(firebaseUser.value);
    ever(firebaseUser, _setInitialPage);
  }

  _setInitialPage(User? user) {
    user == null
        ? Get.offAll(() => const WelcomePage())
        : Get.offAll(() => const DashboardPage());
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const DashboardPage())
          : Get.to(() => const WelcomePage());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE EXCEPTOIN - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTOIN - ${ex.message}');
      throw ex;
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const DashboardPage())
          : Get.to(() => const LoginPage());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (_) {}
  }

  Future<void> logout() async {
    await _auth.signOut();
    //setInitialPage(firebaseUser.value);
  }
}
