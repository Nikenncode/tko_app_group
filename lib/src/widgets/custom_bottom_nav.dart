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
    // ✅ If already on the same page, do nothing
    if (index == widget.currentIndex) return;

    Widget destination;
    switch (index) {
      case 0:
      // ✅ When on details screen or any sub-page, this brings user back home
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

    // ✅ Use pushAndRemoveUntil for Home (so it resets underline properly)
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

    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (index) {
          final bool isActive = widget.currentIndex == index;

          return GestureDetector(
            onTap: () => _onItemTapped(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icons[index],
                  // ✅ Home icon white on details screen, orange on active page
                  color: isActive ? Colors.orange : Colors.white,
                ),
                const SizedBox(height: 4),
                if (isActive)
                  Container(
                    width: 20,
                    height: 3,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
