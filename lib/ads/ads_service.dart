import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsServices with WidgetsBindingObserver {
  static int clickCount = 0;
  static InterstitialAd? _interstitialAd;
  static bool _isInterstitialReady = false;

  // Add your ad unit IDs here
  static const String interstitialAdUnitId = 'ca-app-pub-3940256099942544/1033173712'; // Test ID

  /// Initialize and load interstitial ad
  static Future<void> loadAllInterstitialAds() async {
    await InterstitialAd.load(
      adUnitId: interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _isInterstitialReady = true;
          debugPrint('Interstitial ad loaded');
        },
        onAdFailedToLoad: (error) {
          _isInterstitialReady = false;
          debugPrint('Interstitial ad failed to load: $error');
        },
      ),
    );
  }

  /// Show interstitial ad
  static void showinterstitialAds() {
    if (_isInterstitialReady && _interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _isInterstitialReady = false;
          loadAllInterstitialAds();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _isInterstitialReady = false;
          loadAllInterstitialAds();
        },
      );
      _interstitialAd!.show();
      debugPrint('Interstitial AD Display');
    } else {
      debugPrint('Interstitial ad not ready');
    }
  }
}

//
//
//
//
//
//
//
//   /// load all interstitial ads
//   static Future<void> loadAllInterstitialAds() async {
//     final List<String> list = adsModel.interstitialPriority ?? [];
//     int clickCountAd = clickCount;
//
//     if (clickCountAd >= adsModel.commonInterstial!.length) {
//       AppSharedPreference.setAdsClickCount(0);
//       clickCountAd = 0;
//     }
//     for (int i = clickCountAd; i < list.length; i++) {
//       debugPrint('---------: ${i}');
//       if (list[i] == "google") {
//         adsInterstitialLoad(adsModel.commonInterstial![i]);
//         break;
//       } else if (list[i] == "facebook") {
//         loadFacebookInterstitial(adsModel.commonInterstial![i]);
//         break;
//       } else {
//         break;
//       }
//     }
//   }
//
//   /// show all interstitial ads
//   static Future<void> showInterstitialAds(BuildContext context) async {
//     final List<String> list = adsModel.interstitialPriority ?? [];
//     int clickCountAd = clickCount;
//
//     if (clickCountAd >= adsModel.commonInterstial!.length) {
//       AppSharedPreference.setAdsClickCount(0);
//       clickCountAd = 0;
//     }
//     for (int i = clickCountAd; i < list.length; i++) {
//       debugPrint('---------: show ${i}');
//       if (list[i] == "google") {
//         if (AppSharedPreference.getFailedAdsGoogle!) {
//           adsFailedServices.showInterstitialAds(context);
//           AppSharedPreference.setFailedAdsGoogle(false);
//         } else {
//           googleInterstitial?.show();
//           googleInterstitial?.dispose();
//         }
//         clickCount = clickCountAd +1;
//         loadAllInterstitialAds();
//         break;
//       } else if (list[i] == "facebook") {
//         if (AppSharedPreference.getFailedAdsFacebook!) {
//           debugPrint('---------: failed facebook');
//           adsFailedServices.showInterstitialAds(context);
//           AppSharedPreference.setFailedAdsFacebook(false);
//         } else {
//           showInterstitialFacebook();
//         }
//         clickCount = clickCountAd +1;
//         loadAllInterstitialAds();
//         break;
//       } else if (list[i] == "image") {
//         showOverlay(context);
//         clickCount = clickCountAd +1;
//         loadAllInterstitialAds();
//         break;
//       } else {
//         clickCount = clickCountAd +1;
//         loadAllInterstitialAds();
//         break;
//       }
//     }
//   }
//
//   /// facebook interstitial ads load
//   static Future<void> loadFacebookInterstitial(String id) async {
//     FacebookInterstitialAd.loadInterstitialAd(
//         placementId: id,
//         listener: (result, value) {
//           if (result == InterstitialAdResult.LOADED) {
//           } else if (result == InterstitialAdResult.ERROR) {
//             AppSharedPreference.setFailedAdsFacebook(true);
//             debugPrint("===>>> failed");
//           } else if (result == InterstitialAdResult.CLICKED) {
//             debugPrint("===>>> CLICKED");
//           } else if (result == InterstitialAdResult.DISMISSED) {
//             loadFacebookInterstitial(id);
//             debugPrint("===>>> DISMISSED");
//           } else if (result == InterstitialAdResult.DISPLAYED) {
//             debugPrint("===>>> DISPLAYED");
//           }
//         });
//   }
//
//   /// google interstitial ads load
//   static Future<void> adsInterstitialLoad(String id) async {
//     InterstitialAd.load(
//         adUnitId: id,
//         request: AdRequest(),
//         adLoadCallback: InterstitialAdLoadCallback(
//           onAdLoaded: (InterstitialAd ad) {
//             googleInterstitial = ad;
//           },
//           onAdFailedToLoad: (LoadAdError error) {
//             debugPrint('InterstitialAd failed to load: $error');
//             AppSharedPreference.setFailedAdsGoogle(true);
//           },
//         ));
//   }
//
//   /// facebook ads show
//   static Future<void> showInterstitialFacebook() async {
//     FacebookInterstitialAd.showInterstitialAd();
//   }
//
//   /// show image interstitial
//   static void showOverlay(BuildContext context) {
//     OverlayEntry? entry;
//     entry = OverlayEntry(
//       builder: (context) => Container(
//         color: Colors.black,
//         child: Center(
//           child: Container(
//             //  width: 100.w,
//             child: Stack(
//               children: [
//                 GestureDetector(
//                   onTap: () async {
//                     launchURL();
//                     Future.delayed(Duration(seconds: 2), () {
//                       entry?.remove();
//                     });
//                   },
//                   child: Container(
//                     child: Image.network(
//                       "${moreData.imgUrlSplash}",
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   right: 10,
//                   top: 10,
//                   child: GestureDetector(
//                     onTap: () {
//                       entry?.remove();
//                     },
//                     child: Container(
//                       padding: EdgeInsets.all(2),
//                       decoration: BoxDecoration(
//                         color: Colors.grey,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(
//                         Icons.clear,
//                         size: 24,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//     final overlay = Overlay.of(context);
//     overlay.insert(entry);
//   }
//
//   /// image url launcher
//   static void launchURL() async {
//     try {
//       await launch(
//         moreData.isImagePlaystore == "y"
//             ? moreData.packageName != null
//             ? "https://play.google.com/store/apps/details?id=${moreData.packageName}"
//             : 'https://www.google.co.in'
//             : moreData.weblink != null
//             ? "${moreData.weblink}"
//             : "https://www.google.co.in",
//       );
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }
//
//   /// facebook rewards ads load
//   static Future<void> facebookRewardsAds(String id) async {
//     FacebookRewardedVideoAd.loadRewardedVideoAd(
//       placementId: id,
//       listener: (result, value) {
//         if (result == RewardedVideoAdResult.LOADED) if (result ==
//             RewardedVideoAdResult.VIDEO_COMPLETE) debugPrint("Video completed");
//         loadAllRewardsAds();
//         if (result == RewardedVideoAdResult.VIDEO_CLOSED) loadAllRewardsAds();
//         if (result == RewardedVideoAdResult.ERROR) loadAllRewardsAds();
//         debugPrint("Error $value");
//       },
//     );
//   }
//
//   /// facebook rewards show
//   static Future<void> facebookRewardsShow() async {
//     FacebookRewardedVideoAd.showRewardedVideoAd();
//   }
//
//   /// google rewards ads load
//   static Future<void> googleRewardsAdsLoad(String id) async {
//     RewardedAd.load(
//       adUnitId: id,
//       request: AdRequest(),
//       rewardedAdLoadCallback: RewardedAdLoadCallback(
//         onAdLoaded: (RewardedAd ad) {
//           debugPrint('$ad loaded.');
//           rewardedAd = ad;
//         },
//         onAdFailedToLoad: (LoadAdError error) {
//           debugPrint('RewardedAd failed to load: $error');
//           loadAllRewardsAds();
//         },
//       ),
//     );
//   }
//
//   ///google reward ads show
//   static Future<void> googleRewardsAdsShow(String id) async {
//     rewardedAd?.show(
//         onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem) {});
//     rewardedAd?.fullScreenContentCallback = FullScreenContentCallback(
//       onAdShowedFullScreenContent: (RewardedAd ad) =>
//           debugPrint('$ad onAdShowedFullScreenContent.'),
//       onAdDismissedFullScreenContent: (RewardedAd ad) {
//         debugPrint('$ad onAdDismissedFullScreenContent.');
//         ad.dispose();
//         loadAllRewardsAds();
//       },
//       onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
//         debugPrint('$ad onAdFailedToShowFullScreenContent: $error');
//         ad.dispose();
//         loadAllRewardsAds();
//       },
//       onAdImpression: (RewardedAd ad) => debugPrint('$ad impression occurred.'),
//     );
//   }
//
//   /// load rewards ads
//   static Future<void> loadAllRewardsAds() async {
//     final List<String> list = adsModel.rewardsPriority ?? [];
//     int clickCount = rewardClickCount;
//
//     if (clickCount >= adsModel.commonRewards!.length) {
//       rewardClickCount = 0;
//       clickCount = 0;
//     }
//     for (int i = clickCount; i < list.length; i++) {
//       if (list[i] == "rg") {
//         googleRewardsAdsLoad(adsModel.commonRewards![i]);
//         break;
//       } else if (list[i] == "rf") {
//         facebookRewardsAds(adsModel.commonRewards![i]);
//         break;
//       } else if (list[i] == "ig") {
//         adsInterstitialLoad(adsModel.commonRewards![i]);
//         break;
//       } else if (list[i] == "if") {
//         loadFacebookInterstitial(adsModel.commonRewards![i]);
//         break;
//       } else {
//         break;
//       }
//     }
//   }
//
//   /// show rewards ads
//   static Future<void> showAllRewardsAds() async {
//     final List<String> list = adsModel.rewardsPriority ?? [];
//     int clickCount = rewardClickCount;
//
//     if (clickCount >= adsModel.commonRewards!.length) {
//       rewardClickCount = 0;
//       clickCount = 0;
//     }
//     for (int i = clickCount; i < list.length; i++) {
//       if (list[i] == "rg") {
//         googleRewardsAdsShow(adsModel.commonRewards![i]);
//         rewardClickCount = clickCount + 1;
//         break;
//       } else if (list[i] == "rf") {
//         facebookRewardsShow();
//         rewardClickCount = clickCount + 1;
//         break;
//       } else if (list[i] == "ig") {
//         googleInterstitial?.show();
//         rewardClickCount = clickCount + 1;
//         googleInterstitial?.dispose();
//         loadAllRewardsAds();
//         break;
//       } else if (list[i] == "if") {
//         showInterstitialFacebook();
//         rewardClickCount = clickCount + 1;
//         loadAllRewardsAds();
//         break;
//       } else {
//         rewardClickCount = clickCount + 1;
//         loadAllRewardsAds();
//         break;
//       }
//     }
//   }
//
//
//   /// splash Ads
//   static Future<void> splashAds(Datum model) async {
//     if (model.splashPriority == "google") {
//       InterstitialAd.load(
//           adUnitId: "${model.splashAds}",
//           request: const AdRequest(),
//           adLoadCallback: InterstitialAdLoadCallback(
//             onAdLoaded: (InterstitialAd ad) {
//               ad.show();
//               Future.delayed(const Duration(milliseconds: 300), () {
//                 firstInitAds();
//               });
//               ad.dispose();
//             },
//             onAdFailedToLoad: (LoadAdError error) {
//               firstInitAds();
//             },
//           ));
//     } else if (model.splashPriority == "appopen") {
//       await AppOpenAd.load(
//         adUnitId: "${model.splashAds}",
//         request: const AdRequest(),
//         adLoadCallback: AppOpenAdLoadCallback(
//           onAdLoaded: (ad) {
//             ad.show();
//             firstInitAds();
//           },
//           onAdFailedToLoad: (error) {
//             firstInitAds();
//           },
//         ),
//       );
//     }else if (model.splashPriority == "facebook") {
//       FacebookInterstitialAd.loadInterstitialAd(
//           placementId: model.splashAds!,
//           listener: (result, value) {
//             if (result == InterstitialAdResult.ERROR) {
//               firstInitAds();
//             }
//           }).then((value) {
//         Future.delayed(const Duration(milliseconds: 300), () {
//           firstInitAds();
//         });
//         FacebookInterstitialAd.showInterstitialAd();
//       });
//     } else {
//       firstInitAds();
//     }
//
//   }
//
//
//
// /// in app Update
// // Future<void> inAppUpdates() async {
// //   InAppUpdate.checkForUpdate().then((info) {
// //     if (info.updateAvailability == UpdateAvailability.updateAvailable) {
// //       InAppUpdate.startFlexibleUpdate().then((_) {
// //         InAppUpdate.completeFlexibleUpdate();
// //       });
// //     }
// //   });
// // }
//
// }
//
// class AdsFailedServices {
//   InterstitialAd? googleInterstitial;
//   static MoreData moreData = MoreData();
//   static Datum adsModel = Datum();
//
//   Future<void> getAdsData() async {
//     if (AppSharedPreference.getAdsModel != null) {
//       adsModel = Datum.fromJson(json.decode(AppSharedPreference.getAdsModel!));
//       moreData =
//           MoreData.fromJson(json.decode(AppSharedPreference.getMoreAdsModel!));
//     }
//     loadAllInterstitialAds();
//   }
//
//   /// load all failed interstitial ads
//   Future<void> loadAllInterstitialAds() async {
//     if (adsModel.failPriority == "google") {
//       adsInterstitialLoad(adsModel.googleInterstialFail!);
//     } else if (adsModel.failPriority == "facebook") {
//       loadFacebookInterstitial(adsModel.facebookInterstialFail!);
//     }
//   }
//
//   /// show all interstitial ads
//   Future<void> showInterstitialAds(BuildContext context) async {
//     if (adsModel.failPriority == "google") {
//       debugPrint('---------: failed service google');
//       if (googleInterstitial != null) {
//         googleInterstitial?.show();
//         googleInterstitial?.dispose();
//         googleInterstitial = null;
//         debugPrint('---------: ✅ Failed service ad shown successfully');
//       } else {
//         debugPrint('---------: ⚠️ Failed service ad is NULL, cannot show');
//       }
//       loadAllInterstitialAds();
//     } else if (adsModel.failPriority == "facebook") {
//       showInterstitialFacebook();
//       loadAllInterstitialAds();
//     } else if (adsModel.failPriority == "image") {
//       AdsServices.showOverlay(context);
//       loadAllInterstitialAds();
//     } else {
//       loadAllInterstitialAds();
//     }
//   }
//
//   /// facebook interstitial ads load
//   static Future<void> loadFacebookInterstitial(String id) async {
//     FacebookInterstitialAd.loadInterstitialAd(
//         placementId: id,
//         listener: (result, value) {
//           if (result == InterstitialAdResult.LOADED) {
//           } else if (result == InterstitialAdResult.ERROR) {
//             debugPrint("===>>> failed");
//           } else if (result == InterstitialAdResult.CLICKED) {
//             debugPrint("===>>> CLICKED");
//           } else if (result == InterstitialAdResult.DISMISSED) {
//             loadFacebookInterstitial(id);
//             debugPrint("===>>> DISMISSED");
//           } else if (result == InterstitialAdResult.DISPLAYED) {
//             debugPrint("===>>> DISPLAYED");
//           }
//         });
//   }
//
//   /// google interstitial ads load
//   Future<void> adsInterstitialLoad(String id) async {
//     debugPrint('---------: failed service google load');
//     InterstitialAd.load(
//         adUnitId: id,
//         request: AdRequest(),
//         adLoadCallback: InterstitialAdLoadCallback(
//           onAdLoaded: (InterstitialAd ad) {
//             googleInterstitial = ad;
//           },
//           onAdFailedToLoad: (LoadAdError error) {
//             debugPrint('InterstitialAd failed to load: $error');
//           },
//         ));
//   }
//
//   /// facebook ads show
//   static Future<void> showInterstitialFacebook() async {
//     FacebookInterstitialAd.showInterstitialAd();
//   }
// }
