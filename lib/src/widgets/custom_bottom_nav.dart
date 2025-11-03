import 'package:flutter/material.dart';
import '../home_screen.dart';
import '../screens/qr_screen.dart';
import '../screens/profile_screen.dart';

class CustomBottomNav extends StatefulWidget {
  final int currentIndex;
  const CustomBottomNav({super.key, required this.currentIndex});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  void _onItemTapped(int index) {
    if (index == widget.currentIndex) return;

    Widget destination;
    switch (index) {
      case 0:
        destination = const HomeScreen();
        break;
      case 1:
        destination = const QRScreen();
        break;
      case 2:
        destination = const ProfileScreen();
        break;
      default:
        destination = const HomeScreen();
    }

    if (index == 0) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => destination),
            (route) => false,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => destination),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final icons = [
      Icons.home,
      Icons.qr_code_scanner,
      Icons.person,
    ];

    final labels = ["Home", "Scan", "Profile"];

    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),  // ✅ smooth curve
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 8), // ✅ gap on sides, tighter icons
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // ✅ closer alignment
          children: List.generate(icons.length, (index) {
            final bool isActive = widget.currentIndex == index;

            return GestureDetector(
              onTap: () => _onItemTapped(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icons[index],
                    size: 26,
                    color: isActive ? Colors.orange : Colors.white,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    labels[index],
                    style: TextStyle(
                      fontSize: 11.5,
                      fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                      color: isActive ? Colors.orange : Colors.white,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
