import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/custom_bottom_nav.dart';
import 'toy_details_screen.dart';

class ToysListScreen extends StatefulWidget {
  const ToysListScreen({super.key});

  @override
  State<ToysListScreen> createState() => _ToysListScreenState();
}

class _ToysListScreenState extends State<ToysListScreen> {
  int cartCount = 0;

  // You can later wire this up to a real cart/store.
  void _addToCart(Map<String, dynamic> toy) {
    setState(() => cartCount++);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Added "${toy["name"]}" to cart'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> toys = [
      {
        "name": "Beyblade X – Beystadium Xtreme Battle Set",
        "price": "\$79.95 CAD",
        "stock": "In Stock",
        "image": "assets/toys/1.jpg",
        "description":
        "Includes 2 Beyblades, launcher, and battle arena. Perfect for head-to-head play."
      },
      {
        "name": "Beyblade X – Yell Kong 3-60GB / Helm Knight Dual Pack",
        "price": "\$24.95 CAD",
        "stock": "In Stock",
        "image": "assets/toys/2.jpg",
        "description":
        "Dual pack with two high-performance Beyblades with precision spin mechanics."
      },
      {
        "name": "Beyblade X – Gale Wyvern / Tail Viper Dual Pack",
        "price": "\$24.95 CAD",
        "stock": "In Stock",
        "image": "assets/toys/3.jpg",
        "description":
        "Twin pack for Beyblade pros. Compatible with Beystadiums and all X-series launchers."
      },
      {
        "name": "Beyblade X – Bite Croc / Sting Unicorn Dual Pack",
        "price": "\$24.95 CAD",
        "stock": "In Stock",
        "image": "assets/toys/4.jpg",
        "description":
        "Rare set with high-speed balance layer for tournament battles."
      },
      {
        "name": "Beyblade X – Beystadium Battle Arena",
        "price": "\$18.95 CAD",
        "stock": "In Stock",
        "image": "assets/toys/5.jpg",
        "description":
        "Durable plastic battle arena for Beyblade X system. Ideal for intense matches."
      },
      {
        "name": "Beyblade X – Yell Kong 3-60GB",
        "price": "\$13.95 CAD",
        "stock": "In Stock",
        "image": "assets/toys/6.webp",
        "description":
        "Compact spinning top with aggressive attack ring and smooth rotation."
      },
      {
        "name": "Beyblade X – Keel Shark 1-60Q",
        "price": "\$13.95 CAD",
        "stock": "In Stock",
        "image": "assets/toys/7.jpg",
        "description":
        "Defensive-type top that excels in long-lasting endurance battles."
      },
      {
        "name": "Beyblade X – Obsidian Shell 4-60D",
        "price": "\$13.95 CAD",
        "stock": "In Stock",
        "image": "assets/toys/8.webp",
        "description":
        "Balanced-type Beyblade with unique layered design for stability and speed."
      },
      {
        "name": "Beyblade X – Dranzer Spiral 3-80T",
        "price": "\$21.95 CAD",
        "stock": "In Stock",
        "image": "assets/toys/9.jpg",
        "description":
        "Classic stamina-type Beyblade designed for controlled, precise spins."
      },
      {
        "name": "Beyblade X – Arrow Wizard Starter Pack",
        "price": "\$18.95 CAD",
        "stock": "In Stock",
        "image": "assets/toys/10.jpg",
        "description":
        "Starter pack includes launcher & spinning top. Great for new players."
      },
      {
        "name": "Beyblade X – Scythe Incendio Starter Pack",
        "price": "\$18.95 CAD",
        "stock": "In Stock",
        "image": "assets/toys/11.jpg",
        "description":
        "High-speed attack top with launcher and extra power cord."
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          "Toys & Beyblades",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.black87),
          ),
          // Cart with badge
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart_outlined,
                      color: Colors.black87),
                ),
                if (cartCount > 0)
                  Positioned(
                    right: 6,
                    top: 6,
                    child: Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '$cartCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: -1),

      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: toys.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.75, // slightly taller cards, avoids overflow
        ),
        itemBuilder: (context, index) {
          final toy = toys[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ToyDetailsScreen(toy: toy)),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 6,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🧩 Centered Image in White Background
                  Container(
                    padding: const EdgeInsets.all(9),
                    height: 100,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                    ),
                    child: Image.asset(
                      toy["image"],
                      fit: BoxFit.contain,
                    ),
                  ),

                  // 🏷 Details Section
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            toy["name"],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            toy["price"],
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            toy["stock"],
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: toy["stock"] == "In Stock"
                                  ? Colors.green
                                  : Colors.redAccent,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),

                  // 🛒 Add to Cart Button (sticks to bottom)
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(12),
                          ),
                        ),
                      ),
                      onPressed: () => _addToCart(toy),
                      child: Text(
                        "ADD TO CART",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),

    );
  }
}
