import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartState();
}

class _CartState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color.fromRGBO(19, 19, 19, 1),
        body: Center(
          child: Text(
            "cart page",
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}
