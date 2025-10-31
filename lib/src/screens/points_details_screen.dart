import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/custom_bottom_nav.dart';
import '../data/points_data.dart';

class PointsDetailsScreen extends StatefulWidget {
  const PointsDetailsScreen({super.key});

  @override
  State<PointsDetailsScreen> createState() => _PointsDetailsScreenState();
}

class _PointsDetailsScreenState extends State<PointsDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, String>> history = [
    {"date": "06-09-2025", "points": "+42", "amount": "\$42.90"},
    {"date": "11-09-2025", "points": "+200", "amount": "\$200.01"},
    {"date": "18-09-2025", "points": "+85", "amount": "\$85.85"},
    {"date": "30-09-2025", "points": "+112", "amount": "\$112.40"},
    {"date": "20-10-2025", "points": "+47", "amount": "\$47.62"},
    {"date": "24-10-2025", "points": "+30", "amount": "\$30.12"},
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
        backgroundColor: Colors.white,
        title: Text(
          "Loyalty Rewards",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 1,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.orange,
          labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
          tabs: const [
            Tab(text: "Details"),
            Tab(text: "History"),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: -1),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildDetailsTab(context),
          _buildHistoryTab(),
        ],
      ),
    );
  }

  Widget _buildDetailsTab(BuildContext context) {
    final tiers = [
      {
        "tier": "Tier - 1",
        "name": "Featherweight",
        "points": 516,
        "goal": 1500,
        "color": Colors.orange,
        "benefits": [
          "Points per \$1 spent",
          "Discord Access",
          "1.5x points earned if shop on Wednesday",
          "Community Bonus Points (Events + Tournaments)"
        ]
      },
      {
        "tier": "Tier - 2",
        "name": "Lightweight",
        "points": 1500,
        "goal": 3000,
        "color": Colors.blueAccent,
        "benefits": [
          "3% on Singles Discount",
          "1% on Sealed Discount",
          "5% on Supplies Discount",
          "5% on Toys & Board Games Discount",
          "Guaranteed Lightweight"
        ]
      },
      {
        "tier": "Tier - 3",
        "name": "Welterweight",
        "points": 3000,
        "goal": 5000,
        "color": Colors.purple,
        "benefits": [
          "1.25x Points per \$1 spent",
          "7% on Singles Discount",
          "2% on Sealed Discount",
          "10% on Supplies Discount",
          "8% on Toys & Board Games Discount",
          "Access to Pre-Orders (case by case depending on allocation)",
          "Priority Registration for Exclusive Events",
          "Same Day Price + Product Lock",
          "Guaranteed Lightweight (15000pts - keep Welterweight)",
          "Lock In Your Tier 1x"
        ]
      },
      {
        "tier": "Tier - 4",
        "name": "Heavyweight",
        "points": 5000,
        "goal": 8000,
        "color": Colors.red,
        "benefits": [
          "1.50x Points per \$1 spent",
          "10% on Singles Discount",
          "3% on Sealed Discount",
          "15% on Supplies Discount",
          "13% on Toys & Board Games Discount",
          "Guaranteed Access to Pre-Orders (1 Item per Sku Guaranteed)",
          "Private Tier Events",
          "Discord Priority Channels",
          "48hrs Price + Product Lock",
          "Guaranteed Welterweight (45000pts - keep Heavyweight)",
          "Lock In Your Tier 2x"
        ]
      },
      {
        "tier": "Tier - 5",
        "name": "Reigning Champion",
        "points": 8000,
        "goal": 10000,
        "color": Colors.brown,
        "benefits": [
          "2x Points per \$1 spent",
          "15% on Singles Discount",
          "5% on Sealed Discount",
          "20% on Supplies Discount",
          "15% on Toys & Board Games Discount",
          "Guaranteed Access to Pre-Orders (1 case limit per Sku)",
          "VIP-only Events",
          "Discord Priority Channels",
          "72hrs Price + Product Lock",
          "Guaranteed Heavyweight"
        ]
      },
    ];

    final PageController _pageController = PageController(viewportFraction: 0.9);
    final ValueNotifier<int> currentPage = ValueNotifier<int>(0);

// ✅ Correct total points calculation from history
    final int totalPoints = history.fold<int>(
      0,
          (sum, item) => sum + int.parse(item["points"]!.replaceAll("+", "")),
    );

    return Column(
      children: [
        const SizedBox(height: 10),

        // --- 🟧 Total Accumulated Points Bar ---
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.symmetric(vertical: 12),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            "Total Points Earned:  $totalPoints",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),


        // 👇 Swipeable Tier Cards
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              PageView.builder(
                controller: _pageController,
                onPageChanged: (index) => currentPage.value = index,
                itemCount: tiers.length,
                itemBuilder: (context, index) {
                  final tier = tiers[index];
                  final String tierLabel = tier["tier"] as String;
                  final String name = tier["name"] as String;
                  final int points = tier["points"] as int;
                  final int goal = tier["goal"] as int;
                  final Color color =
                      (tier["color"] as Color?) ?? Colors.orange;
                  final List<String> benefits =
                  (tier["benefits"] as List).cast<String>();

                  final bool isCurrent = index == currentPage.value;
                  final double progress = (points / goal).clamp(0.0, 1.0);

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                     color: index == 0
                          ? color // first tier fully colored
                          : color.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(tierLabel,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                        const SizedBox(height: 6),
                        Text(name,
                            style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: Divider(
                            color: Colors.black12,
                            thickness: 2,
                            height: 1, // keeps it slim
                          ),
                        ),
                        const SizedBox(height: 16),
                        LinearProgressIndicator(
                          value: progress,
                          backgroundColor: Colors.white.withOpacity(0.4),
                          color: Colors.white,
                          minHeight: 6,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${(goal - points).clamp(0, goal)} points to next tier",
                          style: GoogleFonts.poppins(
                              fontSize: 12, color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Benefits:",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              ...List.generate(
                                (tier["benefits"] as List).length,
                                    (i) => Padding(
                                  padding: const EdgeInsets.only(left: 8.0, top: 2),
                                  child: Text(
                                    "• ${(tier["benefits"] as List)[i]}",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              // 👈 Left Arrow (only if not first page)
              ValueListenableBuilder<int>(
                valueListenable: currentPage,
                builder: (context, page, _) {
                  if (page == 0) return const SizedBox.shrink();
                  return Positioned(
                    left: 8,
                    child: GestureDetector(
                      onTap: () {
                        final prevPage = page - 1;
                        if (prevPage >= 0) {
                          _pageController.animateToPage(
                            prevPage,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.05),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 22,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  );
                },
              ),

              // 👉 Right Arrow (only if not last page)
              ValueListenableBuilder<int>(
                valueListenable: currentPage,
                builder: (context, page, _) {
                  if (page == tiers.length - 1) return const SizedBox.shrink();
                  return Positioned(
                    right: 8,
                    child: GestureDetector(
                      onTap: () {
                        final nextPage = page + 1;
                        if (nextPage < tiers.length) {
                          _pageController.animateToPage(
                            nextPage,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.05),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 22,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  // History tab
  Widget _buildHistoryTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: history.length,
      itemBuilder: (context, index) {
        final entry = history[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 4,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: ListTile(
            title: Text(entry["date"]!,
                style:
                GoogleFonts.poppins(fontWeight: FontWeight.w500)),
            subtitle: Text("Points: ${entry["points"]}"),
            trailing: Text(entry["amount"]!,
                style:
                GoogleFonts.poppins(fontWeight: FontWeight.bold)),
          ),
        );
      },
    );
  }
}
