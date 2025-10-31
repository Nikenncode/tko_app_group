import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecialsScreen extends StatelessWidget {
  const SpecialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          "Limited Edition",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: const Center(
        child: Text("Special Edition content coming soon..."),
      ),
    );
  }
}
