import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'product_list_screen.dart';
import 'widgets/custom_bottom_nav.dart';
import 'screens/points_details_screen.dart';
import 'data/points_data.dart';
import 'screens/supplies_list_screen.dart';
import 'screens/special_edition_screen.dart';
import 'screens/toys_list_screen.dart';
import 'screens/coming_soon_screen.dart';
import 'screens/discord_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: const CustomBottomNav(currentIndex: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const Divider(thickness: 1),
              _buildBannerRow(),
              const SizedBox(height: 10),
              _buildPointsCard(context),
              const SizedBox(height: 20),
              _buildCategoryGrid(context),
            ],
          ),
        ),
      ),
    );
  }

  // --- HEADER ---
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good Afternoon,",
                style: GoogleFonts.poppins(fontSize: 16),
              ),
              Text(
                "Tyler.",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Image.asset(
            'assets/logo/name.png',
            height: 36, // adjust height as needed
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }

  Widget _buildBannerRow() {
    final weekday = const [
      "monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"
    ][DateTime.now().weekday - 1];

    final imagePath = 'assets/event_banners/$weekday.png';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: _bannerBox(imagePath),
    );
  }

  Widget _bannerBox(String imagePath) {
    return Container(
      width: double.infinity,
      height: 90, // ⬇️ reduced height for tighter layout
      decoration: BoxDecoration(
        color: const Color(0xFF3CC2B3), // teal background that matches the banner
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- Header Text ---
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 10, 0, 4),
            child: Text(
              "TKO EVENT SCHEDULE",
              style: GoogleFonts.bangers(
                fontSize: 15,
                color: Colors.black,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(1, 1),
                    blurRadius: 1,
                  ),
                ],
              ),
            ),
          ),

          // --- Separator Line ---
          Container(
            width: double.infinity,
            height: 2,
            color: Colors.black.withOpacity(0.3),
          ),

          // --- Event Image ---
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(14),
                bottomRight: Radius.circular(14),
              ),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }


  // --- POINTS CARD ---
  Widget _buildPointsCard(BuildContext context) {
    final int currentPoints = calculateTotalPoints();
    final int totalPoints = 1499;
    final int remainingPoints = totalPoints - currentPoints;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PointsDetailsScreen()),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[850],
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                "$currentPoints Points",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Keep earning points to unlock more Benefits!",
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 12),
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: currentPoints / totalPoints,
                backgroundColor: Colors.grey[700],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.orange),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$currentPoints / $totalPoints Points",
                    style: GoogleFonts.poppins(color: Colors.white, fontSize: 12),
                  ),
                  Text(
                    "$remainingPoints points TO GO",
                    style: GoogleFonts.poppins(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }



  // --- CATEGORY GRID (refined layout) ---
  Widget _buildCategoryGrid(BuildContext context) {
    final categories = [
      {"name": "Trading Cards", "icon": Icons.style},
      {"name": "Toys & Beyblades", "icon": Icons.crop_rotate_rounded},
      {"name": "Supplies & Accessories", "icon": Icons.inventory_2},
      {"name": "Special Edition", "icon": Icons.star},
      {"name": "Discord", "icon": Icons.chat_rounded},
      {"name": "Coming Soon", "icon": Icons.hourglass_bottom},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,  // ↓ reduced from 10
          childAspectRatio: 0.90, // ↓ slightly tighter boxes
        ),
        itemBuilder: (context, index) {
          final category = categories[index];

          return InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              final name = category["name"] as String;

              Widget destination;
              switch (name) {
                case "Trading Cards":
                  destination = const ProductListScreen();
                  break;

                case "Toys & Beyblades":
                  destination = const ToysListScreen();
                  break;

                case "Supplies & Accessories":
                  destination = const SupplyListScreen();
                  break;

                case "Special Edition":
                  destination = const SpecialsScreen();
                  break;

                case "Discord":
                  destination = const DiscordScreen();
                  break;

                case "Coming Soon":
                  destination = const ComingSoonScreen();
                  break;

                default:
                  destination = const PointsDetailsScreen();
              }

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => destination),
              );
            },

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.25),
                        blurRadius: 4,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    category["icon"] as IconData,
                    color: Colors.orange[700],
                    size: 30,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  category["name"] as String,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 11.5,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

}




