import 'package:flutter/material.dart';
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
      home: LoginScreenFirman(),   // halaman pertama milik kamu
    );
  }
}
