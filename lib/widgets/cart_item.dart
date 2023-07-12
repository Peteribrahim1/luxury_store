import 'package:flutter/material.dart';
import 'package:luxury_store/models/cart_model.dart';

import '../styles/styles.dart';

class CartItem extends StatelessWidget {
  final CartModel cartItemVal;
  const CartItem({Key? key, required this.cartItemVal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 81,
                        width: 81,
                        child: Image.asset(cartItemVal.image)),
                    Text(
                      cartItemVal.name,
                      style: Styles.cardTextStyle,
                    ),
                  ],
                ),
                Image.asset('assets/images/Group60.png'),
              ],
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 5),
                Text(
                  cartItemVal.price.toString(),
                  style: Styles.priceTextStyle,
                ),
                Row(
                  children: [
                    const Text(
                      'Remove',
                      style: Styles.cardTextStyle,
                    ),
                    const Icon(Icons.delete, color: Colors.red,),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            Image.asset('assets/images/Line1.png'),
          ],
        ),
      ),
    );
  }
}
