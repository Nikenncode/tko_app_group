import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trading Cards')),
      body: const Center(
        child: Text(
          'Product List Screen — Coming Soon!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
