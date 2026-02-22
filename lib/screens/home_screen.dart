import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import '../utils/constants.dart';
import 'scan_screen.dart';
import 'collection_screen.dart';
import 'profile_screen.dart';
import 'market_screen.dart';
import 'learn_screen.dart';
import 'scan_history_screen.dart';
import 'saved_coins_screen.dart';
import 'grading_guide_screen.dart';
import 'calculator_screen.dart';
import 'news_screen.dart';
import 'events_screen.dart';
import 'compare_screen.dart';
import 'statistics_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const _HomeContent(),
    const ScanScreen(),
    const CollectionScreen(),
    const ProfileScreen(),
  ];

  Future<void> _onTabTapped(int index) async {
    if (index == 1) {
      final status = await Permission.camera.request();
      if (status.isGranted) {
        setState(() => _selectedIndex = index);
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Camera permission is required to scan coins'),
              action: SnackBarAction(
                label: 'Settings',
                onPressed: () => openAppSettings(),
              ),
            ),
          );
        }
      }
    } else {
      setState(() => _selectedIndex = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha:0.1),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onTabTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.gold,
          unselectedItemColor: AppColors.textGray,
          selectedLabelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
          unselectedLabelStyle: GoogleFonts.poppins(),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: 'Scan'),
            BottomNavigationBarItem(icon: Icon(Icons.collections), label: 'Collection'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Coin Identifier',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 30),
              _buildHeroSection(context),
              const SizedBox(height: 24),
              _buildStatsRow(),
              const SizedBox(height: 24),
              _buildFeaturedCoin(context),
              const SizedBox(height: 30),
              Text(
                'Quick Actions',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 20),
              _buildQuickActions(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.gold, Color(0xFFD4AF37), Color(0xFFF4C430)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: AppColors.gold.withValues(alpha: 0.4), blurRadius: 25, offset: const Offset(0, 12)),
        ],
      ),
      child: Stack(
        children: [
          Positioned(right: -30, top: -30, child: Icon(Icons.monetization_on, size: 180, color: Colors.white.withValues(alpha: 0.15))),
          Positioned(left: -20, bottom: -20, child: Icon(Icons.diamond, size: 120, color: Colors.white.withValues(alpha: 0.1))),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.25), borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Icon(Icons.auto_awesome, size: 14, color: Colors.white),
                          const SizedBox(width: 4),
                          Text('AI Powered', style: GoogleFonts.poppins(fontSize: 11, color: Colors.white, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text('Identify Any Coin', style: GoogleFonts.poppins(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 8),
                Text('Instant recognition with 98% accuracy', style: GoogleFonts.poppins(fontSize: 13, color: Colors.white.withValues(alpha: 0.95))),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ScanScreen())),
                        icon: const Icon(Icons.camera_alt, size: 20),
                        label: Text('Scan Now', style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: AppColors.gold,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          elevation: 0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.25), borderRadius: BorderRadius.circular(12)),
                      child: IconButton(
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ScanHistoryScreen())),
                        icon: const Icon(Icons.history, color: Colors.white, size: 24),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: [
        Expanded(child: _buildStatCard('2.5K+', 'Coins Scanned', Icons.qr_code_scanner, Colors.blue)),
        const SizedBox(width: 12),
        Expanded(child: _buildStatCard('98%', 'Accuracy', Icons.verified, Colors.green)),
        const SizedBox(width: 12),
        Expanded(child: _buildStatCard('150+', 'Countries', Icons.public, Colors.orange)),
      ],
    );
  }

  Widget _buildStatCard(String value, String label, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(value, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark)),
          Text(label, style: GoogleFonts.poppins(fontSize: 10, color: AppColors.textGray), textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildFeaturedCoin(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple.shade700, Colors.deepPurple.shade900],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.deepPurple.withValues(alpha: 0.3), blurRadius: 20, offset: const Offset(0, 10))],
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(child: Text('💎', style: TextStyle(fontSize: 40))),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Coin of the Day', style: GoogleFonts.poppins(fontSize: 12, color: Colors.white.withValues(alpha: 0.8))),
                const SizedBox(height: 4),
                Text('1933 Double Eagle', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 4),
                Text('Worth \$18.9 Million', style: GoogleFonts.poppins(fontSize: 13, color: Colors.amber.shade200, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    final actions = [
      {'icon': Icons.trending_up, 'title': 'Market\nValue', 'screen': const MarketScreen()},
      {'icon': Icons.school_outlined, 'title': 'Learn\nCoins', 'screen': const LearnScreen()},
      {'icon': Icons.history, 'title': 'Scan\nHistory', 'screen': const ScanHistoryScreen()},
      {'icon': Icons.bookmark, 'title': 'Saved\nCoins', 'screen': const SavedCoinsScreen()},
      {'icon': Icons.grade, 'title': 'Grading\nGuide', 'screen': const GradingGuideScreen()},
      {'icon': Icons.calculate, 'title': 'Calculator', 'screen': const CalculatorScreen()},
      {'icon': Icons.article, 'title': 'Coin\nNews', 'screen': const NewsScreen()},
      {'icon': Icons.event, 'title': 'Events', 'screen': const EventsScreen()},
      {'icon': Icons.compare_arrows, 'title': 'Compare', 'screen': const CompareScreen()},
      {'icon': Icons.bar_chart, 'title': 'Statistics', 'screen': const StatisticsScreen()},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.0,
      ),
      itemCount: actions.length,
      itemBuilder: (context, index) {
        final action = actions[index];
        return GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => action['screen'] as Widget)),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: AppColors.goldGradient,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(action['icon'] as IconData, size: 30, color: Colors.white),
                ),
                const SizedBox(height: 12),
                Text(
                  action['title'] as String,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
