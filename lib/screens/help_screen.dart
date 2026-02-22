import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Help & Support', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildContactCard('Email Support', 'support@coinidentifier.com', 'Get response within 24 hours', Icons.email, Colors.blue),
            _buildContactCard('Phone Support', '+1 (800) 123-4567', 'Available Mon-Fri, 9AM-6PM EST', Icons.phone, Colors.green),
            _buildContactCard('Live Chat', 'Chat with us now', 'Available 24/7 for instant help', Icons.chat_bubble, AppColors.gold),
            const SizedBox(height: 20),
            Text('Frequently Asked Questions', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark)),
            const SizedBox(height: 16),
            _buildFAQ('How do I scan a coin?', 'Tap the Scan button in the bottom navigation, allow camera permission, place the coin inside the circle, and tap the capture button. The app will automatically identify the coin.'),
            _buildFAQ('How accurate is the coin identification?', 'Our AI-powered system has over 95% accuracy rate. It uses advanced machine learning algorithms trained on millions of coin images from around the world.'),
            _buildFAQ('Can I use the app offline?', 'Basic features like viewing saved coins work offline. However, scanning new coins and accessing market values require an internet connection.'),
            _buildFAQ('How is the coin value calculated?', 'Coin values are based on real-time market data from multiple sources including auction houses, dealers, and online marketplaces. Values are updated daily.'),
            _buildFAQ('Is my collection data backed up?', 'Yes, all your data is automatically backed up to secure cloud storage. You can access your collection from any device by logging in with your account.'),
            _buildFAQ('How do I delete my account?', 'Go to Profile > Privacy & Security > Delete Account. Please note this action is permanent and cannot be undone.'),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard(String title, String contact, String availability, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.3)),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: color.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textDark)),
                const SizedBox(height: 4),
                Text(contact, style: GoogleFonts.poppins(fontSize: 14, color: color, fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(availability, style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textGray)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQ(String question, String answer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
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
              Icon(Icons.help_outline, color: AppColors.gold, size: 20),
              const SizedBox(width: 8),
              Expanded(child: Text(question, style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.textDark))),
            ],
          ),
          const SizedBox(height: 8),
          Text(answer, style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textGray, height: 1.5), textAlign: TextAlign.justify),
        ],
      ),
    );
  }
}
