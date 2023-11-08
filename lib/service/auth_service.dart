import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService {
  final firebaseAuth = FirebaseAuth.instance;

  Future signInAnonymous() async {
    try {
      final result = await firebaseAuth.signInAnonymously();
      print(result.user!.uid);
      return result.user;
    } catch (e) {
      print("anon error  $e");
      return null;
    }
  }

  Future forgotPassword(String email) async {
    try {
      final result = firebaseAuth.sendPasswordResetEmail(email: email);
      print("Mail Kutunuzu Kontrol ediniz");
    } catch (e) {
      print(e);
    }
  }
}
