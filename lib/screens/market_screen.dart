import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Market Insights',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  _buildMarketCard('Gold', '+2.5%', '\$2,100/oz', true, '\$2,050', '\$2,150', '52-Week: \$1,800 - \$2,200'),
                  const SizedBox(height: 16),
                  _buildMarketCard('Silver', '-0.8%', '\$25/oz', false, '\$26', '\$24.50', '52-Week: \$20 - \$28'),
                  const SizedBox(height: 16),
                  _buildMarketCard('Platinum', '+1.2%', '\$1,050/oz', true, '\$1,030', '\$1,065', '52-Week: \$900 - \$1,100'),
                  const SizedBox(height: 24),
                  Text('Trending Coins', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark)),
                  const SizedBox(height: 12),
                  _buildCoinCard('American Eagle', '\$2,150', '+3.2%', '1 oz Gold', true),
                  const SizedBox(height: 12),
                  _buildCoinCard('Canadian Maple', '\$2,140', '+2.8%', '1 oz Gold', true),
                  const SizedBox(height: 12),
                  _buildCoinCard('Morgan Dollar', '\$45', '-1.5%', 'Silver', false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMarketCard(String metal, String change, String price, bool isUp, String open, String high, String range) {
    final cardColor = isUp ? Colors.green : Colors.red;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, cardColor.withValues(alpha: 0.03)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: cardColor.withValues(alpha: 0.2), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: cardColor.withValues(alpha: 0.15),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [cardColor, cardColor.withValues(alpha: 0.7)]),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: cardColor.withValues(alpha: 0.4),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Icon(isUp ? Icons.trending_up : Icons.trending_down, size: 32, color: Colors.white),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(metal, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textDark)),
                    Text(price, style: GoogleFonts.poppins(fontSize: 14, color: AppColors.textGray)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: (isUp ? Colors.green : Colors.red).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(change, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold, color: isUp ? Colors.green : Colors.red)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMetricColumn('Open', open),
              _buildMetricColumn('High', high),
              Expanded(child: Text(range, style: GoogleFonts.poppins(fontSize: 11, color: AppColors.textGray), textAlign: TextAlign.center)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricColumn(String label, String value) {
    return Column(
      children: [
        Text(label, style: GoogleFonts.poppins(fontSize: 11, color: AppColors.textGray)),
        const SizedBox(height: 4),
        Text(value, style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textDark)),
      ],
    );
  }

  Widget _buildCoinCard(String name, String price, String change, String type, bool isUp) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, AppColors.lightGold.withValues(alpha: 0.05)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.gold.withValues(alpha: 0.15)),
        boxShadow: [BoxShadow(color: AppColors.gold.withValues(alpha: 0.1), blurRadius: 15, offset: const Offset(0, 5))],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.lightGold.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.monetization_on, color: AppColors.gold, size: 28),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.textDark)),
                Text(type, style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textGray)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(price, style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.textDark)),
              Text(change, style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: isUp ? Colors.green : Colors.red)),
            ],
          ),
        ],
      ),
    );
  }
}
