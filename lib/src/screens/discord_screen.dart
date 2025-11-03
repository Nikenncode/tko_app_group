import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/custom_bottom_nav.dart';

class DiscordScreen extends StatelessWidget {
  const DiscordScreen({super.key});

  final String discordUrl = "https://discord.com/invite/M8HZwrdjp7";

  Future<void> _launchDiscord() async {
    final Uri url = Uri.parse("https://discord.com/invite/M8HZwrdjp7");
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not open Discord link");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: const CustomBottomNav(currentIndex: -1),
      appBar: AppBar(
        title: Text(
          "Join Our Community",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // --- Title ---
            Text(
              "Connect | Chat | Compete!",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF5865F2), // ✅ Correct way to use custom hex color
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Join the official TKO Toy Co. Discord community and stay updated with live events, exclusive drops, and connect with other collectors!",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 30),

            // --- Discord Image ---
            Image.asset(
              'assets/discord_logo.png', // 👈 Add this image in your assets folder
              height: 150,
            ),
            const SizedBox(height: 30),

            Text(
              "Discord",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 30),

            // --- Discord Button ---
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _launchDiscord,
                icon: Image.asset(
                  'assets/logo/discord_icon.png', // smaller Discord logo
                  height: 28,
                ),
                label: Text(
                  "Join our Discord Server",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5865F2), // Discord blue
                  foregroundColor: Colors.white,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "Be part of the TKO community — where collectors become champions!",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
