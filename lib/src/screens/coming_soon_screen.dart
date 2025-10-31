import 'package:flutter/material.dart';

class SoonScreen extends StatelessWidget {
  const SoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Coming Soon')),
      body: const Center(
        child: Text(
          'Card Reveal Screen — Coming Soon!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
