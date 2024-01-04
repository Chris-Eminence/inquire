import 'package:firebase_auth/firebase_auth.dart';

Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  } on FirebaseAuthException catch (e) {
    // Handle sign-in errors
    print('Error during sign-in: $e');
    throw e;
  }
}

Future<UserCredential> signUpWithEmailAndPassword(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  } on FirebaseAuthException catch (e) {
    // Handle sign-up errors
    print('Error during sign-up: $e');
    throw e;
  }
}
 logoutUser() async {
   await FirebaseAuth.instance.signOut();
}

