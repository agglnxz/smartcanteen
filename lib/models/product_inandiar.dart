import 'package:cloud_firestore/cloud_firestore.dart';

class Product_inandiar {
  final String id_inandiar;
  final String name_inandiar;
  final double price_inandiar;
  int stock_inandiar;

  Product_inandiar({
    required this.id_inandiar,
    required this.name_inandiar,
    required this.price_inandiar,
    required this.stock_inandiar,
  });

  // Factory dari firestore, biar gampang ambil data
  factory Product_inandiar.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Product_inandiar(
      id_inandiar: doc.id,
      name_inandiar: data['name_inandiar'],
      // Pastikan price selalu menjadi double (jika Firestore menyimpan int maka .toDouble() digunakan)
      price_inandiar: (data['price_inandiar'] as num).toDouble(),
      stock_inandiar: data['stock_inandiar'],
    );
  }
}