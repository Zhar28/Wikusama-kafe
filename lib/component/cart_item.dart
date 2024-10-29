import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  coffe Coffe;
  CartItem({super.key, required this.Coffe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(widget.Coffe.imagePath),
      title: Text(widget.Coffe.name),
      subtitle: Text(widget.Coffe.imagePath),
    );
  }
}
