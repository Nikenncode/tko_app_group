import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListScreen> {
  bool showSingles = true;

  final List<Map<String, dynamic>> singlesCategories = [
    {"name": "Pokemon"},
    {"name": "Yu-Gi-Oh"},
    {"name": "Magic: The Gathering"},
    {"name": "One Piece"},
  ];

  final List<Map<String, dynamic>> sealedCategories = [
    {"name": "Booster Boxes"},
    {"name": "Starter Decks"},
    {"name": "Collector Packs"},
    {"name": "Elite Trainer Kits"},
    {"name": "Retail Tin"},
    {"name": "Collectors"},
  ];

  @override
  Widget build(BuildContext context) {
    final categories = showSingles ? singlesCategories : sealedCategories;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Cards",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black87),
            onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
          ),
        ],
      ),

      body: Column(
        children: [
          // --- Header Toggle (Singles / Sealed) ---
          SizedBox(
            height: 60,
            child: Row(
              children: [
                // Left half — Singles
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => showSingles = true),
                    child: MouseRegion(
                      onHover: (_) {},
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 200),
                        style: GoogleFonts.poppins(
                          fontSize: showSingles ? 22 : 18,
                          fontWeight:
                          showSingles ? FontWeight.bold : FontWeight.w500,
                          color: showSingles ? Colors.orange : Colors.black54,
                          decoration: showSingles
                              ? TextDecoration.underline
                              : TextDecoration.none,
                        ),
                        child: Center(child: Text("Singles")),
                      ),
                    ),
                  ),
                ),

                // Right half — Sealed
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => showSingles = false),
                    child: MouseRegion(
                      onHover: (_) {},
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 200),
                        style: GoogleFonts.poppins(
                          fontSize: !showSingles ? 22 : 18,
                          fontWeight:
                          !showSingles ? FontWeight.bold : FontWeight.w500,
                          color: !showSingles ? Colors.orange : Colors.black54,
                          decoration: !showSingles
                              ? TextDecoration.underline
                              : TextDecoration.none,
                        ),
                        child: Center(child: Text("Sealed")),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Divider Line
          Container(height: 1, color: Colors.grey[300]),

          const SizedBox(height: 16),

          // --- Category Grid ---
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.1,
              ),
              itemBuilder: (context, index) {
                final category = categories[index];
                return GestureDetector(
                  onTap: () {
                    // TODO: Navigate to category-specific product list
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 5,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        category["name"],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
