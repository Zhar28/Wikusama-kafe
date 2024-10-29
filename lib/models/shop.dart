import 'package:flutter/material.dart';
import 'package:ukk_kasir/models/coffe.dart';

class Shop extends ChangeNotifier {
  final List<coffe> _coffeMenu = [
    coffe(
      name: "Americano",
      price: "20",
      imagePath: 'logo.png',
      rating: "4.2",
    ),
    coffe(
      name: "Latte",
      price: "23",
      imagePath: 'logo.png',
      rating: "4.4",
    ),
    coffe(
      name: "Machiato",
      price: "25",
      imagePath: 'logo.png',
      rating: "4.8",
    ),
  ];

  //customer cart
  final List<coffe> _cart = [];

  //getter method
  List<coffe> get coffeMenu => _coffeMenu;
  List<coffe> get cart => _cart;

  //add to cart
  void AddtoCart(coffe coffeItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(coffeItem);
    }
    notifyListeners();
  }

  //remove from cart
  void removefromCart(coffe Coffe) {
    _cart.remove(Coffe);
    notifyListeners();
  }
}

void removefromCart(coffe coffe) {}
