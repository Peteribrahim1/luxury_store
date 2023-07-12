import 'package:flutter/material.dart';
import 'package:luxury_store/screens/cart_screen.dart';
import 'package:luxury_store/screens/help_screen.dart';
import 'package:luxury_store/screens/home_screen.dart';
import 'package:luxury_store/screens/search_screen.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabscreen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages = [
    {
      'page': const HomeScreen(),
    },
    {
      'page': const SearchScreen(),
    },
    {
      'page': const CartScreen(),
    },
    {
      'page': const HelpScreen(),
    },
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        unselectedItemColor: const Color.fromRGBO(123, 141, 158, 1),
        selectedItemColor: Colors.black,

        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.search, color: Colors.black),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.help, color: Colors.black),
            label: 'Help',
          ),
        ],
      ),
    );
  }
}
