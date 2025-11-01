import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/custom_bottom_nav.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 🧩 Product list with different entries
    final List<Map<String, dynamic>> upcomingItems = [
      {
        "name": "DON!! Card (Gol.D.Roger) (Gold) [Carrying On His Will]",
        "price": "\$89.99 CAD",
        "availability": "Out of Stock",
        "image": "assets/logo/coming_soon_placeholder.png",
      },
      {
        "name": "Witch of the Black Rose [L5DD-ENA02] Common",
        "price": "\$4.99 CAD",
        "availability": "Draft Listing",
        "image": "assets/logo/coming_soon_placeholder.png",
      },
      {
        "name": "Roxrose Dragon [L5DD-ENA12] Common",
        "price": "\$5.25 CAD",
        "availability": "0 Units Available",
        "image": "assets/logo/coming_soon_placeholder.png",
      },
      {
        "name": "Red Rose Dragon [L5DD-ENA07] Common",
        "price": "\$6.75 CAD",
        "availability": "Preorder Soon",
        "image": "assets/logo/coming_soon_placeholder.png",
      },
      {
        "name": "Ruddy Rose Witch [L5DD-ENA13] Common",
        "price": "\$7.25 CAD",
        "availability": "0 Units Available",
        "image": "assets/logo/coming_soon_placeholder.png",
      },
      {
        "name": "Rose Lover [L5DD-ENA04] Common",
        "price": "\$3.50 CAD",
        "availability": "Restocking Soon",
        "image": "assets/logo/coming_soon_placeholder.png",
      },
      {
        "name": "Spore [L5DD-ENA03] Common",
        "price": "\$3.25 CAD",
        "availability": "Low Stock",
        "image": "assets/logo/coming_soon_placeholder.png",
      },
      {
        "name": "Splendid Rose [L5DD-ENA27] Common",
        "price": "\$5.75 CAD",
        "availability": "Draft Listing",
        "image": "assets/logo/coming_soon_placeholder.png",
      },
      {
        "name": "Black Garden [L5DD-ENA18] Common",
        "price": "\$4.95 CAD",
        "availability": "0 Units Available",
        "image": "assets/logo/coming_soon_placeholder.png",
      },
      {
        "name": "White Rose Cloister [L5DD-ENA22] Common",
        "price": "\$6.25 CAD",
        "availability": "Preorder Soon",
        "image": "assets/logo/coming_soon_placeholder.png",
      },
      {
        "name": "Blue Rose Dragon [L5DD-ENA05] Common",
        "price": "\$6.50 CAD",
        "availability": "Restocking Soon",
        "image": "assets/logo/coming_soon_placeholder.png",
      },
      {
        "name": "Ghost Sister & Spooky Dogwood [L5DD-ENA09] Common",
        "price": "\$8.99 CAD",
        "availability": "0 Units Available",
        "image": "assets/logo/coming_soon_placeholder.png",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          "Coming Soon",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: -1),

      // 🧱 Grid view layout
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: upcomingItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // ✅ 2 per row
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.65, // ✅ Adjust height/width ratio
        ),
        itemBuilder: (context, index) {
          final item = upcomingItems[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 5,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🖼 Product image
                ClipRRect(
                  borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Stack(
                    children: [
                      Image.asset(
                        item["image"],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 160,
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.black54,
                          size: 22,
                        ),
                      ),
                    ],
                  ),
                ),

                // 🏷 Product details
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item["name"],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item["price"],
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.circle, color: Colors.red, size: 8),
                          const SizedBox(width: 5),
                          Text(
                            item["availability"],
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
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
