import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/home_screen_firman.dart';
import '../screens/login_screen_firman.dart';

class AuthControllerFirman {
  final FirebaseAuth _authFirman = FirebaseAuth.instance;

  // REGISTER -----------------------------------------------------------------
  Future<void> registerFirman({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      await _authFirman.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // setelah daftar, kembali ke login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginScreenFirman()),
      );
    } catch (e) {
      print("Error Register Firman: $e");
    }
  }

  // LOGIN ---------------------------------------------------------------------
  Future<void> loginFirman({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      await _authFirman.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreenFirman()),
      );
    } catch (e) {
      print("Login Error Firman: $e");
    }
  }
}
