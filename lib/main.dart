import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'providers/cart_provider.dart';
import 'screens/product_list_screen.dart';

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