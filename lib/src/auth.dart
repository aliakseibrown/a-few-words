// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:a_few_words/src/domain/models/user.dart' as models;

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   //create user obj based on FirebaseUser
//   models.User? _userFromFirebaseUser(User user) {
//     return user != null ? models.User(uid: user.uid) : null;
//   } 
//   // //auth change user stream
//   // Stream<models.User> get user {
//   //   return _auth.authStateChanges
//   //       .map((User user) => _userFromFirebaseUser(user));

//   // }

//   // Stream<models.User> get user {
//   //   return _auth.authStateChanges()
//   //     .map(_userFromFirebaseUser(user));
//   // }

//   //sign in anon
//   Future signInAnon() async {
//     try {
//       UserCredential result = await _auth.signInAnonymously();
//       User user = result.user!;//!
//       return _userFromFirebaseUser(user);
//     }catch(e) {
//       print(e.toString());
//       return null;
//     } 
//   }
// }
