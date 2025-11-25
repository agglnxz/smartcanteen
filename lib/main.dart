import 'package:flutter/material.dart';
import 'screens/login_screen_yossy.dart';
import 'screens/register_screen_yossy.dart';
import 'screens/home_screen_yossy.dart';
import 'screens/cart_screen_yossy.dart';

void main() {
  runApp(const SmartCanteenApp_yossy());
}

class SmartCanteenApp_yossy extends StatelessWidget {
  const SmartCanteenApp_yossy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        fontFamily: 'Poppins',
      ),

      initialRoute: '/login',
      routes: {
        '/login': (_) => const LoginScreen_yossy(),
        '/register': (_) => const RegisterScreen_yossy(),
        '/home': (_) => const HomeScreen_yossy(),
        '/cart': (_) => const CartScreen_yossy(),
      },
    );
  }
}
