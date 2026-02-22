import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/constants.dart';

class CollectionScreen extends StatefulWidget {
  const CollectionScreen({super.key});

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  List<dynamic> _coins = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCoins();
  }

  Future<void> _fetchCoins() async {
    try {
      final response = await http.get(Uri.parse('https://publicassetsdata.sfo3.cdn.digitaloceanspaces.com/smit/MockAPI/coinList/countries.json'));
      if (response.statusCode == 200) {
        setState(() {
          _coins = json.decode(response.body);
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'My Collection',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _coins.isEmpty
                      ? Center(child: Text('No coins found', style: GoogleFonts.poppins(color: AppColors.textGray)))
                      : GridView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 0.8,
                          ),
                          itemCount: _coins.length,
                          itemBuilder: (context, index) {
                            final coin = _coins[index];
                            return InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => CoinDetailScreen(
                                    country: coin['country'] ?? 'Unknown',
                                    flag: coin['country_flag'] ?? '🪙',
                                    filePath: coin['file_path'] ?? '',
                                  ),
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.white, AppColors.lightGold.withValues(alpha: 0.1)],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(24),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.gold.withValues(alpha: 0.2),
                                      blurRadius: 20,
                                      offset: const Offset(0, 8),
                                      spreadRadius: 2,
                                    ),
                                  ],
                                  border: Border.all(color: AppColors.lightGold.withValues(alpha: 0.3), width: 1.5),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 90,
                                      height: 90,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: AppColors.goldGradient,
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.gold.withValues(alpha: 0.4),
                                            blurRadius: 15,
                                            offset: const Offset(0, 5),
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: Text(
                                          coin['country_flag'] ?? '🪙',
                                          style: const TextStyle(fontSize: 48),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      child: Text(
                                        coin['country'] ?? 'Unknown',
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.textDark,
                                          letterSpacing: 0.3,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: AppColors.gold.withValues(alpha: 0.15),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        'Tap to explore',
                                        style: GoogleFonts.poppins(
                                          fontSize: 11,
                                          color: AppColors.gold,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
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
}

class CoinDetailScreen extends StatefulWidget {
  final String country;
  final String flag;
  final String filePath;

  const CoinDetailScreen({super.key, required this.country, required this.flag, required this.filePath});

  @override
  State<CoinDetailScreen> createState() => _CoinDetailScreenState();
}

class _CoinDetailScreenState extends State<CoinDetailScreen> {
  List<dynamic> _coinDetails = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCoinDetails();
  }

  Future<void> _fetchCoinDetails() async {
    try {
      final response = await http.get(Uri.parse(widget.filePath));
      if (response.statusCode == 200) {
        setState(() {
          _coinDetails = json.decode(response.body);
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(widget.country, style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _coinDetails.isEmpty
              ? Center(child: Text('No coins found', style: GoogleFonts.poppins(color: AppColors.textGray)))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _coinDetails.length,
                  itemBuilder: (context, index) {
                    final coin = _coinDetails[index];
                    return InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SingleCoinDetailScreen(coin: coin, flag: widget.flag),
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.white, AppColors.lightGold.withValues(alpha: 0.08)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(color: AppColors.gold.withValues(alpha: 0.15), blurRadius: 15, offset: const Offset(0, 6)),
                          ],
                          border: Border.all(color: AppColors.lightGold.withValues(alpha: 0.3), width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  gradient: AppColors.goldGradient,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(color: AppColors.gold.withValues(alpha: 0.3), blurRadius: 10, offset: const Offset(0, 4)),
                                  ],
                                ),
                                child: Center(child: Text(widget.flag, style: const TextStyle(fontSize: 36))),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      coin['name'] ?? 'Unknown Coin',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textDark),
                                    ),
                                    const SizedBox(height: 6),
                                    if (coin['main_information']?['years'] != null)
                                      Row(
                                        children: [
                                          Icon(Icons.calendar_today, size: 14, color: AppColors.textGray),
                                          const SizedBox(width: 4),
                                          Text(
                                            '${coin['main_information']['years']}',
                                            style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textGray),
                                          ),
                                        ],
                                      ),
                                    if (coin['price'] != null && coin['price'].toString().isNotEmpty)
                                      Row(
                                        children: [
                                          Icon(Icons.attach_money, size: 14, color: AppColors.gold),
                                          Text(
                                            '${coin['price']}',
                                            style: GoogleFonts.poppins(fontSize: 13, color: AppColors.gold, fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: AppColors.gold.withValues(alpha: 0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.arrow_forward_ios, color: AppColors.gold, size: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}

class SingleCoinDetailScreen extends StatelessWidget {
  final Map<String, dynamic> coin;
  final String flag;

  const SingleCoinDetailScreen({super.key, required this.coin, required this.flag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(coin['name'] ?? 'Coin Details', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppColors.goldGradient,
                ),
                child: Center(child: Text(flag, style: const TextStyle(fontSize: 80))),
              ),
            ),
            const SizedBox(height: 24),
            _buildDetailCard('Name', coin['name'] ?? 'N/A'),
            _buildDetailCard('Price', coin['price'] ?? 'N/A'),
            _buildDetailCard('Years', coin['main_information']?['years']?.toString() ?? 'N/A'),
            _buildDetailCard('Type', coin['main_information']?['type']?.toString() ?? 'N/A'),
            _buildDetailCard('Composition', coin['physical_features']?['composition']?.toString() ?? 'N/A'),
            _buildDetailCard('Weight', coin['physical_features']?['weight']?.toString() ?? 'N/A'),
            _buildDetailCard('Diameter', coin['physical_features']?['diameter']?.toString() ?? 'N/A'),
            _buildDetailCard('Shape', coin['physical_features']?['shape']?.toString() ?? 'N/A'),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCard(String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, AppColors.lightGold.withValues(alpha: 0.05)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: AppColors.gold.withValues(alpha: 0.12), blurRadius: 12, offset: const Offset(0, 4)),
        ],
        border: Border.all(color: AppColors.lightGold.withValues(alpha: 0.25), width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.gold.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.info_outline, color: AppColors.gold, size: 18),
              ),
              const SizedBox(width: 12),
              Text(label, style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.textDark)),
            ],
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: GoogleFonts.poppins(fontSize: 14, color: AppColors.textGray, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
