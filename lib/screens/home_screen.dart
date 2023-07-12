import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:luxury_store/models/cart_model.dart';
import 'package:luxury_store/screens/product_details_screen.dart';
import 'package:luxury_store/styles/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.menu,
                    size: 35,
                  ),
                  SizedBox(width: 18),
                  Text(
                    'bagzz',
                    style: Styles.bigTextStyle,
                  ),
                  Spacer(),
                  Icon(Icons.shopping_bag_outlined, size: 30,),
                ],
              ),
            ),
            const SizedBox(height: 28),
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.25,
              child: Swiper(
                itemCount: pics.length,
                itemBuilder: (ctx, index) {
                  return Container(
                    height: 205,
                    child: Image.asset(pics[index]),
                  );
                },
                autoplay: true,
                pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                        color: Color.fromRGBO(153, 153, 153, 1),
                        activeColor: Colors.orange)),
              ),
            ),
            const SizedBox(height: 28),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1,
                  crossAxisSpacing: 13,
                  mainAxisSpacing: 20,
                ),
                itemCount: cartData.length,
                itemBuilder: (_, index) {
                  final data = cartData[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  ProductDetailsScreen(item: data,)),
                      );
                    },
                    child: Container(
                      height: 210,
                      width: 170,
                      color: const Color.fromRGBO(241, 241, 241, 1),
                      child: Column(
                        children: [
                          // Image.asset('assets/images/image1.png'),
                          Image.asset(data.image),
                          SizedBox(height: 5),
                          Text(
                            data.name,
                            style: Styles.cardTextStyle,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'N${data.price.toString()}',
                            style: Styles.priceTextStyle,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> pics = [
  'assets/images/pree.png',
  'assets/images/pref.png',
];