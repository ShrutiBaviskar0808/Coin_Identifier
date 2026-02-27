import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ads/native_ads_widget.dart';
import '../utils/constants.dart';
import '../models/coin_data.dart';
import 'home_screen.dart';

class CoinDetailsScreen extends StatelessWidget {
  final String frontImage;
  final String reverseImage;

  const CoinDetailsScreen({
    super.key,
    required this.frontImage,
    required this.reverseImage,
  });

  @override
  Widget build(BuildContext context) {
    final coinData = _getStaticCoinData();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildImageSection(),
                    _buildMainInfo(coinData),
                    const SizedBox(height: 20),
                    const NativeAdsWidgets(padding: 16),
                    const SizedBox(height: 20),
                    _buildSpecifications(coinData),
                    _buildDescription(coinData),
                    _buildMarketValue(coinData),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
            onPressed: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const HomeScreen()),
              (route) => false,
            ),
          ),
          Expanded(
            child: Text(
              'Coin Details',
              style: GoogleFonts.poppins(
                color: AppColors.textDark,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.share, color: AppColors.textDark),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_border, color: AppColors.textDark),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildImageSection() {
    return Container(
      height: 300,
  
      color: Colors.white,
      child: PageView(
        children: [
          _buildImageCard(frontImage, 'Front Side'),
          _buildImageCard(reverseImage, 'Reverse Side'),
        ],
      ),
    );
  }

  Widget _buildImageCard(String imagePath, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipOval(
            child: Image.file(
              File(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: AppColors.textGray,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildMainInfo(Map<String, dynamic> data) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  gradient: AppColors.goldGradient,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  data['confidence'],
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            data['name'],
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            data['country'],
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: AppColors.textGray,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildInfoChip(Icons.calendar_today, data['year']),
              const SizedBox(width: 12),
              _buildInfoChip(Icons.account_balance, data['mint']),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: AppColors.gold),
          const SizedBox(width: 6),
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: AppColors.textDark,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecifications(Map<String, dynamic> data) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Specifications',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 16),
          _buildSpecRow('Composition', data['composition']),
          _buildSpecRow('Weight', data['weight']),
          _buildSpecRow('Diameter', data['diameter']),
          _buildSpecRow('Thickness', data['thickness']),
          _buildSpecRow('Edge', data['edge']),
        ],
      ),
    );
  }

  Widget _buildSpecRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: AppColors.textGray,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: AppColors.textDark,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription(Map<String, dynamic> data) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            data['description'],
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: AppColors.textGray,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMarketValue(Map<String, dynamic> data) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1A237E), Color(0xFF3949AB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A237E).withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Estimated Market Value',
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            data['value'],
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildValueChip('Good', data['valueGood']),
              const SizedBox(width: 8),
              _buildValueChip('Fine', data['valueFine']),
              const SizedBox(width: 8),
              _buildValueChip('Uncirculated', data['valueUncirculated']),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildValueChip(String condition, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              condition,
              style: GoogleFonts.poppins(
                fontSize: 11,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Map<String, dynamic> _getStaticCoinData() {
    final random = Random();
    final allCoins = CoinData.getAllCoins();
    final randomCoin = allCoins[random.nextInt(allCoins.length)];
    final confidence = 90 + random.nextInt(10);
    
    return {
      'confidence': '$confidence% Match',
      'name': randomCoin.name,
      'country': randomCoin.country,
      'year': randomCoin.year,
      'mint': _getMintName(randomCoin.country),
      'composition': '${randomCoin.purity} ${randomCoin.metal}',
      'weight': randomCoin.weight,
      'diameter': randomCoin.diameter,
      'thickness': '${(1.5 + random.nextDouble() * 2).toStringAsFixed(2)} mm',
      'edge': random.nextBool() ? 'Reeded' : 'Plain',
      'description': 'The ${randomCoin.name} is a distinguished coin from ${randomCoin.country}, minted in ${randomCoin.year}. This coin represents an important piece of numismatic history and is highly valued by collectors worldwide.',
      'value': randomCoin.price,
      'valueGood': _adjustPrice(randomCoin.price, -0.15),
      'valueFine': _adjustPrice(randomCoin.price, -0.05),
      'valueUncirculated': _adjustPrice(randomCoin.price, 0.15),
    };
  }
  
  String _getMintName(String country) {
    final mints = {'USA': ['Philadelphia', 'Denver', 'San Francisco'], 'Canada': ['Royal Canadian Mint'], 'UK': ['Royal Mint'], 'Australia': ['Perth Mint']};
    final countryMints = mints[country] ?? ['National Mint'];
    return countryMints[Random().nextInt(countryMints.length)];
  }
  
  String _adjustPrice(String price, double factor) {
    final numStr = price.replaceAll(RegExp(r'[^0-9.]'), '');
    final num = double.tryParse(numStr) ?? 0;
    final adjusted = num * (1 + factor);
    return '\$${adjusted.toStringAsFixed(adjusted < 10 ? 2 : 0)}';
  }
}
