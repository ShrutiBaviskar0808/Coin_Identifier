import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';

class CompareScreen extends StatelessWidget {
  const CompareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Compare Coins', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
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
                gradient: LinearGradient(colors: [Colors.cyan.shade700, Colors.cyan.shade900]),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.cyan.withValues(alpha: 0.3), blurRadius: 20, offset: const Offset(0, 10))],
              ),
              child: Column(
                children: [
                  Icon(Icons.compare_arrows, size: 50, color: Colors.white),
                  const SizedBox(height: 12),
                  Text('Compare Coins', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 8),
                  Text('Side-by-side comparison of coin features', style: GoogleFonts.poppins(fontSize: 13, color: Colors.white.withValues(alpha: 0.9))),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: _buildCoinCard('American Gold Eagle', '🦅', '\$2,100', '91.67% Gold', '33.93g', Colors.blue)),
                const SizedBox(width: 12),
                Expanded(child: _buildCoinCard('Canadian Maple', '🍁', '\$1,850', '99.99% Gold', '31.10g', Colors.red)),
              ],
            ),
            const SizedBox(height: 20),
            _buildComparisonRow('Value', '\$2,100', '\$1,850', Colors.green),
            _buildComparisonRow('Purity', '91.67%', '99.99%', Colors.orange),
            _buildComparisonRow('Weight', '33.93g', '31.10g', Colors.blue),
            _buildComparisonRow('Diameter', '32.7mm', '30mm', Colors.purple),
            _buildComparisonRow('Year', '2023', '2023', Colors.teal),
            const SizedBox(height: 20),
            _buildSummaryCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildCoinCard(String name, String icon, String price, String purity, String weight, Color color) {
    return Container(
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
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [color, color.withValues(alpha: 0.8)]),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.4),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Center(child: Text(icon, style: const TextStyle(fontSize: 32))),
          ),
          const SizedBox(height: 12),
          Text(name, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textDark), textAlign: TextAlign.center),
          const SizedBox(height: 8),
          Text(price, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.gold)),
        ],
      ),
    );
  }

  Widget _buildComparisonRow(String label, String value1, String value2, Color color) {
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
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: color.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(8)),
            child: Icon(Icons.info_outline, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(label, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textDark))),
          Text(value1, style: GoogleFonts.poppins(fontSize: 14, color: AppColors.textGray)),
          const SizedBox(width: 8),
          Icon(Icons.compare_arrows, size: 16, color: AppColors.textGray),
          const SizedBox(width: 8),
          Text(value2, style: GoogleFonts.poppins(fontSize: 14, color: AppColors.textGray)),
        ],
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.goldGradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: AppColors.gold.withValues(alpha: 0.3), blurRadius: 15, offset: const Offset(0, 5))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Comparison Summary', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 12),
          Text('• Canadian Maple has higher purity (99.99%)\n• American Eagle has higher value (\$2,100)\n• American Eagle is heavier (33.93g)\n• Both are excellent investment options', style: GoogleFonts.poppins(fontSize: 13, color: Colors.white, height: 1.6)),
        ],
      ),
    );
  }
}
