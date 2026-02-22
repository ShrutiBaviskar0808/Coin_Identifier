import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Authentication', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
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
                gradient: LinearGradient(colors: [Colors.red.shade700, Colors.red.shade900]),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.red.withValues(alpha: 0.3), blurRadius: 20, offset: const Offset(0, 10))],
              ),
              child: Column(
                children: [
                  Icon(Icons.verified_user, size: 50, color: Colors.white),
                  const SizedBox(height: 12),
                  Text('Spot Fake Coins', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 8),
                  Text('Learn to identify counterfeit coins', style: GoogleFonts.poppins(fontSize: 13, color: Colors.white.withValues(alpha: 0.9)), textAlign: TextAlign.center),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text('Red Flags', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark)),
            const SizedBox(height: 12),
            _buildWarningCard('Wrong Weight', 'Counterfeit coins often have incorrect weight. Use a precision scale.', Icons.scale),
            _buildWarningCard('Poor Details', 'Blurry or missing details indicate a fake. Check fine lines and text.', Icons.blur_on),
            _buildWarningCard('Wrong Color', 'Incorrect metal composition shows wrong color or patina.', Icons.palette),
            _buildWarningCard('Suspicious Edge', 'Check edge reeding and thickness. Fakes often have smooth edges.', Icons.panorama_horizontal),
            const SizedBox(height: 20),
            Text('Authentication Methods', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark)),
            const SizedBox(height: 12),
            _buildMethodCard('Magnet Test', 'Most coins are not magnetic. If attracted to magnet, likely fake.', Icons.attractions, Colors.blue),
            _buildMethodCard('Sound Test', 'Genuine coins produce a clear ring when dropped. Fakes sound dull.', Icons.music_note, Colors.green),
            _buildMethodCard('Microscope', 'Examine under magnification for casting bubbles or tool marks.', Icons.search, Colors.orange),
            _buildMethodCard('Professional Grading', 'Send to PCGS, NGC, or ANACS for certified authentication.', Icons.workspace_premium, AppColors.gold),
          ],
        ),
      ),
    );
  }

  Widget _buildWarningCard(String title, String description, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.red.withValues(alpha: 0.3)),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.red.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: Colors.red, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textDark)),
                const SizedBox(height: 4),
                Text(description, style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textGray)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMethodCard(String title, String description, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: color.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textDark)),
                const SizedBox(height: 4),
                Text(description, style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textGray)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
