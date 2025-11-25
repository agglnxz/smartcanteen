import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_inandiar.dart';

class CartItem_inandiar {
  final Product_inandiar product_inandiar;
  int quantity_inandiar;

  CartItem_inandiar({
    required this.product_inandiar,
    this.quantity_inandiar = 1,
  });

  double get totalPrice_inandiar =>
      product_inandiar.price_inandiar * quantity_inandiar;
}

class CartProvider_inandiar with ChangeNotifier {
  List<CartItem_inandiar> _items_inandiar = [];

  List<CartItem_inandiar> get items_inandiar => _items_inandiar;

  double get totalPrice_inandiar {
    return _items_inandiar.fold(
      0.0,
      (sum, item) => sum + item.totalPrice_inandiar,
    );
  }

  void addToCart_inandiar(Product_inandiar product_inandiar) {
    final existingIndex_inandiar = _items_inandiar.indexWhere(
      (item) =>
          item.product_inandiar.id_inandiar == product_inandiar.id_inandiar,
    );
    if (existingIndex_inandiar >= 0) {
      _items_inandiar[existingIndex_inandiar].quantity_inandiar++;
    } else {
      _items_inandiar.add(
        CartItem_inandiar(product_inandiar: product_inandiar),
      );
    }
    notifyListeners();
    print(
      'Added to cart: ${product_inandiar.name_inandiar}',
    ); // Debug print biar tau
  }

  void removeFromCart_inandiar(String productId_inandiar) {
    _items_inandiar.removeWhere(
      (item) => item.product_inandiar.id_inandiar == productId_inandiar,
    );
    notifyListeners();
    print('Removed from cart'); // Debug lagi
  }

  void clearCart_inandiar() {
    _items_inandiar.clear();
    notifyListeners();
  }

  // Checkout dengan logic trap NIM, ini unik ya
  Future<void> checkout_inandiar(String nim_inandiar) async {
    // Cek digit terakhir NIM
    int lastDigit_inandiar = int.parse(nim_inandiar[nim_inandiar.length - 1]);
    double discount_inandiar = 0.0;
    double shipping_inandiar = 10.0; // Ongkir default, hardcode aja

    if (lastDigit_inandiar % 2 == 1) {
      // Ganjil: diskon 5%
      discount_inandiar = totalPrice_inandiar * 0.05;
      print('Diskon 5% karena NIM ganjil');
    } else {
      // Genap: gratis ongkir
      shipping_inandiar = 0.0;
      print('Gratis ongkir karena NIM genap');
    }

    double finalTotal_inandiar =
        totalPrice_inandiar - discount_inandiar + shipping_inandiar;
    print('Total akhir: $finalTotal_inandiar'); // Debug total

    if (_items_inandiar.isEmpty) {
      print('Cart kosong, tidak ada transaksi');
      return; // nothing to checkout
    }

    // Prepare items array untuk transaksi
    List<Map<String, dynamic>> trxItems_inandiar = _items_inandiar.map((item) {
      return {
        'product_id': item.product_inandiar.id_inandiar,
        'name': item.product_inandiar.name_inandiar,
        'price': item.product_inandiar.price_inandiar,
        'quantity': item.quantity_inandiar,
        'subtotal': item.totalPrice_inandiar,
      };
    }).toList();

    // Buat dokumen transaksi baru (trx_id auto generated oleh Firestore)
    DocumentReference trxDocRef_inandiar = FirebaseFirestore.instance.collection('transactions').doc();

    Map<String, dynamic> trxData_inandiar = {
      'trx_id': trxDocRef_inandiar.id,
      'nim': nim_inandiar,
      'total_final': finalTotal_inandiar,
      'status': 'Pending', // set Pending lalu commit batch; batch dijamin atomik, jadi kita set Success juga bisa
      'items': trxItems_inandiar,
      'created_at': FieldValue.serverTimestamp(),
    };

    // Update stok di Firebase, pakai batch biar aman
    WriteBatch batch_inandiar = FirebaseFirestore.instance.batch();
    batch_inandiar.set(trxDocRef_inandiar, trxData_inandiar);
    for (var item in _items_inandiar) {
      DocumentReference docRef_inandiar = FirebaseFirestore.instance
          .collection('products_inandiar')
          .doc(item.product_inandiar.id_inandiar);
      batch_inandiar.update(docRef_inandiar, {
        'stock_inandiar': FieldValue.increment(-item.quantity_inandiar),
      });
    }
    await batch_inandiar.commit();

    // Jika commit berhasil, update status transaksi menjadi Success
    await trxDocRef_inandiar.update({'status': 'Success'});

    clearCart_inandiar(); // Kosongkan cart setelah checkout
    print('Checkout selesai, cart dikosongkan');
  }
}
