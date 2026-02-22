import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Achievements', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildProgressCard(),
          const SizedBox(height: 20),
          Text('Unlocked Badges', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark)),
          const SizedBox(height: 16),
          _buildAchievementItem('First Scan', 'Scanned your first coin', '🎯', true, Colors.green),
          _buildAchievementItem('Collector', 'Saved 10 coins', '💎', true, Colors.blue),
          _buildAchievementItem('Expert', 'Scanned 50 coins', '🏆', true, AppColors.gold),
          const SizedBox(height: 20),
          Text('Locked Badges', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark)),
          const SizedBox(height: 16),
          _buildAchievementItem('Master', 'Scan 100 coins', '👑', false, Colors.grey),
          _buildAchievementItem('Historian', 'Learn about 20 ancient coins', '📜', false, Colors.grey),
          _buildAchievementItem('Trader', 'Check market value 30 times', '💰', false, Colors.grey),
          _buildAchievementItem('Scholar', 'Complete all quizzes', '🎓', false, Colors.grey),
        ],
      ),
    );
  }

  Widget _buildProgressCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: AppColors.goldGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: AppColors.gold.withValues(alpha: 0.3), blurRadius: 20, offset: const Offset(0, 10))],
      ),
      child: Column(
        children: [
          Text('Your Progress', style: GoogleFonts.poppins(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatColumn('3', 'Badges', Colors.white),
              Container(width: 1, height: 40, color: Colors.white.withValues(alpha: 0.3)),
              _buildStatColumn('42', 'Scans', Colors.white),
              Container(width: 1, height: 40, color: Colors.white.withValues(alpha: 0.3)),
              _buildStatColumn('Level 5', 'Rank', Colors.white),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String value, String label, Color color) {
    return Column(
      children: [
        Text(value, style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
        Text(label, style: GoogleFonts.poppins(fontSize: 12, color: color.withValues(alpha: 0.9))),
      ],
    );
  }

  Widget _buildAchievementItem(String title, String description, String emoji, bool unlocked, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: unlocked ? color.withValues(alpha: 0.3) : Colors.grey.withValues(alpha: 0.2)),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: unlocked ? color.withValues(alpha: 0.2) : Colors.grey.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(child: Text(emoji, style: TextStyle(fontSize: 32, color: unlocked ? null : Colors.grey))),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: unlocked ? AppColors.textDark : Colors.grey)),
                const SizedBox(height: 4),
                Text(description, style: GoogleFonts.poppins(fontSize: 13, color: unlocked ? AppColors.textGray : Colors.grey)),
              ],
            ),
          ),
          if (unlocked) Icon(Icons.check_circle, color: color, size: 24),
        ],
      ),
    );
  }
}
