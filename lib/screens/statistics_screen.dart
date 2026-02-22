import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Statistics', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
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
                  Icon(Icons.bar_chart, size: 50, color: Colors.white),
                  const SizedBox(height: 12),
                  Text('Your Activity', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 8),
                  Text('Track your coin collecting journey', style: GoogleFonts.poppins(fontSize: 13, color: Colors.white.withValues(alpha: 0.9))),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: _buildStatCard('42', 'Total Scans', Icons.camera_alt, Colors.blue)),
                const SizedBox(width: 12),
                Expanded(child: _buildStatCard('28', 'Saved Coins', Icons.bookmark, Colors.green)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _buildStatCard('15', 'Shared', Icons.share, Colors.orange)),
                const SizedBox(width: 12),
                Expanded(child: _buildStatCard('\$45K', 'Total Value', Icons.attach_money, AppColors.gold)),
              ],
            ),
            const SizedBox(height: 20),
            Text('Collection Breakdown', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark)),
            const SizedBox(height: 12),
            _buildCategoryBar('Gold Coins', 12, 28, Colors.amber),
            _buildCategoryBar('Silver Coins', 8, 28, Colors.grey),
            _buildCategoryBar('Ancient Coins', 5, 28, Colors.brown),
            _buildCategoryBar('Modern Coins', 3, 28, Colors.blue),
            const SizedBox(height: 20),
            Text('Monthly Activity', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark)),
            const SizedBox(height: 12),
            _buildMonthCard('January', 8, 5, 2),
            _buildMonthCard('February', 12, 8, 4),
            _buildMonthCard('March', 15, 10, 6),
            _buildMonthCard('April', 7, 5, 3),
            const SizedBox(height: 20),
            _buildAchievementsCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String value, String label, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, color.withValues(alpha: 0.05)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.2), width: 1.5),
        boxShadow: [BoxShadow(color: color.withValues(alpha: 0.2), blurRadius: 15, offset: const Offset(0, 5))],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
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
            child: Icon(icon, color: Colors.white, size: 28),
          ),
          const SizedBox(height: 12),
          Text(value, style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textDark)),
          Text(label, style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textGray), textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildCategoryBar(String category, int count, int total, Color color) {
    final percentage = (count / total * 100).toInt();
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(category, style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.textDark)),
              Text('$count coins ($percentage%)', style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textGray)),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: count / total,
              backgroundColor: Colors.grey.shade200,
              color: color,
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthCard(String month, int scans, int saved, int shared) {
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
            decoration: BoxDecoration(color: AppColors.lightGold.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(12)),
            child: Icon(Icons.calendar_month, color: AppColors.gold, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(month, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textDark)),
                const SizedBox(height: 4),
                Text('$scans scans • $saved saved • $shared shared', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textGray)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementsCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.purple.shade700, Colors.purple.shade900]),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.purple.withValues(alpha: 0.3), blurRadius: 15, offset: const Offset(0, 5))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.emoji_events, color: Colors.white, size: 28),
              const SizedBox(width: 12),
              Text('Recent Achievements', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
            ],
          ),
          const SizedBox(height: 16),
          _buildAchievementRow('🎯', 'First Scan', 'Completed'),
          _buildAchievementRow('💎', 'Collector', 'Saved 10 coins'),
          _buildAchievementRow('🏆', 'Expert', 'Scanned 50 coins'),
        ],
      ),
    );
  }

  Widget _buildAchievementRow(String emoji, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)),
                Text(subtitle, style: GoogleFonts.poppins(fontSize: 12, color: Colors.white.withValues(alpha: 0.8))),
              ],
            ),
          ),
          Icon(Icons.check_circle, color: Colors.white, size: 20),
        ],
      ),
    );
  }
}
