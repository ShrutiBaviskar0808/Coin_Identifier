import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAds extends StatefulWidget {
  final double? bottomPadding;

  const BannerAds({super.key, this.bottomPadding});

  @override
  State<BannerAds> createState() => BannerAdsState();
}

class BannerAdsState extends State<BannerAds> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;

  // Add your ad unit ID here
  static const String bannerAdUnitId = 'ca-app-pub-3940256099942544/6300978111'; // Test ID

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  void _loadAd() {
    _bannerAd = BannerAd(
      adUnitId: bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (mounted) setState(() => _isLoaded = true);
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    )..load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoaded && _bannerAd != null) {
      return Container(
        height: 52,
        color: Colors.white,
        child: AdWidget(ad: _bannerAd!),
      );
    }
    return Container(
      height: 52,
      color: Colors.white,
      child: const Center(child: SizedBox()),
    );
  }
}
