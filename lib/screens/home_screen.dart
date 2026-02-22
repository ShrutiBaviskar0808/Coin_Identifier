import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';
import 'scan_screen.dart';
import 'collection_screen.dart';
import 'compare_screen.dart';
import 'market_screen.dart';
import 'learn_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Coin Identifier',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textDark,
                          ),
                        ),
                        Text(
                          'Discover & Collect',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: AppColors.textGray,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.settings_outlined),
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen())),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                _buildScanCard(context),
                const SizedBox(height: 30),
                Text(
                  'Explore',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 20),
                _buildFeatureGrid(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScanCard(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ScanScreen())),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          gradient: AppColors.goldGradient,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: AppColors.gold.withValues(alpha: 0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: Icon(Icons.monetization_on, size: 150, color: Colors.white.withValues(alpha: 0.2)),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.camera_alt, size: 40, color: Colors.white),
                  const SizedBox(height: 16),
                  Text(
                    'Scan a Coin',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Identify any coin instantly',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureGrid(BuildContext context) {
    final features = [
      {'icon': Icons.collections_outlined, 'title': 'My Collection', 'screen': const CollectionScreen()},
      {'icon': Icons.compare_arrows, 'title': 'Compare', 'screen': const CompareScreen()},
      {'icon': Icons.trending_up, 'title': 'Market Insights', 'screen': const MarketScreen()},
      {'icon': Icons.school_outlined, 'title': 'Learn', 'screen': const LearnScreen()},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.1,
      ),
      itemCount: features.length,
      itemBuilder: (context, index) {
        final feature = features[index];
        return GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => feature['screen'] as Widget)),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: AppColors.goldGradient,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(feature['icon'] as IconData, size: 30, color: Colors.white),
                ),
                const SizedBox(height: 16),
                Text(
                  feature['title'] as String,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
