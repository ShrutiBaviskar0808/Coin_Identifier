import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ads/native_ads_widget.dart';
import '../utils/constants.dart';

class InvestmentTipsScreen extends StatelessWidget {
  const InvestmentTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: Colors.purple,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Investment Tips', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16)),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Colors.purple, Colors.deepPurple]),
                    ),
                  ),
                  Positioned(right: -30, top: 30, child: Icon(Icons.lightbulb, size: 150, color: Colors.white.withValues(alpha: 0.1))),
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
                          child: Icon(Icons.lightbulb, size: 50, color: Colors.white),
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
                _buildTipCard('Start with Bullion Coins', 'Begin with government-issued bullion coins like American Eagles or Canadian Maples. They\'re liquid, widely recognized, and easy to authenticate.', Icons.stars, Colors.amber),
                _buildTipCard('Buy the Grade, Not the Holder', 'Focus on the coin\'s actual condition, not just the grading company label. Learn to grade coins yourself.', Icons.grade, Colors.blue),
                _buildTipCard('Diversify Your Collection', 'Don\'t put all funds into one type. Mix gold, silver, ancient, and modern coins to spread risk.', Icons.dashboard, Colors.green),
                _buildTipCard('Condition is King', 'Higher grade coins appreciate faster. A coin in MS-65 condition is worth much more than MS-60.', Icons.auto_awesome, Colors.orange),
                _buildTipCard('Research Before Buying', 'Study mintage numbers, historical significance, and market trends. Knowledge prevents costly mistakes.', Icons.menu_book, Colors.indigo),
                _buildTipCard('Buy from Reputable Dealers', 'Stick with established dealers and auction houses. Avoid deals that seem too good to be true.', Icons.store, Colors.teal),
                _buildTipCard('Store Properly', 'Use proper holders, avoid PVC, control humidity. Poor storage can damage valuable coins.', Icons.inventory, Colors.brown),
                _buildTipCard('Think Long-Term', 'Coin collecting is a marathon, not a sprint. The best returns come from patience and strategic buying.', Icons.trending_up, Colors.purple),
                _buildTipCard('Document Everything', 'Keep detailed records of purchases, including receipts, certificates, and photos. Essential for insurance and resale.', Icons.description, Colors.red),
                const SizedBox(height: 20),
                const NativeAdsWidgets(padding: 16),
                const SizedBox(height: 20),
                _buildTipCard('Join Collector Communities', 'Network with other collectors, attend coin shows, join clubs. Learn from experienced collectors.', Icons.groups, Colors.cyan),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipCard(String title, String description, IconData icon, Color color) {
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
