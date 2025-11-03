import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> singlesCategories = [
    {"name": "Pokemon", "image": "assets/banners/pokemon.png"},
    {"name": "Yu-Gi-Oh", "image": "assets/banners/yugi.png"},
    {"name": "Magic: The Gathering", "image": "assets/banners/mtg.png"},
    {"name": "One Piece", "image": "assets/banners/one_piece.png"},
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
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          "Cards",
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
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.orange,
          labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
          tabs: const [
            Tab(text: "Singles"),
            Tab(text: "Sealed"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildSinglesGrid(),
          _buildSealedList(),
        ],
      ),
    );
  }

  // --- Singles Section (Column Layout with Image on Left) ---
  Widget _buildSinglesGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: singlesCategories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.9, // slightly taller to fit image
      ),
      itemBuilder: (context, index) {
        final category = singlesCategories[index];
        final imagePath = category["image"];

        return GestureDetector(
          onTap: () {
            // TODO: Navigate to product list for this category
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF4F4F4), // ✅ light background like banner
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade300, width: 0.8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.07),
                  blurRadius: 5,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // --- Image Section ---
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.contain, // ✅ full image without cropping
                        width: double.infinity,
                        height: double.infinity,
                        errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.image_not_supported,
                            size: 50, color: Colors.grey),
                      ),
                    ),
                  ),
                ),

                // --- Text Below Image ---
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    category["name"],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // --- Sealed Section (List Style like Tim Hortons) ---
  Widget _buildSealedList() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: sealedCategories.length,
      separatorBuilder: (context, index) => Divider(
        height: 1,
        thickness: 1,
        color: Colors.grey[300],
        indent: 16,
        endIndent: 16,
      ),
      itemBuilder: (context, index) {
        final category = sealedCategories[index];
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
            child: const Icon(Icons.shopping_bag_outlined,
                color: Colors.black54, size: 28),
          ),
          title: Text(
            category["name"],
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios_rounded,
              color: Colors.black45, size: 18),
          onTap: () {
            // TODO: Navigate to product list
          },
        );
      },
    );
  }
}
