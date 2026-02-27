import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ads/banner_ads_widget.dart';
import '../ads/native_ads_widget.dart';
import '../utils/constants.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('About', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          const BannerAds(),
          Expanded(
            child: SafeArea(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: AppColors.goldGradient,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: AppColors.gold.withValues(alpha: 0.3), blurRadius: 20, offset: const Offset(0, 10))],
              ),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                    child: Icon(Icons.monetization_on, size: 50, color: AppColors.gold),
                  ),
                  const SizedBox(height: 16),
                  Text('Coin Identifier', style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 8),
                  Text('Version 1.0.0', style: GoogleFonts.poppins(fontSize: 14, color: Colors.white.withValues(alpha: 0.9))),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildInfoSection('About the App', 'Coin Identifier is your ultimate companion for identifying, collecting, and learning about coins from around the world. Using advanced AI technology and a comprehensive database of over 100,000 coins, we help collectors, enthusiasts, and curious minds discover the fascinating world of numismatics.'),
            _buildFeaturesList(),
            _buildInfoSection('Our Mission', 'To make coin collecting accessible and enjoyable for everyone. We believe that every coin tells a story, and our mission is to help you discover those stories through cutting-edge technology and educational resources.'),
            const SizedBox(height: 20),
            const NativeAdsWidgets(padding: 10),
            const SizedBox(height: 20),
            _buildInfoSection('Technology', 'Our app uses state-of-the-art machine learning algorithms trained on millions of coin images. The AI model continuously learns and improves, ensuring accurate identification of coins from different eras, countries, and conditions.'),
            _buildInfoSection('Database', 'Our extensive database includes:\n\n• Ancient coins from civilizations dating back 2,500 years\n• Modern coins from over 195 countries\n• Commemorative and special edition coins\n• Error coins and rare variants\n• Historical context and market values'),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 3))],
              ),
              child: Column(
                children: [
                  Text('© 2024 Coin Identifier', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textDark)),
                  const SizedBox(height: 8),
                  Text('All rights reserved', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textGray)),
                  const SizedBox(height: 16),
                  Text('Made with ❤️ for coin collectors worldwide', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textGray)),
                ],
              ),
            ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection(String title, String content) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark)),
          const SizedBox(height: 12),
          Text(content, style: GoogleFonts.poppins(fontSize: 14, color: AppColors.textDark, height: 1.6), textAlign: TextAlign.justify),
        ],
      ),
    );
  }

  Widget _buildFeaturesList() {
    final features = [
      {'icon': Icons.camera_alt, 'title': 'AI-Powered Recognition', 'desc': 'Instant coin identification using advanced AI'},
      {'icon': Icons.storage, 'title': 'Extensive Database', 'desc': '100,000+ coins from around the world'},
      {'icon': Icons.trending_up, 'title': 'Market Value Tracking', 'desc': 'Real-time pricing and value estimates'},
      {'icon': Icons.school, 'title': 'Educational Resources', 'desc': 'Learn about history and numismatics'},
      {'icon': Icons.collections, 'title': 'Collection Management', 'desc': 'Organize and track your coin collection'},
      {'icon': Icons.share, 'title': 'Share & Connect', 'desc': 'Share discoveries with fellow collectors'},
    ];

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Key Features', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark)),
          const SizedBox(height: 16),
          ...features.map((feature) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: AppColors.lightGold.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(10)),
                  child: Icon(feature['icon'] as IconData, color: AppColors.gold, size: 22),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(feature['title'] as String, style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.textDark)),
                      Text(feature['desc'] as String, style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textGray)),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
