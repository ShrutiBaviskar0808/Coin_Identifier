import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Coin News', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildNewsCard('Rare 1943 Penny Sells for \$1.7 Million', 'A rare 1943 bronze Lincoln penny sold at auction for a record-breaking price. Only 20 are known to exist.', '2 hours ago', Icons.trending_up, Colors.green),
            _buildNewsCard('New Gold Coin Series Announced', 'The US Mint announces a new commemorative gold coin series celebrating American innovation.', '5 hours ago', Icons.new_releases, Colors.blue),
            _buildNewsCard('Ancient Roman Coins Discovered', 'Archaeologists uncover a treasure trove of Roman coins dating back to 300 AD in England.', '1 day ago', Icons.explore, Colors.orange),
            _buildNewsCard('Cryptocurrency Meets Physical Coins', 'New blockchain-backed physical coins combine traditional collecting with digital verification.', '2 days ago', Icons.currency_bitcoin, Colors.purple),
            _buildNewsCard('Coin Grading Standards Updated', 'PCGS announces updated grading standards for better consistency in coin authentication.', '3 days ago', Icons.update, AppColors.gold),
            _buildNewsCard('Record Attendance at Coin Show', 'The annual World Coin Fair sees record-breaking attendance with over 50,000 visitors.', '4 days ago', Icons.people, Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsCard(String title, String description, String time, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, color.withValues(alpha: 0.03)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.2), width: 1.5),
        boxShadow: [BoxShadow(color: color.withValues(alpha: 0.15), blurRadius: 15, offset: const Offset(0, 5))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [color.withValues(alpha: 0.15), color.withValues(alpha: 0.08)]),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [color, color.withValues(alpha: 0.8)]),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: color.withValues(alpha: 0.4),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(icon, color: Colors.white, size: 24),
                ),
                const SizedBox(width: 12),
                Expanded(child: Text(title, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textDark))),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(description, style: GoogleFonts.poppins(fontSize: 14, color: AppColors.textGray, height: 1.5)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 14, color: AppColors.textGray),
                    const SizedBox(width: 4),
                    Text(time, style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textGray)),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text('Read More', style: GoogleFonts.poppins(color: color, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
