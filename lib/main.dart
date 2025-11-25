import 'package:flutter/material.dart';
import 'screens/login_screen_yossy.dart';
import 'screens/register_screen_yossy.dart';
import 'screens/home_screen_yossy.dart';
import 'screens/cart_screen_yossy.dart';

void main() {
  runApp(const SmartCanteenAppyossy());
}

class SmartCanteenAppyossy extends StatelessWidget {
  const SmartCanteenAppyossy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        fontFamily: 'Poppins',   // 🟩 WAJIB untuk ubah font global
      ),

      initialRoute: '/login',
      routes: {
        '/login': (_) => const LoginScreenYossy(),
        '/register': (_) => const RegisterScreenYossy(),
        '/home': (_) => const HomeScreenYossy(),
        '/cart': (_) => const CartScreenYossy(),
      },
    );
  }
}
