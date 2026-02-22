import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';

class SavedCoinsScreen extends StatelessWidget {
  const SavedCoinsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final savedCoins = [
      {'name': '1933 Double Eagle', 'value': '\$18.9M', 'icon': '💎', 'year': '1933', 'grade': 'MS-65', 'metal': 'Gold', 'weight': '33.4g', 'rarity': 'Extremely Rare'},
      {'name': 'Roman Denarius', 'value': '\$5,000', 'icon': '🏛️', 'year': '211 AD', 'grade': 'VF-20', 'metal': 'Silver', 'weight': '3.4g', 'rarity': 'Rare'},
      {'name': 'Gold Krugerrand', 'value': '\$1,850', 'icon': '🌍', 'year': '1980', 'grade': 'MS-68', 'metal': 'Gold', 'weight': '33.9g', 'rarity': 'Common'},
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Saved Coins', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: savedCoins.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.bookmark_border, size: 80, color: AppColors.textGray.withValues(alpha: 0.3)),
                  const SizedBox(height: 16),
                  Text('No saved coins yet', style: GoogleFonts.poppins(fontSize: 16, color: AppColors.textGray)),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: savedCoins.length,
              itemBuilder: (context, index) {
                final coin = savedCoins[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, AppColors.lightGold.withValues(alpha: 0.08)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(color: AppColors.gold.withValues(alpha: 0.15), blurRadius: 10, offset: const Offset(0, 3))],
                    border: Border.all(color: AppColors.lightGold.withValues(alpha: 0.3), width: 1),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              gradient: AppColors.goldGradient,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(child: Text(coin['icon']!, style: const TextStyle(fontSize: 32))),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(coin['name']!, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textDark)),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(Icons.attach_money, size: 14, color: AppColors.gold),
                                    Text(coin['value']!, style: GoogleFonts.poppins(fontSize: 13, color: AppColors.gold, fontWeight: FontWeight.w600)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.bookmark, color: AppColors.gold),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildInfoColumn('Year', coin['year']!, Icons.event),
                                _buildInfoColumn('Grade', coin['grade']!, Icons.grade),
                                _buildInfoColumn('Metal', coin['metal']!, Icons.diamond),
                                _buildInfoColumn('Weight', coin['weight']!, Icons.scale),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: _getRarityColor(coin['rarity']!).withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.star, size: 14, color: _getRarityColor(coin['rarity']!)),
                                  const SizedBox(width: 4),
                                  Text('Rarity: ${coin['rarity']}', style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: _getRarityColor(coin['rarity']!))),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 16, color: AppColors.gold),
        const SizedBox(height: 4),
        Text(label, style: GoogleFonts.poppins(fontSize: 10, color: AppColors.textGray)),
        Text(value, style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.textDark)),
      ],
    );
  }

  Color _getRarityColor(String rarity) {
    switch (rarity) {
      case 'Extremely Rare':
        return Colors.red;
      case 'Rare':
        return Colors.orange;
      case 'Uncommon':
        return Colors.blue;
      default:
        return Colors.green;
    }
  }
}
