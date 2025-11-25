import 'package:flutter/material.dart';
import '../auth/auth_controller_firman.dart';
import 'register_screen_firman.dart';

class LoginScreenFirman extends StatefulWidget {
  const LoginScreenFirman({super.key});

  @override
  State<LoginScreenFirman> createState() => _LoginScreenFirmanState();
}

class _LoginScreenFirmanState extends State<LoginScreenFirman> {
  final emailCFirman = TextEditingController();
  final passCFirman = TextEditingController();
  final formKeyFirman = GlobalKey<FormState>();
  final authFirman = AuthControllerFirman();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: formKeyFirman,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Login Smart E-Kantin",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),

              SizedBox(height: 30),

              // EMAIL -----------------------------------------------------------
              TextFormField(
                controller: emailCFirman,
                decoration: InputDecoration(labelText: "Email Kampus"),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Email wajib";
                  if (!value.contains("@")) return "Email tidak valid";
                  if (!value.endsWith(".ac.id"))
                    return "Gunakan email kampus (.ac.id)";
                  return null;
                },
              ),

              SizedBox(height: 20),

              // PASSWORD -------------------------------------------------------
              TextFormField(
                controller: passCFirman,
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
                validator: (value) =>
                    value!.length < 6 ? "Minimal 6 karakter" : null,
              ),

              SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  if (formKeyFirman.currentState!.validate()) {
                    authFirman.loginFirman(
                      context: context,
                      email: emailCFirman.text.trim(),
                      password: passCFirman.text.trim(),
                    );
                  }
                },
                child: Text("Login"),
              ),

              SizedBox(height: 16),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => RegisterScreenFirman(),
                    ),
                  );
                },
                child: Text("Belum punya akun? Register",
                    style: TextStyle(color: Colors.blue)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
