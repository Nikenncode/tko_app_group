import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

class GreetingText extends StatefulWidget {
  const GreetingText({super.key});

  @override
  State<GreetingText> createState() => _GreetingTextState();
}

class _GreetingTextState extends State<GreetingText> {
  late String greeting;

  @override
  void initState() {
    super.initState();
    greeting = _getGreeting();
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return "Good Morning,";
    } else if (hour < 17) {
      return "Good Afternoon,";
    } else {
      return "Good Evening,";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      greeting,
      style: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
    );
  }
}
