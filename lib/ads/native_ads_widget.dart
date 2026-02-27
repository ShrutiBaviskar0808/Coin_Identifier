import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class NativeAdsWidgets extends StatefulWidget {
  final bool? small;
  final double? padding;

  const NativeAdsWidgets({super.key, this.small, this.padding});

  @override
  State<NativeAdsWidgets> createState() => _NativeAdsWidgetsState();
}

class _NativeAdsWidgetsState extends State<NativeAdsWidgets> {
  NativeAd? _nativeAd;
  bool _isAdLoaded = false;

  // Add your ad unit ID here
  static const String nativeAdUnitId = 'ca-app-pub-3940256099942544/2247696110'; // Test ID

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  void _loadAd() {
    _nativeAd = NativeAd(
      adUnitId: nativeAdUnitId,
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          if (mounted) setState(() => _isAdLoaded = true);
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
      nativeTemplateStyle: NativeTemplateStyle(
        templateType: widget.small == true ? TemplateType.small : TemplateType.medium,
        mainBackgroundColor: Colors.white,
        cornerRadius: 12.0,
      ),
    )..load();
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isAdLoaded && _nativeAd != null) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: widget.padding ?? 0),
        height: widget.small == true ? 90 : 300,
        child: AdWidget(ad: _nativeAd!),
      );
    }
    
    return Container(
      margin: EdgeInsets.symmetric(vertical: widget.padding ?? 0),
      height: widget.small == true ? 90 : 145,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.10 * 255).round()),
            blurRadius: 10,
            offset: const Offset(0, 5),
            spreadRadius: 0,
          )
        ],
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoActivityIndicator(color: Colors.black),
          SizedBox(height: 5),
          Text('Ad loading...', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}