import 'package:flutter/material.dart';

class CardMenuYossy extends StatelessWidget {
  final String titleyossy;
  final String priceyossy;
  final String imageYossy;

  const CardMenuYossy({
    super.key,
    required this.titleyossy,
    required this.priceyossy,
    required this.imageYossy,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // BAGIAN GAMBAR — fix supaya tidak melebar
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.asset(
              imageYossy,
              width: 100,
              height: 100,
              fit: BoxFit.cover, // tetap proporsional, tidak gepeng
            ),
          ),

          const SizedBox(width: 12),

          // BAGIAN TEXT
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titleyossy,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Rp $priceyossy",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 