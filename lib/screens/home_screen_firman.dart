import 'package:flutter/material.dart';

class HomeScreenFirman extends StatelessWidget {
  const HomeScreenFirman({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Beranda Firman")),
      body: Center(
        child: Text(
          "Login berhasil!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
