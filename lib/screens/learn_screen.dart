import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Learn & Explore', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildDailyQuizCard(context),
            const SizedBox(height: 20),
            _buildTerminologyCard(context),
            const SizedBox(height: 20),
            Text('Explore Categories', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textDark)),
            const SizedBox(height: 16),
            _buildCategoryCard(context, 'Ancient Coins', 'Discover coins from ancient civilizations', Icons.history_edu, 'ancient'),
            _buildCategoryCard(context, 'Gold Coins', 'Explore valuable gold coin collections', Icons.monetization_on, 'gold'),
            _buildCategoryCard(context, 'Rare Coins', 'Learn about the rarest coins in history', Icons.diamond, 'rare'),
            _buildCategoryCard(context, 'Error Coins', 'Fascinating minting mistakes and errors', Icons.error_outline, 'error'),
            _buildCategoryCard(context, 'Most Expensive Coins', 'The world\'s most valuable coins', Icons.attach_money, 'expensive'),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyQuizCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.goldGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: AppColors.gold.withValues(alpha: 0.3), blurRadius: 15, offset: const Offset(0, 5))],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(16)),
            child: const Icon(Icons.quiz, color: Colors.white, size: 32),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Daily Coin Quiz', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                Text('Test your knowledge!', style: GoogleFonts.poppins(fontSize: 13, color: Colors.white.withValues(alpha: 0.9))),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const QuizScreen())),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: AppColors.gold, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            child: Text('Start', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  Widget _buildTerminologyCard(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TerminologyScreen())),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.indigo.withValues(alpha: 0.05)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.indigo.withValues(alpha: 0.2), width: 1.5),
          boxShadow: [BoxShadow(color: Colors.indigo.withValues(alpha: 0.15), blurRadius: 15, offset: const Offset(0, 5))],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.indigo, Colors.indigo.shade700]),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo.withValues(alpha: 0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Icon(Icons.book, color: Colors.white, size: 32),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Coin Terminology', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark)),
                  const SizedBox(height: 4),
                  Text('Learn numismatic terms', style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textGray)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.indigo.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.arrow_forward_ios, color: Colors.indigo, size: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String title, String description, IconData icon, String category) {
    final colors = _getCategoryColors(category);
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CategoryDetailScreen(category: category, title: title))),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, colors[0].withValues(alpha: 0.05)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: colors[0].withValues(alpha: 0.2), width: 1.5),
          boxShadow: [BoxShadow(color: colors[0].withValues(alpha: 0.15), blurRadius: 15, offset: const Offset(0, 5))],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: colors),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: colors[0].withValues(alpha: 0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Icon(icon, color: Colors.white, size: 30),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textDark)),
                  Text(description, style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textGray)),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: AppColors.textGray, size: 16),
          ],
        ),
      ),
    );
  }

  List<Color> _getCategoryColors(String category) {
    switch (category) {
      case 'ancient':
        return [Color(0xFF8B4513), Color(0xFFA0522D)];
      case 'gold':
        return [Color(0xFFFFD700), Color(0xFFFFA500)];
      case 'rare':
        return [Color(0xFF9C27B0), Color(0xFFE91E63)];
      case 'error':
        return [Color(0xFFFF5722), Color(0xFFFF9800)];
      case 'expensive':
        return [Color(0xFF4CAF50), Color(0xFF8BC34A)];
      default:
        return [AppColors.gold, AppColors.lightGold];
    }
  }
}

class CategoryDetailScreen extends StatelessWidget {
  final String category;
  final String title;

  const CategoryDetailScreen({super.key, required this.category, required this.title});

  List<Color> _getCategoryColors() {
    switch (category) {
      case 'ancient':
        return [Color(0xFF8B4513), Color(0xFFA0522D)];
      case 'gold':
        return [Color(0xFFFFD700), Color(0xFFFFA500)];
      case 'rare':
        return [Color(0xFF9C27B0), Color(0xFFE91E63)];
      case 'error':
        return [Color(0xFFFF5722), Color(0xFFFF9800)];
      case 'expensive':
        return [Color(0xFF4CAF50), Color(0xFF8BC34A)];
      default:
        return [AppColors.gold, AppColors.lightGold];
    }
  }

  IconData _getCategoryIcon() {
    switch (category) {
      case 'ancient':
        return Icons.history_edu;
      case 'gold':
        return Icons.monetization_on;
      case 'rare':
        return Icons.diamond;
      case 'error':
        return Icons.error_outline;
      case 'expensive':
        return Icons.attach_money;
      default:
        return Icons.monetization_on;
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = _getCategoryItems();
    final colors = _getCategoryColors();
    final icon = _getCategoryIcon();
    
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: colors[0],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 18)),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: colors,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                  Positioned(right: -30, top: 30, child: Icon(icon, size: 150, color: Colors.white.withValues(alpha: 0.1))),
                  Positioned(left: -20, bottom: 20, child: Icon(Icons.stars, size: 100, color: Colors.white.withValues(alpha: 0.1))),
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
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.2),
                                blurRadius: 15,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Icon(icon, size: 50, color: Colors.white),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text('${items.length} Coins', style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white)),
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
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildCoinItem(context, items[index], colors),
                childCount: items.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, String>> _getCategoryItems() {
    final data = {
      'ancient': [
        {'title': 'Roman Denarius', 'desc': 'Silver coin of ancient Rome, used for over 400 years', 'image': '🏛️', 'year': '211 BC - 244 AD', 'value': '\$50-\$5,000', 'metal': 'Silver'},
        {'title': 'Greek Drachma', 'desc': 'Ancient Greek currency dating back to 5th century BC', 'image': '🏺', 'year': '5th Century BC', 'value': '\$100-\$10,000', 'metal': 'Silver'},
        {'title': 'Byzantine Solidus', 'desc': 'Gold coin of the Byzantine Empire', 'image': '👑', 'year': '4th-15th Century', 'value': '\$500-\$15,000', 'metal': 'Gold'},
        {'title': 'Athenian Tetradrachm', 'desc': 'Famous owl coin from ancient Athens', 'image': '🦉', 'year': '449-413 BC', 'value': '\$200-\$8,000', 'metal': 'Silver'},
        {'title': 'Roman Aureus', 'desc': 'Gold coin of ancient Rome, highly valued', 'image': '🏺', 'year': '1st Century BC', 'value': '\$1,000-\$50,000', 'metal': 'Gold'},
        {'title': 'Persian Daric', 'desc': 'Ancient Persian gold coin with archer design', 'image': '🏹', 'year': '5th Century BC', 'value': '\$800-\$12,000', 'metal': 'Gold'},
      ],
      'gold': [
        {'title': 'American Gold Eagle', 'desc': 'Official gold bullion coin of the United States', 'image': '🦅', 'year': '1986-Present', 'value': '\$2,000-\$2,200', 'metal': '22K Gold'},
        {'title': 'Canadian Gold Maple Leaf', 'desc': 'One of the purest gold coins in the world', 'image': '🍁', 'year': '1979-Present', 'value': '\$2,100-\$2,300', 'metal': '24K Gold'},
        {'title': 'South African Krugerrand', 'desc': 'First modern gold bullion coin', 'image': '🌍', 'year': '1967-Present', 'value': '\$1,900-\$2,100', 'metal': '22K Gold'},
        {'title': 'Austrian Gold Philharmonic', 'desc': 'European gold bullion coin with orchestra theme', 'image': '🎵', 'year': '1989-Present', 'value': '\$2,000-\$2,200', 'metal': '24K Gold'},
        {'title': 'Chinese Gold Panda', 'desc': 'Annual design changes featuring pandas', 'image': '🐼', 'year': '1982-Present', 'value': '\$2,100-\$2,500', 'metal': '24K Gold'},
        {'title': 'British Gold Sovereign', 'desc': 'Historic British gold coin still minted today', 'image': '👑', 'year': '1817-Present', 'value': '\$500-\$600', 'metal': '22K Gold'},
        {'title': 'Australian Gold Nugget', 'desc': 'Features kangaroo design, highly pure gold', 'image': '🦘', 'year': '1986-Present', 'value': '\$2,000-\$2,200', 'metal': '24K Gold'},
      ],
      'rare': [
        {'title': '1933 Double Eagle', 'desc': 'One of the most valuable coins ever sold', 'image': '💎', 'year': '1933', 'value': '\$18.9 Million', 'metal': 'Gold'},
        {'title': '1794 Flowing Hair Dollar', 'desc': 'First dollar coin issued by US federal government', 'image': '💵', 'year': '1794', 'value': '\$10 Million', 'metal': 'Silver'},
        {'title': 'Edward III Florin', 'desc': 'Medieval English gold coin, only 3 known to exist', 'image': '👑', 'year': '1343', 'value': 'Priceless', 'metal': 'Gold'},
        {'title': '1913 Liberty Head Nickel', 'desc': 'Only 5 specimens known, unauthorized minting', 'image': '🔒', 'year': '1913', 'value': '\$4.5 Million', 'metal': 'Nickel'},
        {'title': '1804 Silver Dollar', 'desc': 'King of American coins, only 15 known', 'image': '👑', 'year': '1804', 'value': '\$4 Million', 'metal': 'Silver'},
        {'title': 'Brasher Doubloon', 'desc': 'First gold coin struck in New York', 'image': '⭐', 'year': '1787', 'value': '\$9.36 Million', 'metal': 'Gold'},
      ],
      'error': [
        {'title': 'Double Strike Error', 'desc': 'Coin struck twice by the die, creating doubled image', 'image': '⚠️', 'year': 'Various', 'value': '\$50-\$5,000', 'metal': 'Various'},
        {'title': 'Off-Center Strike', 'desc': 'Misaligned striking creates unique appearance', 'image': '🎯', 'year': 'Various', 'value': '\$25-\$2,000', 'metal': 'Various'},
        {'title': 'Wrong Planchet Error', 'desc': 'Coin struck on wrong metal blank', 'image': '🔄', 'year': 'Various', 'value': '\$100-\$10,000', 'metal': 'Various'},
        {'title': 'Clipped Planchet', 'desc': 'Missing portion due to improper blank cutting', 'image': '✂️', 'year': 'Various', 'value': '\$20-\$500', 'metal': 'Various'},
        {'title': 'Die Crack Error', 'desc': 'Raised lines from cracked die', 'image': '⚡', 'year': 'Various', 'value': '\$10-\$1,000', 'metal': 'Various'},
        {'title': 'Broadstrike Error', 'desc': 'Coin struck without collar, larger diameter', 'image': '⭕', 'year': 'Various', 'value': '\$30-\$800', 'metal': 'Various'},
      ],
      'expensive': [
        {'title': '1794 Flowing Hair Dollar', 'desc': 'Sold for \$10 million in 2013', 'image': '💰', 'year': '1794', 'value': '\$10 Million', 'metal': 'Silver'},
        {'title': '1933 Double Eagle', 'desc': 'Sold for \$18.9 million in 2021', 'image': '🏆', 'year': '1933', 'value': '\$18.9 Million', 'metal': 'Gold'},
        {'title': 'Brasher Doubloon', 'desc': 'Sold for \$9.36 million in 2021', 'image': '⭐', 'year': '1787', 'value': '\$9.36 Million', 'metal': 'Gold'},
        {'title': '1343 Edward III Florin', 'desc': 'Medieval masterpiece, only 3 exist', 'image': '👑', 'year': '1343', 'value': 'Priceless', 'metal': 'Gold'},
        {'title': '1787 Fugio Cent', 'desc': 'First official US coin, extremely rare', 'image': '🇺🇸', 'year': '1787', 'value': '\$1.5 Million', 'metal': 'Copper'},
        {'title': '1907 Saint-Gaudens', 'desc': 'Ultra high relief, most beautiful US coin', 'image': '✨', 'year': '1907', 'value': '\$3 Million', 'metal': 'Gold'},
      ],
    };
    return data[category] ?? [];
  }

  Widget _buildCoinItem(BuildContext context, Map<String, String> item, List<Color> colors) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, colors[0].withValues(alpha: 0.05)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors[0].withValues(alpha: 0.2), width: 1.5),
        boxShadow: [BoxShadow(color: colors[0].withValues(alpha: 0.15), blurRadius: 15, offset: const Offset(0, 5))],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: colors),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: colors[0].withValues(alpha: 0.4),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Center(child: Text(item['image']!, style: const TextStyle(fontSize: 36))),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['title']!, style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.bold, color: AppColors.textDark)),
                      const SizedBox(height: 6),
                      Text(item['desc']!, style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textGray, height: 1.4), maxLines: 2, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colors[0].withValues(alpha: 0.08), colors[1].withValues(alpha: 0.05)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInfoItem(Icons.calendar_today, 'Year', item['year']!, colors[0]),
                Container(width: 1, height: 30, color: colors[0].withValues(alpha: 0.2)),
                _buildInfoItem(Icons.attach_money, 'Value', item['value']!, colors[0]),
                Container(width: 1, height: 30, color: colors[0].withValues(alpha: 0.2)),
                _buildInfoItem(Icons.diamond, 'Metal', item['metal']!, colors[0]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String label, String value, Color color) {
    return Column(
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(height: 4),
        Text(label, style: GoogleFonts.poppins(fontSize: 10, color: AppColors.textGray)),
        const SizedBox(height: 2),
        Text(value, style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.textDark), textAlign: TextAlign.center, maxLines: 1, overflow: TextOverflow.ellipsis),
      ],
    );
  }
}

class ArticleScreen extends StatelessWidget {
  final String title;
  final String description;
  final String year;
  final String value;
  final String metal;

  const ArticleScreen({super.key, required this.title, required this.description, required this.year, required this.value, required this.metal});

  Color _getMetalColor() {
    if (metal.toLowerCase().contains('gold')) return Color(0xFFFFD700);
    if (metal.toLowerCase().contains('silver')) return Color(0xFFC0C0C0);
    if (metal.toLowerCase().contains('copper')) return Color(0xFFB87333);
    return AppColors.gold;
  }

  @override
  Widget build(BuildContext context) {
    final metalColor = _getMetalColor();
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: metalColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [metalColor, metalColor.withValues(alpha: 0.7)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                  Positioned(right: -50, top: 50, child: Icon(Icons.monetization_on, size: 200, color: Colors.white.withValues(alpha: 0.1))),
                  Positioned(left: -30, bottom: 30, child: Icon(Icons.stars, size: 150, color: Colors.white.withValues(alpha: 0.1))),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 60),
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.2),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Icon(Icons.monetization_on, size: 80, color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(metal, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.textDark)),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(child: _buildStatCard('Year', year, Icons.calendar_today, Colors.blue)),
                      const SizedBox(width: 12),
                      Expanded(child: _buildStatCard('Value', value, Icons.attach_money, Colors.green)),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildSectionCard(
                    'Overview',
                    description,
                    Icons.description,
                    Colors.purple,
                  ),
                  const SizedBox(height: 16),
                  _buildSectionCard(
                    'Historical Significance',
                    'This coin represents an important piece of numismatic history. $title has been studied by collectors and historians for its unique characteristics and historical context. The coin\'s design, minting process, and circulation tell a fascinating story about the era in which it was created.',
                    Icons.history,
                    Colors.orange,
                  ),
                  const SizedBox(height: 24),
                  Text('Collector Information', style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textDark)),
                  const SizedBox(height: 12),
                  _buildInfoCard('Rarity', 'This coin is considered highly collectible due to its limited mintage and historical significance.', Icons.star, Colors.amber),
                  _buildInfoCard('Condition', 'Value varies significantly based on grade. Well-preserved specimens command premium prices.', Icons.grade, Colors.teal),
                  _buildInfoCard('Authentication', 'Professional grading and authentication recommended for valuable specimens.', Icons.verified, Colors.indigo),
                  const SizedBox(height: 20),
                  _buildActionButtons(context, metalColor),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
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
            child: Icon(icon, color: Colors.white, size: 28),
          ),
          const SizedBox(height: 12),
          Text(label, style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textGray)),
          const SizedBox(height: 4),
          Text(value, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textDark), textAlign: TextAlign.center, maxLines: 2),
        ],
      ),
    );
  }

  Widget _buildSectionCard(String title, String content, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, color.withValues(alpha: 0.03)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.2), width: 1.5),
        boxShadow: [BoxShadow(color: color.withValues(alpha: 0.15), blurRadius: 15, offset: const Offset(0, 5))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [color, color.withValues(alpha: 0.8)]),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: color.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(icon, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 12),
              Text(title, style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textDark)),
            ],
          ),
          const SizedBox(height: 16),
          Text(content, style: GoogleFonts.poppins(fontSize: 15, color: AppColors.textGray, height: 1.7)),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, String content, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, color.withValues(alpha: 0.05)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.2)),
        boxShadow: [BoxShadow(color: color.withValues(alpha: 0.1), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [color, color.withValues(alpha: 0.8)]),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textDark)),
                const SizedBox(height: 6),
                Text(content, style: GoogleFonts.poppins(fontSize: 14, color: AppColors.textGray, height: 1.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, Color color) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.bookmark_border, color: Colors.white),
            label: Text('Save', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 5,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.share, color: color),
            label: Text('Share', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: color)),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: color, width: 2),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ),
        ),
      ],
    );
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestion = 0;
  int _score = 0;
  bool _answered = false;
  int? _selectedAnswer;

  final _questions = [
    {'q': 'What is the study of coins called?', 'options': ['Philately', 'Numismatics', 'Cartography', 'Archaeology'], 'correct': 1},
    {'q': 'Which country created the first gold coin?', 'options': ['Greece', 'Rome', 'Lydia', 'Egypt'], 'correct': 2},
    {'q': 'What does "mint condition" mean?', 'options': ['Green colored', 'Perfect condition', 'Made of mint', 'Old coin'], 'correct': 1},
  ];

  void _answerQuestion(int index) {
    if (_answered) return;
    setState(() {
      _selectedAnswer = index;
      _answered = true;
      if (index == _questions[_currentQuestion]['correct']) _score++;
    });
  }

  void _nextQuestion() {
    if (_currentQuestion < _questions.length - 1) {
      setState(() {
        _currentQuestion++;
        _answered = false;
        _selectedAnswer = null;
      });
    } else {
      _showResults();
    }
  }

  void _showResults() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Quiz Complete!', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        content: Text('Your score: $_score/${_questions.length}', style: GoogleFonts.poppins(fontSize: 18)),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst), child: Text('Done', style: GoogleFonts.poppins(color: AppColors.gold))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestion];
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: Text('Daily Quiz', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)), backgroundColor: Colors.white, elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(value: (_currentQuestion + 1) / _questions.length, backgroundColor: Colors.grey.shade200, color: AppColors.gold),
            const SizedBox(height: 20),
            Text('Question ${_currentQuestion + 1}/${_questions.length}', style: GoogleFonts.poppins(fontSize: 14, color: AppColors.textGray)),
            const SizedBox(height: 12),
            Text(question['q'] as String, style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textDark)),
            const SizedBox(height: 24),
            ...(question['options'] as List<String>).asMap().entries.map((entry) {
              final isCorrect = entry.key == question['correct'];
              final isSelected = entry.key == _selectedAnswer;
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ElevatedButton(
                  onPressed: () => _answerQuestion(entry.key),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _answered ? (isCorrect ? Colors.green : isSelected ? Colors.red : Colors.white) : Colors.white,
                    foregroundColor: _answered && (isCorrect || isSelected) ? Colors.white : AppColors.textDark,
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text(entry.value, style: GoogleFonts.poppins(fontSize: 16)),
                ),
              );
            }),
            const Spacer(),
            if (_answered)
              ElevatedButton(
                onPressed: _nextQuestion,
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.gold, padding: const EdgeInsets.all(16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                child: Text(_currentQuestion < _questions.length - 1 ? 'Next Question' : 'Finish Quiz', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
              ),
          ],
        ),
      ),
    );
  }
}

class TerminologyScreen extends StatelessWidget {
  const TerminologyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final terms = [
      {'term': 'Numismatics', 'def': 'The study or collection of currency, including coins, tokens, and paper money', 'icon': Icons.school, 'color': Colors.blue},
      {'term': 'Obverse', 'def': 'The front or "heads" side of a coin', 'icon': Icons.flip_to_front, 'color': Colors.green},
      {'term': 'Reverse', 'def': 'The back or "tails" side of a coin', 'icon': Icons.flip_to_back, 'color': Colors.orange},
      {'term': 'Mint Mark', 'def': 'A small letter or symbol indicating where a coin was produced', 'icon': Icons.location_on, 'color': Colors.red},
      {'term': 'Patina', 'def': 'The natural toning or discoloration that develops on a coin over time', 'icon': Icons.palette, 'color': Colors.purple},
      {'term': 'Proof', 'def': 'A specially made coin with mirror-like surfaces and frosted designs', 'icon': Icons.auto_awesome, 'color': Colors.amber},
      {'term': 'Bullion', 'def': 'Coins valued primarily for their precious metal content', 'icon': Icons.diamond, 'color': Colors.teal},
      {'term': 'Grade', 'def': 'The condition rating of a coin, typically on a scale from 1 to 70', 'icon': Icons.grade, 'color': Colors.indigo},
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: Colors.indigo,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Coin Terminology', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 18)),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.indigo, Colors.indigo.shade700],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                  Positioned(right: -30, top: 30, child: Icon(Icons.book, size: 150, color: Colors.white.withValues(alpha: 0.1))),
                  Positioned(left: -20, bottom: 20, child: Icon(Icons.menu_book, size: 100, color: Colors.white.withValues(alpha: 0.1))),
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
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.2),
                                blurRadius: 15,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Icon(Icons.book, size: 50, color: Colors.white),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text('${terms.length} Terms', style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white)),
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
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildTermCard(terms[index]),
                childCount: terms.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTermCard(Map<String, dynamic> term) {
    final color = term['color'] as Color;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
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
                  child: Icon(term['icon'] as IconData, color: Colors.white, size: 28),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(term['term']!, style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textDark)),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color.withValues(alpha: 0.08), color.withValues(alpha: 0.03)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Text(term['def']!, style: GoogleFonts.poppins(fontSize: 15, color: AppColors.textGray, height: 1.6)),
          ),
        ],
      ),
    );
  }
}
