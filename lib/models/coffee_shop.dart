
import 'package:flutter/material.dart';

import 'coffee.dart';

class CoffeeShop extends ChangeNotifier {

  final List<Coffee> _shop = [
    Coffee(
      name: 'Long Black',
      price: "4.10",
      imagePath: 'assets/images/1.png',
    ),
    Coffee(
      name: 'Iced Coffee',
      price: "4.40",
      imagePath: 'assets/images/2.png',
    ),
    Coffee(
      name: 'Latte',
      price: "4.20",
      imagePath: 'assets/images/3.png',
    ),
    Coffee(
      name: 'Espresso',
      price: "3.50",
      imagePath: 'assets/images/4.png',
    ),
  ];

  final List<Coffee> _userCart = [];


  List<Coffee> get shop => _shop;
  List<Coffee> get userCart => _userCart;

  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }


  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
