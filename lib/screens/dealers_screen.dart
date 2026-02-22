import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';

class DealersScreen extends StatelessWidget {
  const DealersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Coin Dealers', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
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
                gradient: LinearGradient(colors: [Colors.teal.shade700, Colors.teal.shade900]),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.teal.withValues(alpha: 0.3), blurRadius: 20, offset: const Offset(0, 10))],
              ),
              child: Column(
                children: [
                  Icon(Icons.store, size: 50, color: Colors.white),
                  const SizedBox(height: 12),
                  Text('Find Dealers', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 8),
                  Text('Trusted coin dealers near you', style: GoogleFonts.poppins(fontSize: 13, color: Colors.white.withValues(alpha: 0.9))),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text('Featured Dealers', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark)),
            const SizedBox(height: 12),
            _buildDealerCard('Heritage Auctions', 'Dallas, TX', '⭐⭐⭐⭐⭐', 'Specializes in rare and ancient coins', Icons.gavel, Colors.blue, true),
            _buildDealerCard('APMEX', 'Online', '⭐⭐⭐⭐⭐', 'Largest online precious metals dealer', Icons.shopping_cart, Colors.green, true),
            _buildDealerCard('Stack\'s Bowers', 'New York, NY', '⭐⭐⭐⭐⭐', 'Premier numismatic auctioneers', Icons.account_balance, Colors.purple, false),
            _buildDealerCard('JM Bullion', 'Online', '⭐⭐⭐⭐', 'Gold and silver bullion specialist', Icons.monetization_on, AppColors.gold, true),
            _buildDealerCard('Local Coin Shop', '2.5 miles away', '⭐⭐⭐⭐', 'Family owned since 1985', Icons.location_on, Colors.red, false),
            const SizedBox(height: 20),
            _buildSearchCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildDealerCard(String name, String location, String rating, String specialty, IconData icon, Color color, bool isOnline) {
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
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: color.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(12)),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textDark)),
                    Row(
                      children: [
                        Icon(isOnline ? Icons.language : Icons.location_on, size: 12, color: AppColors.textGray),
                        const SizedBox(width: 4),
                        Text(location, style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textGray)),
                      ],
                    ),
                  ],
                ),
              ),
              if (isOnline)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.green.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(6)),
                  child: Text('Online', style: GoogleFonts.poppins(fontSize: 10, color: Colors.green, fontWeight: FontWeight.w600)),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Text(rating, style: GoogleFonts.poppins(fontSize: 14)),
          const SizedBox(height: 4),
          Text(specialty, style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textGray)),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.phone, size: 16, color: color),
                  label: Text('Contact', style: GoogleFonts.poppins(fontSize: 12, color: color)),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: color),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.info_outline, size: 16, color: Colors.white),
                  label: Text('Details', style: GoogleFonts.poppins(fontSize: 12, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: Column(
        children: [
          Icon(Icons.search, color: AppColors.gold, size: 40),
          const SizedBox(height: 12),
          Text('Find More Dealers', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textDark)),
          const SizedBox(height: 8),
          Text('Search by location, specialty, or coin type', style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textGray), textAlign: TextAlign.center),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.gold,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: Text('Search Dealers', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
