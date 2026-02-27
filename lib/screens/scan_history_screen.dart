import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ads/banner_ads_widget.dart';
import '../utils/constants.dart';

class ScanHistoryScreen extends StatelessWidget {
  const ScanHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final history = [
      {'coin': 'American Eagle', 'date': '2024-01-15', 'time': '10:30 AM', 'icon': '🦅', 'confidence': '98%', 'value': '\$2,150', 'year': '2023', 'grade': 'MS-70'},
      {'coin': 'Canadian Maple', 'date': '2024-01-14', 'time': '03:45 PM', 'icon': '🍁', 'confidence': '95%', 'value': '\$2,140', 'year': '2022', 'grade': 'MS-69'},
      {'coin': 'British Sovereign', 'date': '2024-01-13', 'time': '11:20 AM', 'icon': '👑', 'confidence': '92%', 'value': '\$520', 'year': '1910', 'grade': 'VF-30'},
      {'coin': 'Indian Rupee', 'date': '2024-01-12', 'time': '09:15 AM', 'icon': '🪙', 'confidence': '89%', 'value': '\$45', 'year': '1947', 'grade': 'F-15'},
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const BannerAds(),
          Expanded(
            child: SafeArea(
              child: history.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.history, size: 80, color: AppColors.textGray.withValues(alpha: 0.3)),
                  const SizedBox(height: 16),
                  Text('No scan history yet', style: GoogleFonts.poppins(fontSize: 16, color: AppColors.textGray)),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: history.length,
              itemBuilder: (context, index) {
                final item = history[index];
                final confidenceValue = int.parse(item['confidence']!.replaceAll('%', ''));
                final cardColor = confidenceValue >= 95 ? Colors.green : confidenceValue >= 90 ? Colors.blue : Colors.orange;
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, cardColor.withValues(alpha: 0.03)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: cardColor.withValues(alpha: 0.2), width: 1.5),
                    boxShadow: [BoxShadow(color: cardColor.withValues(alpha: 0.15), blurRadius: 15, offset: const Offset(0, 5))],
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
                            child: Center(child: Text(item['icon']!, style: const TextStyle(fontSize: 32))),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item['coin']!, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textDark)),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(Icons.calendar_today, size: 12, color: AppColors.textGray),
                                    const SizedBox(width: 4),
                                    Text(item['date']!, style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textGray)),
                                    const SizedBox(width: 12),
                                    Icon(Icons.access_time, size: 12, color: AppColors.textGray),
                                    const SizedBox(width: 4),
                                    Text(item['time']!, style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textGray)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios, color: AppColors.textGray, size: 16),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildDetailItem('Confidence', item['confidence']!, Icons.verified, Colors.blue),
                            _buildDetailItem('Value', item['value']!, Icons.attach_money, AppColors.gold),
                            _buildDetailItem('Year', item['year']!, Icons.event, Colors.purple),
                            _buildDetailItem('Grade', item['grade']!, Icons.grade, Colors.green),
                          ],
                        ),
                      ),
                    ],
                  ),
                );              },
            ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(String label, String value, IconData icon, Color color) {
    return Column(
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(height: 4),
        Text(label, style: GoogleFonts.poppins(fontSize: 10, color: AppColors.textGray)),
        Text(value, style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.textDark)),
      ],
    );
  }
}
