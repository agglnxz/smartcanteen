class ProductModelGalang {
  final String  productId;
  final String  name;
  final double price;
  final int    stock;
  final String imageUrl;

  ProductModelGalang({
    required this.productId,
    required this.name,
    required this.price,
    required this.stock,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'name': name,
      'price': price,
      'stock': stock,
      'imageUrl': imageUrl,
    };
  }

  factory ProductModelGalang.fromJson(Map<String, dynamic> json) {
    return ProductModelGalang(
      productId: json['productId'],
      name: json['name'],
      price: json['price'],
      stock: json['stock'],
      imageUrl: json['imageUrl'],
    );
  }

}