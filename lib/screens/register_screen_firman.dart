import 'package:flutter/material.dart';
import '../auth/auth_controller_firman.dart';
import 'login_screen_firman.dart';

class RegisterScreenFirman extends StatefulWidget {
  const RegisterScreenFirman({super.key});

  @override
  State<RegisterScreenFirman> createState() => _RegisterScreenFirmanState();
}

class _RegisterScreenFirmanState extends State<RegisterScreenFirman> {
  final emailCFirman = TextEditingController();
  final passCFirman = TextEditingController();
  final nameCFirman = TextEditingController();
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
              Text("Daftar Akun",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),

              SizedBox(height: 30),

              TextFormField(
                controller: nameCFirman,
                decoration: InputDecoration(labelText: "Nama Lengkap"),
                validator: (v) => v!.isEmpty ? "Wajib diisi" : null,
              ),

              SizedBox(height: 20),

              TextFormField(
                controller: emailCFirman,
                decoration: InputDecoration(labelText: "Email Kampus"),
                validator: (value) {
                  if (value!.isEmpty) return "Email wajib";
                  if (!value.contains("@")) return "Email tidak valid";
                  if (!value.endsWith(".ac.id"))
                    return "Gunakan email kampus";
                  return null;
                },
              ),

              SizedBox(height: 20),

              TextFormField(
                controller: passCFirman,
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
                validator: (v) =>
                    v!.length < 6 ? "Minimal 6 karakter" : null,
              ),

              SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  if (formKeyFirman.currentState!.validate()) {
                    authFirman.registerFirman(
                      context: context,
                      email: emailCFirman.text.trim(),
                      password: passCFirman.text.trim(),
                    );
                  }
                },
                child: Text("Register"),
              ),

              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LoginScreenFirman(),
                    ),
                  );
                },
                child: Text("Sudah punya akun? Login",
                    style: TextStyle(color: Colors.blue)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
