# Ad Integration Guide

## Overview
This app now includes Google Mobile Ads integration with Banner Ads, Native Ads, and Interstitial Ads across all screens.

## Ad Types Implemented

### 1. Banner Ads
- **Location**: Bottom of screens (above navigation bar on Home screen)
- **Screens**: Home, Scan, Result, Collection, Profile, Market
- **Size**: Standard banner (320x50)

### 2. Native Ads
- **Location**: Integrated within content
- **Screens**: Home (middle of content), Result, Collection (in grid), Profile, Market
- **Template**: Medium template with custom styling

### 3. Interstitial Ads
- **Trigger**: Every 3 screen changes in Home screen navigation
- **Trigger**: After capturing both coin images in Scan screen
- **Full-screen ads shown at strategic points

## Implementation Details

### Files Modified
1. `pubspec.yaml` - Added google_mobile_ads dependency
2. `lib/main.dart` - Initialize Mobile Ads SDK
3. `lib/utils/ad_helper.dart` - Centralized ad management
4. `lib/screens/home_screen.dart` - Banner + Native + Interstitial
5. `lib/screens/scan_screen.dart` - Banner + Interstitial
6. `lib/screens/result_screen.dart` - Banner + Native
7. `lib/screens/collection_screen.dart` - Banner + Native
8. `lib/screens/profile_screen.dart` - Banner + Native
9. `lib/screens/market_screen.dart` - Banner + Native
10. `android/app/src/main/AndroidManifest.xml` - AdMob App ID
11. `ios/Runner/Info.plist` - AdMob App ID

### Ad Unit IDs (Test IDs)
Currently using Google's test ad unit IDs:
- **Banner**: Android: `ca-app-pub-3940256099942544/6300978111`, iOS: `ca-app-pub-3940256099942544/2934735716`
- **Interstitial**: Android: `ca-app-pub-3940256099942544/1033173712`, iOS: `ca-app-pub-3940256099942544/4411468910`
- **Native**: Android: `ca-app-pub-3940256099942544/2247696110`, iOS: `ca-app-pub-3940256099942544/3986624511`

## Setup Instructions

### 1. Install Dependencies
```bash
flutter pub get
```

### 2. Replace Test Ad IDs with Production IDs
When ready for production, update `lib/utils/ad_helper.dart`:
- Replace test ad unit IDs with your actual AdMob ad unit IDs
- Update App IDs in AndroidManifest.xml and Info.plist

### 3. Create AdMob Account
1. Go to https://admob.google.com
2. Create an account and register your app
3. Create ad units for Banner, Interstitial, and Native ads
4. Copy the ad unit IDs

### 4. Update Configuration Files

**Android** (`android/app/src/main/AndroidManifest.xml`):
```xml
<meta-data
    android:name="com.google.android.gms.ads.APPLICATION_ID"
    android:value="YOUR_ANDROID_APP_ID"/>
```

**iOS** (`ios/Runner/Info.plist`):
```xml
<key>GADApplicationIdentifier</key>
<string>YOUR_IOS_APP_ID</string>
```

## Ad Placement Strategy

### Home Screen
- **Banner Ad**: Above bottom navigation
- **Native Ad**: Between market ticker and quick actions
- **Interstitial Ad**: Every 3 tab switches

### Scan Screen
- **Banner Ad**: Top of camera view
- **Interstitial Ad**: After capturing both coin sides

### Result Screen
- **Banner Ad**: Top of screen
- **Native Ad**: Between info cards and details section

### Collection Screen
- **Banner Ad**: Top of screen
- **Native Ad**: In grid at position 5

### Profile Screen
- **Banner Ad**: Top of screen
- **Native Ad**: Before menu items

### Market Screen
- **Banner Ad**: Top of screen
- **Native Ad**: Between market cards and trending coins

## Best Practices

1. **Ad Frequency**: Interstitial ads show every 3 screen changes to avoid annoying users
2. **Ad Disposal**: All ads are properly disposed when screens are closed
3. **Error Handling**: Ads fail gracefully if they don't load
4. **User Experience**: Ads are placed to minimize disruption to app functionality

## Testing

1. Run the app in debug mode
2. Test ads will appear automatically
3. Verify ads load on all screens
4. Test interstitial ad triggers

## Revenue Optimization Tips

1. Monitor ad performance in AdMob dashboard
2. Experiment with ad placements
3. Use mediation for better fill rates
4. A/B test different ad formats
5. Respect user experience - don't overload with ads

## Troubleshooting

### Ads Not Showing
- Check internet connection
- Verify ad unit IDs are correct
- Check AdMob account status
- Review app logs for error messages

### Build Errors
- Run `flutter clean`
- Run `flutter pub get`
- Rebuild the app

## Important Notes

⚠️ **Test Ads Only**: Current implementation uses test ad IDs. Replace with production IDs before release.

⚠️ **AdMob Policy**: Ensure your app complies with AdMob policies before publishing.

⚠️ **Privacy**: Update your privacy policy to mention ad usage and data collection.

## Next Steps

1. Create AdMob account
2. Register your app
3. Create ad units
4. Replace test IDs with production IDs
5. Test thoroughly
6. Submit for review
7. Publish app

## Support

For AdMob support: https://support.google.com/admob
For Flutter ads plugin: https://pub.dev/packages/google_mobile_ads
