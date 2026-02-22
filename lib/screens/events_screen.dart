import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Events & Shows', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
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
                gradient: LinearGradient(colors: [Colors.purple.shade700, Colors.purple.shade900]),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.purple.withValues(alpha: 0.3), blurRadius: 20, offset: const Offset(0, 10))],
              ),
              child: Column(
                children: [
                  Icon(Icons.event, size: 50, color: Colors.white),
                  const SizedBox(height: 12),
                  Text('Upcoming Events', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 8),
                  Text('Coin shows, auctions, and exhibitions', style: GoogleFonts.poppins(fontSize: 13, color: Colors.white.withValues(alpha: 0.9))),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildEventCard('World Coin Fair 2024', 'New York, NY', 'March 15-17, 2024', 'The largest coin show in North America featuring dealers from 30+ countries.', Icons.public, Colors.blue),
            _buildEventCard('Heritage Auctions', 'Online Event', 'March 20, 2024', 'Rare coin auction featuring ancient, US, and world coins. Pre-bidding now open.', Icons.gavel, Colors.orange),
            _buildEventCard('Numismatic Convention', 'Chicago, IL', 'April 5-7, 2024', 'Educational seminars, dealer bourse, and coin grading demonstrations.', Icons.school, Colors.green),
            _buildEventCard('Ancient Coin Symposium', 'Boston, MA', 'April 12, 2024', 'Expert talks on ancient Greek and Roman coinage with live authentication demos.', Icons.history_edu, Colors.brown),
            _buildEventCard('Local Coin Club Meeting', 'Your City', 'Every 2nd Tuesday', 'Monthly meetings for collectors to trade, learn, and share their passion.', Icons.groups, AppColors.gold),
          ],
        ),
      ),
    );
  }

  Widget _buildEventCard(String title, String location, String date, String description, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(14),
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
                child: Icon(icon, color: Colors.white, size: 30),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textDark)),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 14, color: AppColors.textGray),
                        const SizedBox(width: 4),
                        Text(location, style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textGray)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.calendar_today, size: 14, color: color),
              const SizedBox(width: 4),
              Text(date, style: GoogleFonts.poppins(fontSize: 13, color: color, fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 8),
          Text(description, style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textGray, height: 1.5)),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            child: Text('Learn More', style: GoogleFonts.poppins(fontSize: 13, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
