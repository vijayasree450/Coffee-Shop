import 'package:flutter/material.dart';
import '../compontes/bottom_nav_bar.dart';
import '../const.dart';
import '../pages/shop_page.dart';
import '../pages/cart_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  final List<Widget> _pages = [
  ShopPage(),
  CartPages(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
     
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),

      body:_pages[_selectedIndex],



    );
  }
}
