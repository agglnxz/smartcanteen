import 'package:flutter/material.dart';
import '../widgets/card_menu_yossy.dart';

class HomeScreenYossy extends StatelessWidget {
  const HomeScreenYossy({super.key});

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
          CardMenuYossy(
            titleyossy: "Nasi Goreng",
            priceyossy: "15000",
            imageYossy: "assets/images/nasigoreng.jpg",
          ),
          SizedBox(height: 12),
          CardMenuYossy(
            titleyossy: "Ayam Geprek",
            priceyossy: "18000",
            imageYossy: "assets/images/ayamgeprek.jpg",
          ),
        ],
      ),
    );
  }
}
