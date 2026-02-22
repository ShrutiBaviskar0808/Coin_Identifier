import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';

class GradingGuideScreen extends StatelessWidget {
  const GradingGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Grading Guide', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: AppColors.goldGradient,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: AppColors.gold.withValues(alpha: 0.3), blurRadius: 20, offset: const Offset(0, 10))],
              ),
              child: Column(
                children: [
                  Icon(Icons.grade, size: 50, color: Colors.white),
                  const SizedBox(height: 12),
                  Text('Coin Grading Scale', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 8),
                  Text('Learn how to grade coins like a professional', style: GoogleFonts.poppins(fontSize: 13, color: Colors.white.withValues(alpha: 0.9)), textAlign: TextAlign.center),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildGradeCard('MS-70 (Perfect)', 'Flawless coin with no visible imperfections under 5x magnification', Colors.green),
            _buildGradeCard('MS-65 to MS-69 (Gem)', 'Excellent strike with minimal contact marks', Colors.blue),
            _buildGradeCard('MS-60 to MS-64 (Uncirculated)', 'No wear but may have contact marks or weak strike', Colors.orange),
            _buildGradeCard('AU-50 to AU-58 (About Uncirculated)', 'Slight wear on highest points, retains most luster', Colors.amber),
            _buildGradeCard('XF-40 to XF-45 (Extremely Fine)', 'Light wear on high points, all details sharp', Colors.deepOrange),
            _buildGradeCard('VF-20 to VF-35 (Very Fine)', 'Moderate wear, major features clear', Colors.red),
            _buildGradeCard('F-12 to F-15 (Fine)', 'Moderate to heavy wear, all lettering visible', Colors.brown),
            _buildGradeCard('VG-8 to VG-10 (Very Good)', 'Heavy wear, design still identifiable', Colors.grey),
            const SizedBox(height: 20),
            _buildTipsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildGradeCard(String grade, String description, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, color.withValues(alpha: 0.05)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1.5),
        boxShadow: [BoxShadow(color: color.withValues(alpha: 0.2), blurRadius: 15, offset: const Offset(0, 5))],
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [color, color.withValues(alpha: 0.8)]),
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.4),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Icon(Icons.star, color: Colors.white, size: 30),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(grade, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textDark)),
                const SizedBox(height: 4),
                Text(description, style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textGray)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipsSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.lightbulb, color: AppColors.gold, size: 24),
              const SizedBox(width: 8),
              Text('Grading Tips', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark)),
            ],
          ),
          const SizedBox(height: 12),
          Text('• Use proper lighting and magnification\n• Check both obverse and reverse sides\n• Look for wear on highest points first\n• Consider strike quality and luster\n• Note any scratches, dents, or cleaning\n• Compare with graded examples\n• When in doubt, get professional grading', style: GoogleFonts.poppins(fontSize: 14, color: AppColors.textDark, height: 1.8)),
        ],
      ),
    );
  }
}
