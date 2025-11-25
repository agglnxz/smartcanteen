import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider_inandiar.dart';

class CartScreen_inandiar extends StatelessWidget {
  final TextEditingController nimController_inandiar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart_inandiar'), // Judul cart screen
      ),
      body: Consumer<CartProvider_inandiar>(
        builder: (context, cart, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.items_inandiar.length,
                  itemBuilder: (context, index) {
                    var item = cart.items_inandiar[index];
                    return ListTile(
                      title: Text(item.product_inandiar.name_inandiar),
                      subtitle: Text(
                        'Quantity: ${item.quantity_inandiar}, Total: \$${item.totalPrice_inandiar}',
                      ), // Subtitle qty dan total
                      trailing: IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          cart.removeFromCart_inandiar(
                            item.product_inandiar.id_inandiar,
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: nimController_inandiar,
                  decoration: InputDecoration(
                    labelText: 'Enter NIM_inandiar',
                  ), // Input NIM
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Total: \$${cart.totalPrice_inandiar}',
                ), // Tampilkan total
              ),
              ElevatedButton(
                child: Text('Checkout_inandiar'),
                onPressed: () async {
                  String nim_inandiar = nimController_inandiar.text;
                  if (nim_inandiar.isNotEmpty) {
                    await cart.checkout_inandiar(nim_inandiar);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Checkout successful!')),
                    ); // Snackbar sukses
                  } else {
                    print(
                      'NIM kosong, gak bisa checkout',
                    ); // Debug kalau NIM kosong
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
