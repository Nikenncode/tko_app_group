import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToysScreen extends StatelessWidget {
  const ToysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          "Toys & Beyblades",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: const Center(
        child: Text("Toys & Beyblades content coming soon..."),
      ),
    );
  }
}
