import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';

class ScanHistoryScreen extends StatelessWidget {
  const ScanHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final history = [
      {'coin': 'American Eagle', 'date': '2024-01-15', 'time': '10:30 AM', 'icon': '🦅'},
      {'coin': 'Canadian Maple', 'date': '2024-01-14', 'time': '03:45 PM', 'icon': '🍁'},
      {'coin': 'British Sovereign', 'date': '2024-01-13', 'time': '11:20 AM', 'icon': '👑'},
      {'coin': 'Indian Rupee', 'date': '2024-01-12', 'time': '09:15 AM', 'icon': '🪙'},
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Scan History', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
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
                );
              },
            ),
      ),
    );
  }
}
