import 'package:flutter/material.dart';
import '../widgets/card_menu_yossy.dart';

class HomeScreen_yossy extends StatelessWidget {
  const HomeScreen_yossy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart E-Kantin"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/cart");
            },
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          CardMenu_yossy(
            title_yossy: "Nasi Goreng",
            price_yossy: "15000",
            image_yossy: "assets/images/nasigoreng.jpg",
          ),

          SizedBox(height: 12),

          CardMenu_yossy(
            title_yossy: "Ayam Geprek",
            price_yossy: "18000",
            image_yossy: "assets/images/ayamgeprek.jpg",
          ),
        ],
      ),
    );
  }
}
