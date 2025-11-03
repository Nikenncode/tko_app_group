import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SupplyListScreen extends StatelessWidget {
  const SupplyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> accessories = [
      "Card Sleeves & Toploaders",
      "Boxes & Storage Supplies",
      "Playmats",
      "Deck Boxes & Protectors",
      "Binders & Portfolios",
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          "Accessories",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black87),
            onPressed: () =>
                Navigator.popUntil(context, (route) => route.isFirst),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 2,
      ),

      body: Column(
        children: [
          // --- Orange line below AppBar ---
          Container(
            height: 3,
            color: Colors.black12,
            width: double.infinity,
          ),

          // --- List body ---
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: accessories.length,
              separatorBuilder: (context, index) => Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey[300],
                indent: 16,
                endIndent: 16,
              ),
              itemBuilder: (context, index) {
                final item = accessories[index];
                return ListTile(
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  leading: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.black54,
                      size: 28,
                    ),
                  ),
                  title: Text(
                    item,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black45,
                    size: 18,
                  ),
                  onTap: () {
                    // TODO: Navigate to item details or products list
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
