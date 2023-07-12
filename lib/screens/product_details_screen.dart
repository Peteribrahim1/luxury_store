import 'package:flutter/material.dart';
import 'package:luxury_store/resources/auth_methods.dart';
import 'package:provider/provider.dart';

import '../models/cart_model.dart';
import '../models/user.dart';
import '../providers/user_provider.dart';
import '../styles/styles.dart';

class ProductDetailsScreen extends StatefulWidget {
  final CartModel item;

  const ProductDetailsScreen({Key? key, required this.item}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen>
    with TickerProviderStateMixin {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    final User? user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_outlined,
                      size: 35,
                    ),
                  ),
                  SizedBox(width: 18),
                  const Text(
                    'bagzz',
                    style: Styles.bigTextStyle,
                  ),
                  Spacer(),
                  const Icon(
                    Icons.shopping_bag_outlined,
                    size: 30,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 170,
                    height: 155,
                    child: Image.asset(widget.item.image),
                  ),
                  SizedBox(width: 22),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        widget.item.name,
                        style: Styles.bigTextStyle,
                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.item.price.toString(),
                        style: Styles.priceTextStyle,
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 31,
                        width: 120,
                        child: ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              _isLoading = true;
                            });
                            await AuthMethods().cart(
                                widget.item.price.toString(),
                                user!.uid,
                                widget.item.name,
                                widget.item.image);

                            setState(() {
                              _isLoading = false;
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.orange),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          child: _isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Text('ADD TO CART'),
                        ),
                      ),
                      // SizedBox(height: 12),
                      // Image.asset('assets/images/cart.png'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: const [
                    Tab(text: 'Description'),
                    Tab(text: 'Shipping info'),
                    Tab(text: 'Payment options'),
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 300,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Text(
                            'As in handbags, the double ring and bar design defines the wallet shape, highlighting the front flap closure which is tucked inside the hardware. Completed with an organizational interior, the black leather wallet features a detachable chain.',
                            style: Styles.descTextStyle,
                          ),
                          SizedBox(height: 5),
                          Text(
                              'All products are made with carefully selected materials. Please handle with care for longer product life. Protect from direct light, heat and rain. Should it Protect from direct light, heat and rain Protect from direct light, heat and rain. Should it Protect from direct light, heat and rain. Should it become wet, dry it immediately with a soft cloth Store in the provided flannel bag or box Store in the provided flannel bag or box Clean with a soft, dry clot',
                              style: Styles.descTextStyle),
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: const [
                            Text(
                              'As in handbags, the double ring and bar design defines the wallet shape, highlighting the front flap closure which is tucked inside the hardware. Completed with an organizational interior, the black leather wallet features a detachable chain.',
                              style: Styles.descTextStyle,
                            ),
                            SizedBox(height: 5),
                            Text(
                                'All products are made with carefully selected materials. Please handle with care for longer product life. Protect from direct light, heat and rain. Should it Protect from direct light, heat and rain Protect from direct light, heat and rain. Should it Protect from direct light, heat and rain. Should it become wet, dry it immediately with a soft cloth Store in the provided flannel bag or box Store in the provided flannel bag or box Clean with a soft, dry clot',
                                style: Styles.descTextStyle),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'As in handbags, the double ring and bar design defines the wallet shape, highlighting the front flap closure which is tucked inside the hardware. Completed with an organizational interior, the black leather wallet features a detachable chain.',
                              style: Styles.descTextStyle,
                            ),
                            SizedBox(height: 5),
                            Text(
                                'All products are made with carefully selected materials. Please handle with care for longer product life. Protect from direct light, heat and rain. Should it Protect from direct light, heat and rain Protect from direct light, heat and rain. Should it Protect from direct light, heat and rain. Should it become wet, dry it immediately with a soft cloth Store in the provided flannel bag or box Store in the provided flannel bag or box Clean with a soft, dry clot',
                                style: Styles.descTextStyle),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
