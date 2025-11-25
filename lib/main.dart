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

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';              // gunakan config dari anggota 1
import 'screens/login_screen_firman.dart';   // gunakan login kamu

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi Firebase dengan config milik anggota 1
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyAppFirman());
}

class MyAppFirman extends StatelessWidget {
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
      home: LoginScreenFirman(),   // halaman pertama milik kamu
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'providers/cart_provider_inandiar.dart';
import 'screens/product_list_screen_inandiar.dart';

// Ini main app, jangan lupa firebase ya
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Firebase harus diinisialisasi dulu
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider_inandiar(),
      child: MyApp_inandiar(),
    ),
  );
}

class MyApp_inandiar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App_inandiar', // Judul app saya
      home: ProductListScreen_inandiar(),
    );
  }
}
