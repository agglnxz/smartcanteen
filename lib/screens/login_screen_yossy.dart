import 'package:flutter/material.dart';

class LoginScreenYossy extends StatelessWidget {
  const LoginScreenYossy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.jpg", height: 120),
            const SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
                labelText: "Email Kampus",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/home");
              },
              child: const Text("Login"),
            ),

            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/register");
              },
              child: const Text("Belum punya akun? Register"),
            ),
          ],
        ),
      ),
    );
  }
}
