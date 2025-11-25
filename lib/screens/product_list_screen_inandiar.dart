import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import 'cart_screen.dart';

class ProductListScreen_inandiar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products_inandiar'), // Judul screen produk
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_inandiar), // Icon cart
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen_inandiar()),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('products_inandiar').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator(); // Loading spinner
          List<Product_inandiar> products_inandiar = snapshot.data!.docs.map((doc) => Product_inandiar.fromFirestore(doc)).toList();
          return ListView.builder(
            itemCount: products_inandiar.length,
            itemBuilder: (context, index) {
              Product_inandiar product_inandiar = products_inandiar[index];
              return ListTile(
                title: Text(product_inandiar.name_inandiar),
                subtitle: Text('Price: \$${product_inandiar.price_inandiar}, Stock: ${product_inandiar.stock_inandiar}'), // Subtitle harga dan stok
                trailing: ElevatedButton(
                  child: Text('Add to Cart_inandiar'),
                  onPressed: () {
                    Provider.of<CartProvider_inandiar>(context, listen: false).addToCart_inandiar(product_inandiar);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}