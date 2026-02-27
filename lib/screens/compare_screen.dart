import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ads/banner_ads_widget.dart';
import '../ads/native_ads_widget.dart';
import '../utils/constants.dart';
import '../models/coin_data.dart';

class CompareScreen extends StatefulWidget {
  const CompareScreen({super.key});

  @override
  State<CompareScreen> createState() => _CompareScreenState();
}

class _CompareScreenState extends State<CompareScreen> {
  final List<CoinData> allCoins = CoinData.getAllCoins();
  CoinData? selectedCoin1;
  CoinData? selectedCoin2;

  @override
  void initState() {
    super.initState();
    selectedCoin1 = allCoins[0];
    selectedCoin2 = allCoins[1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Compare Coins', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          const BannerAds(),
          Expanded(
            child: SafeArea(
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
                  Text('Select and compare from 100+ coins', style: GoogleFonts.poppins(fontSize: 13, color: Colors.white.withValues(alpha: 0.9))),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: _buildCoinSelector(1)),
                const SizedBox(width: 12),
                Expanded(child: _buildCoinSelector(2)),
              ],
            ),
            const SizedBox(height: 20),
            if (selectedCoin1 != null && selectedCoin2 != null) ...[
              _buildComparisonRow('Value', selectedCoin1!.price, selectedCoin2!.price, Colors.green),
              _buildComparisonRow('Purity', selectedCoin1!.purity, selectedCoin2!.purity, Colors.orange),
              _buildComparisonRow('Weight', selectedCoin1!.weight, selectedCoin2!.weight, Colors.blue),
              _buildComparisonRow('Diameter', selectedCoin1!.diameter, selectedCoin2!.diameter, Colors.purple),
              _buildComparisonRow('Year', selectedCoin1!.year, selectedCoin2!.year, Colors.teal),
              _buildComparisonRow('Country', selectedCoin1!.country, selectedCoin2!.country, Colors.red),
              _buildComparisonRow('Metal', selectedCoin1!.metal, selectedCoin2!.metal, Colors.amber),
              const SizedBox(height: 20),
              const NativeAdsWidgets(padding: 10),
              const SizedBox(height: 20),
              _buildSummaryCard(),
            ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCoinSelector(int coinNumber) {
    final selectedCoin = coinNumber == 1 ? selectedCoin1 : selectedCoin2;
    final color = coinNumber == 1 ? Colors.blue : Colors.red;

    return Container(
      padding: const EdgeInsets.all(16),
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
            child: Center(child: Text(selectedCoin?.icon ?? '🪙', style: const TextStyle(fontSize: 32))),
          ),
          const SizedBox(height: 12),
          Text(selectedCoin?.name ?? 'Select Coin', style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textDark), textAlign: TextAlign.center, maxLines: 2),
          const SizedBox(height: 8),
          Text(selectedCoin?.price ?? '', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.gold)),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => _showCoinPicker(coinNumber),
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: Text('Change', style: GoogleFonts.poppins(fontSize: 12, color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showCoinPicker(int coinNumber) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
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
                  Text('Select Coin $coinNumber', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: allCoins.length,
                itemBuilder: (context, index) {
                  final coin = allCoins[index];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        if (coinNumber == 1) {
                          selectedCoin1 = coin;
                        } else {
                          selectedCoin2 = coin;
                        }
                      });
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.lightGold.withValues(alpha: 0.3)),
                      ),
                      child: Row(
                        children: [
                          Text(coin.icon, style: const TextStyle(fontSize: 28)),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(coin.name, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textDark)),
                                Text('${coin.country} • ${coin.metal}', style: GoogleFonts.poppins(fontSize: 11, color: AppColors.textGray)),
                              ],
                            ),
                          ),
                          Text(coin.price, style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.gold)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
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
    if (selectedCoin1 == null || selectedCoin2 == null) return const SizedBox();

    final summary = _generateSummary();
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
          Text(summary, style: GoogleFonts.poppins(fontSize: 13, color: Colors.white, height: 1.6)),
        ],
      ),
    );
  }

  String _generateSummary() {
    final coin1 = selectedCoin1!;
    final coin2 = selectedCoin2!;
    
    final price1 = double.tryParse(coin1.price.replaceAll(RegExp(r'[^\d.]'), '')) ?? 0;
    final price2 = double.tryParse(coin2.price.replaceAll(RegExp(r'[^\d.]'), '')) ?? 0;
    
    final purity1 = double.tryParse(coin1.purity.replaceAll('%', '')) ?? 0;
    final purity2 = double.tryParse(coin2.purity.replaceAll('%', '')) ?? 0;
    
    final weight1 = double.tryParse(coin1.weight.replaceAll('g', '')) ?? 0;
    final weight2 = double.tryParse(coin2.weight.replaceAll('g', '')) ?? 0;

    String summary = '';
    
    if (price1 > price2) {
      summary += '• ${coin1.name} has higher value (${coin1.price})\n';
    } else if (price2 > price1) {
      summary += '• ${coin2.name} has higher value (${coin2.price})\n';
    } else {
      summary += '• Both coins have equal value\n';
    }
    
    if (purity1 > purity2) {
      summary += '• ${coin1.name} has higher purity (${coin1.purity})\n';
    } else if (purity2 > purity1) {
      summary += '• ${coin2.name} has higher purity (${coin2.purity})\n';
    }
    
    if (weight1 > weight2) {
      summary += '• ${coin1.name} is heavier (${coin1.weight})\n';
    } else if (weight2 > weight1) {
      summary += '• ${coin2.name} is heavier (${coin2.weight})\n';
    }
    
    if (coin1.metal == coin2.metal) {
      summary += '• Both are made of ${coin1.metal}\n';
    } else {
      summary += '• Different metals: ${coin1.metal} vs ${coin2.metal}\n';
    }
    
    summary += '• Both are excellent collectibles';
    
    return summary;
  }
}
