import 'package:flutter/material.dart';
import '../styles/styles.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
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
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.cancel_presentation_outlined),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Type here to search',
                ),
                style: Styles.searchTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
