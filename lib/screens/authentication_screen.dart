import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: Colors.orange,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Authentication Guide', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16)),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Colors.orange, Colors.deepOrange]),
                    ),
                  ),
                  Positioned(right: -30, top: 30, child: Icon(Icons.verified_user, size: 150, color: Colors.white.withValues(alpha: 0.1))),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.verified_user, size: 50, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildGuideCard('Check Weight & Dimensions', 'Authentic coins have precise specifications. Use a digital scale and caliper to verify weight and diameter match official records.', Icons.straighten, Colors.blue),
                _buildGuideCard('Examine Edge Details', 'Look at the coin\'s edge (reeding). Counterfeit coins often have poorly defined or incorrect edge patterns.', Icons.panorama_horizontal, Colors.green),
                _buildGuideCard('Magnet Test', 'Most genuine coins are not magnetic. If a coin sticks to a magnet, it\'s likely fake (except for some steel coins).', Icons.attractions, Colors.red),
                _buildGuideCard('Sound Test', 'Genuine coins produce a clear, bell-like ring when tapped. Counterfeit coins sound dull or flat.', Icons.music_note, Colors.purple),
                _buildGuideCard('Visual Inspection', 'Use a magnifying glass to check for: sharp details, correct font, proper spacing, and no casting bubbles.', Icons.search, Colors.teal),
                _buildGuideCard('Compare with Authentic', 'Side-by-side comparison with a known authentic coin is one of the best authentication methods.', Icons.compare, Colors.indigo),
                _buildGuideCard('Check for Wear Patterns', 'Genuine coins show natural wear on high points. Artificial aging looks uniform and unnatural.', Icons.texture, Colors.brown),
                _buildGuideCard('Professional Grading', 'For valuable coins, always get professional authentication from PCGS, NGC, or ANACS.', Icons.verified, AppColors.gold),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGuideCard(String title, String description, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, color.withValues(alpha: 0.05)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.2), width: 1.5),
        boxShadow: [BoxShadow(color: color.withValues(alpha: 0.15), blurRadius: 15, offset: const Offset(0, 5))],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [color, color.withValues(alpha: 0.8)]),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.4),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textDark)),
                const SizedBox(height: 8),
                Text(description, style: GoogleFonts.poppins(fontSize: 14, color: AppColors.textGray, height: 1.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
