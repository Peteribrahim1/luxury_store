import 'package:flutter/material.dart';

class CartModel {
  final String name;
  final int price;
  final String image;

  CartModel({
    required this.name,
    required this.price,
    required this.image,
  });
}

final List<dynamic> cartData = [
  CartModel(name: 'Artsy', price: 6000, image: 'assets/images/image1.png'),
  CartModel(name: 'Berkely', price: 4000, image: 'assets/images/image2.png'),
  CartModel(name: 'Capucinus', price: 9000, image: 'assets/images/image3.png'),
  CartModel(name: 'Monogram', price: 3000, image: 'assets/images/image4.png'),
  CartModel(name: 'Gucci', price: 8000, image: 'assets/images/image1.png'),
  CartModel(name: 'Versace', price: 5000, image: 'assets/images/image2.png'),
  CartModel(name: 'Dior', price: 2000, image: 'assets/images/image3.png'),
  CartModel(name: 'Dolce', price: 7000, image: 'assets/images/image4.png'),

];

