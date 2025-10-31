import 'package:flutter/material.dart';

class SupplyListScreen extends StatelessWidget {
  const SupplyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Supplies & Accessories')),
      body: const Center(
        child: Text(
          'Supply List Screen — Coming Soon!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
