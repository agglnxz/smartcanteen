import 'package:flutter/material.dart';

class CartScreenYossy extends StatelessWidget {
  const CartScreenYossy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Keranjang")),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_cart, size: 80),
            const SizedBox(height: 20),
            const Text("Keranjang masih kosong"),
          ],
        ),
      ),
    );
  }
}
