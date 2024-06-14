import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartState();
}

class _CartState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "CartPage",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
