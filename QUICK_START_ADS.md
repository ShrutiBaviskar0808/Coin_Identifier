# Quick Start Guide - Running the App with Ads

## Step 1: Install Dependencies
```bash
flutter pub get
```

## Step 2: Run the App
```bash
# For Android
flutter run

# For iOS
flutter run -d ios
```

## Step 3: Test Ads

### Test Banner Ads
1. Open the app
2. Navigate to any screen (Home, Scan, Collection, Profile, Market, Result)
3. Look for banner ad at the top or bottom of the screen
4. Banner should be 320x50 pixels

### Test Native Ads
1. Scroll through content on any screen
2. Native ads appear as integrated content cards
3. Look for ads with gold/cream background matching app theme
4. Height should be approximately 300px

### Test Interstitial Ads

**Method 1: Home Screen Navigation**
1. Open the app on Home screen
2. Tap on different bottom navigation tabs
3. After 3 tab switches, interstitial ad will appear
4. Close the ad to continue

**Method 2: Scan Screen**
1. Go to Scan tab
2. Capture front side of coin (or select from gallery)
3. Capture reverse side of coin (or select from gallery)
4. Interstitial ad will appear before showing results
5. Close the ad to see coin details

## Expected Behavior

### ✅ Ads Should:
- Load within 2-3 seconds
- Display Google test ads (colorful test banners)
- Not crash the app if they fail to load
- Dispose properly when leaving screens
- Show "Test Ad" label (since using test IDs)

### ❌ If Ads Don't Show:
1. Check internet connection
2. Wait a few seconds for ads to load
3. Check console for error messages
4. Verify `flutter pub get` was run
5. Try rebuilding: `flutter clean && flutter pub get && flutter run`

## Ad Locations Reference

| Screen | Banner Ad | Native Ad | Interstitial Ad |
|--------|-----------|-----------|-----------------|
| Home | ✅ Bottom (above nav) | ✅ Middle of content | ✅ Every 3 tab switches |
| Scan | ✅ Top | ❌ | ✅ After capture |
| Result | ✅ Top | ✅ Middle | ❌ |
| Collection | ✅ Top | ✅ In grid (pos 5) | ❌ |
| Profile | ✅ Top | ✅ Before menu | ❌ |
| Market | ✅ Top | ✅ Middle | ❌ |

## Console Output to Expect

When ads load successfully:
```
Banner ad loaded
Native ad loaded
Interstitial ad loaded
```

When ads fail:
```
Banner ad failed to load: [error details]
Native ad failed to load: [error details]
Interstitial ad failed to load: [error details]
```

## Common Issues & Solutions

### Issue: "MobileAds not initialized"
**Solution**: Already handled in `main.dart` with `MobileAds.instance.initialize()`

### Issue: Ads not showing on iOS
**Solution**: 
1. Check Info.plist has GADApplicationIdentifier
2. Run `pod install` in ios folder
3. Rebuild the app

### Issue: Ads not showing on Android
**Solution**:
1. Check AndroidManifest.xml has AdMob App ID
2. Verify internet permissions are added
3. Rebuild the app

### Issue: "Ad failed to load: 3"
**Solution**: This is normal for test ads sometimes. Wait and try again.

## Performance Notes

- First ad load may take 3-5 seconds
- Subsequent ads load faster (cached)
- App remains responsive while ads load
- Ads load in background, don't block UI

## Testing Checklist

- [ ] App builds without errors
- [ ] App runs on device/emulator
- [ ] Banner ads visible on all screens
- [ ] Native ads visible on all screens
- [ ] Interstitial ad shows after 3 tab switches
- [ ] Interstitial ad shows after coin scan
- [ ] App doesn't crash when ads fail
- [ ] Navigation works smoothly with ads
- [ ] Ads dispose when leaving screens

## Ready for Production?

Before publishing to Play Store / App Store:

1. ✅ Create AdMob account
2. ✅ Register your app
3. ✅ Create ad units (Banner, Native, Interstitial)
4. ✅ Replace test IDs in `lib/utils/ad_helper.dart`
5. ✅ Update App IDs in AndroidManifest.xml and Info.plist
6. ✅ Test with real ads using test devices
7. ✅ Add privacy policy
8. ✅ Submit for AdMob review
9. ✅ Publish app

## Support

- **AdMob Issues**: https://support.google.com/admob
- **Flutter Plugin Issues**: https://github.com/googleads/googleads-mobile-flutter
- **Documentation**: See `AD_INTEGRATION.md` and `AD_INTEGRATION_SUMMARY.md`

---

**Current Status**: ✅ Ready to test with Google test ads
**Production Status**: ⚠️ Requires real AdMob account and ad unit IDs

Happy Testing! 🚀
