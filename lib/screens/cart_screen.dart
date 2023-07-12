import 'package:flutter/material.dart';
import 'package:luxury_store/models/cart_model.dart';

import '../styles/styles.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 35,
                  ),
                  SizedBox(width: 18),
                  Text(
                    'Shopping Cart',
                    style: Styles.bigTextStyle,
                  ),
                  Spacer(),
                  Icon(
                    Icons.shopping_bag_outlined,
                    size: 30,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                height: MediaQuery.of(context).size.height * 0.60,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: cartData.length,
                  itemBuilder: (context, index) {
                   final cartDataVariable = cartData[index];
                    return CartItem(cartItemVal: cartDataVariable,
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 43,
                width: 187,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Proceed to buy'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
