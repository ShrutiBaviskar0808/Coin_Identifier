import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';

class CompareScreen extends StatefulWidget {
  const CompareScreen({super.key});

  @override
  State<CompareScreen> createState() => _CompareScreenState();
}

class _CompareScreenState extends State<CompareScreen> {
  Map<String, dynamic>? _coin1;
  Map<String, dynamic>? _coin2;

  final _sampleCoins = [
    {'name': '1909-S VDB Lincoln Cent', 'value': '\$2,500', 'year': '1909', 'metal': 'Bronze', 'weight': '3.11g', 'diameter': '19mm', 'rarity': 'Very Rare'},
    {'name': '1964 Kennedy Half Dollar', 'value': '\$12', 'year': '1964', 'metal': 'Silver', 'weight': '12.5g', 'diameter': '30.6mm', 'rarity': 'Common'},
    {'name': '1933 Double Eagle', 'value': '\$18.9M', 'year': '1933', 'metal': 'Gold', 'weight': '33.4g', 'diameter': '34mm', 'rarity': 'Extremely Rare'},
    {'name': 'Morgan Silver Dollar', 'value': '\$45', 'year': '1921', 'metal': 'Silver', 'weight': '26.7g', 'diameter': '38.1mm', 'rarity': 'Uncommon'},
    {'name': 'Buffalo Nickel', 'value': '\$8', 'year': '1937', 'metal': 'Copper-Nickel', 'weight': '5g', 'diameter': '21.2mm', 'rarity': 'Common'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Compare Coins', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: _buildCoinSelector(1)),
                const SizedBox(width: 12),
                Expanded(child: _buildCoinSelector(2)),
              ],
            ),
            if (_coin1 != null && _coin2 != null) ...[
              const SizedBox(height: 24),
              _buildComparisonTable(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildCoinSelector(int coinNumber) {
    final selectedCoin = coinNumber == 1 ? _coin1 : _coin2;
    return InkWell(
      onTap: () => _selectCoin(coinNumber),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: selectedCoin != null ? AppColors.gold : Colors.grey.shade300, width: 2),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)],
        ),
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.lightGold.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: selectedCoin != null
                    ? const Icon(Icons.monetization_on, size: 40, color: Colors.grey)
                    : Icon(Icons.add, size: 40, color: AppColors.gold),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              selectedCoin != null ? selectedCoin['name'] : 'Select Coin $coinNumber',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: selectedCoin != null ? AppColors.textDark : AppColors.textGray,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectCoin(int coinNumber) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Select Coin $coinNumber', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ..._sampleCoins.map((coin) => ListTile(
              leading: CircleAvatar(backgroundColor: AppColors.lightGold.withValues(alpha: 0.2), child: const Icon(Icons.monetization_on, color: Colors.grey)),
              title: Text(coin['name']!, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600)),
              subtitle: Text(coin['value']!, style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textGray)),
              onTap: () {
                setState(() => coinNumber == 1 ? _coin1 = coin : _coin2 = coin);
                Navigator.pop(context);
              },
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildComparisonTable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 15)],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: AppColors.goldGradient,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              children: [
                const Icon(Icons.compare_arrows, color: Colors.white, size: 24),
                const SizedBox(width: 8),
                Text('Comparison', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              ],
            ),
          ),
          _buildComparisonRow('Value', _coin1!['value']!, _coin2!['value']!),
          _buildComparisonRow('Year', _coin1!['year']!, _coin2!['year']!),
          _buildComparisonRow('Metal', _coin1!['metal']!, _coin2!['metal']!),
          _buildComparisonRow('Weight', _coin1!['weight']!, _coin2!['weight']!),
          _buildComparisonRow('Diameter', _coin1!['diameter']!, _coin2!['diameter']!),
          _buildComparisonRow('Rarity', _coin1!['rarity']!, _coin2!['rarity']!, isLast: true),
        ],
      ),
    );
  }

  Widget _buildComparisonRow(String label, String value1, String value2, {bool isLast = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: isLast ? null : Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(label, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textDark)),
          ),
          Expanded(
            flex: 3,
            child: Text(value1, textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textGray)),
          ),
          Expanded(
            flex: 3,
            child: Text(value2, textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textGray)),
          ),
        ],
      ),
    );
  }
}
