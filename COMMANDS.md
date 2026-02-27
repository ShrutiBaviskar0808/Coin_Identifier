# Commands Reference - Ad Integration

## 🚀 Quick Start Commands

### 1. Install Dependencies
```bash
flutter pub get
```

### 2. Clean Build (if needed)
```bash
flutter clean
flutter pub get
```

### 3. Run on Android
```bash
flutter run
```

### 4. Run on iOS
```bash
cd ios
pod install
cd ..
flutter run -d ios
```

### 5. Build for Release

**Android APK:**
```bash
flutter build apk --release
```

**Android App Bundle:**
```bash
flutter build appbundle --release
```

**iOS:**
```bash
flutter build ios --release
```

## 🔧 Troubleshooting Commands

### Clear Flutter Cache
```bash
flutter clean
flutter pub cache repair
flutter pub get
```

### Rebuild iOS Pods
```bash
cd ios
rm -rf Pods
rm Podfile.lock
pod install
cd ..
flutter run -d ios
```

### Check Flutter Doctor
```bash
flutter doctor -v
```

### View Logs
```bash
# Android
flutter logs

# iOS
flutter logs -d ios
```

## 📦 Package Management

### Update Dependencies
```bash
flutter pub upgrade
```

### Check Outdated Packages
```bash
flutter pub outdated
```

### Get Specific Package
```bash
flutter pub add google_mobile_ads
```

## 🧪 Testing Commands

### Run Tests
```bash
flutter test
```

### Run with Verbose Logging
```bash
flutter run -v
```

### Run on Specific Device
```bash
# List devices
flutter devices

# Run on specific device
flutter run -d <device-id>
```

## 🏗️ Build Commands

### Debug Build
```bash
flutter build apk --debug
flutter build ios --debug
```

### Profile Build
```bash
flutter build apk --profile
flutter build ios --profile
```

### Release Build
```bash
flutter build apk --release
flutter build appbundle --release
flutter build ios --release
```

## 📱 Device-Specific Commands

### Android Emulator
```bash
# List emulators
flutter emulators

# Launch emulator
flutter emulators --launch <emulator-id>

# Run on emulator
flutter run
```

### iOS Simulator
```bash
# Open simulator
open -a Simulator

# Run on simulator
flutter run -d ios
```

## 🔍 Debugging Commands

### Analyze Code
```bash
flutter analyze
```

### Format Code
```bash
flutter format .
```

### Check Performance
```bash
flutter run --profile
```

### Enable DevTools
```bash
flutter pub global activate devtools
flutter pub global run devtools
```

## 📊 Ad-Specific Testing

### Test with Verbose Ad Logging
Add to your code temporarily:
```dart
// In main.dart after MobileAds.instance.initialize()
MobileAds.instance.updateRequestConfiguration(
  RequestConfiguration(
    testDeviceIds: ['YOUR_TEST_DEVICE_ID'],
  ),
);
```

### Get Test Device ID
Run the app and check logs for:
```
Use RequestConfiguration.Builder().setTestDeviceIds(Arrays.asList("YOUR_DEVICE_ID"))
```

## 🛠️ Maintenance Commands

### Update Flutter
```bash
flutter upgrade
```

### Update Flutter Channel
```bash
flutter channel stable
flutter upgrade
```

### Check Flutter Version
```bash
flutter --version
```

## 📝 Pre-Release Checklist Commands

```bash
# 1. Clean everything
flutter clean

# 2. Get dependencies
flutter pub get

# 3. Analyze code
flutter analyze

# 4. Format code
flutter format .

# 5. Run tests
flutter test

# 6. Build release
flutter build appbundle --release  # Android
flutter build ios --release         # iOS

# 7. Check build size
flutter build apk --analyze-size
```

## 🚨 Emergency Commands

### If Build Fails
```bash
flutter clean
rm -rf build/
rm -rf .dart_tool/
flutter pub cache repair
flutter pub get
flutter run
```

### If iOS Build Fails
```bash
cd ios
rm -rf Pods
rm -rf Podfile.lock
rm -rf .symlinks
pod cache clean --all
pod install
cd ..
flutter clean
flutter run -d ios
```

### If Android Build Fails
```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
flutter run
```

## 📱 Platform-Specific Setup

### Android Setup
```bash
# Check Android licenses
flutter doctor --android-licenses

# Accept all licenses
flutter doctor --android-licenses
```

### iOS Setup
```bash
# Install CocoaPods
sudo gem install cocoapods

# Update CocoaPods
pod repo update

# Install pods
cd ios && pod install && cd ..
```

## 🎯 Production Deployment

### Android Play Store
```bash
# Build app bundle
flutter build appbundle --release

# Output location:
# build/app/outputs/bundle/release/app-release.aab
```

### iOS App Store
```bash
# Build for App Store
flutter build ios --release

# Then open Xcode:
open ios/Runner.xcworkspace

# Archive and upload from Xcode
```

## 📊 Performance Profiling

### Profile Mode
```bash
flutter run --profile
```

### Trace Performance
```bash
flutter run --trace-startup
```

### Memory Profiling
```bash
flutter run --profile --trace-skia
```

## 🔐 Code Signing

### Android Signing
```bash
# Generate keystore
keytool -genkey -v -keystore ~/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key

# Build signed APK
flutter build apk --release
```

### iOS Signing
```bash
# Open Xcode for signing
open ios/Runner.xcworkspace

# Configure signing in Xcode UI
```

## 📚 Documentation Commands

### Generate Documentation
```bash
dart doc .
```

### View Documentation
```bash
dart doc . && open doc/api/index.html
```

## 🎉 Success Indicators

After running `flutter pub get`, you should see:
```
Running "flutter pub get" in coin_identifier...
Resolving dependencies...
+ google_mobile_ads 5.2.0
...
Got dependencies!
```

After running `flutter run`, you should see:
```
Launching lib/main.dart on <device> in debug mode...
✓ Built build/app/outputs/flutter-apk/app-debug.apk
Installing build/app/outputs/flutter-apk/app-debug.apk...
Syncing files to device...
Flutter run key commands.
```

---

## 🆘 Need Help?

### Check Documentation
- Flutter: https://docs.flutter.dev
- Google Mobile Ads: https://pub.dev/packages/google_mobile_ads
- AdMob: https://admob.google.com

### Common Issues
1. **"MobileAds not initialized"** → Already fixed in main.dart
2. **"Ad failed to load"** → Check internet connection
3. **"Build failed"** → Run `flutter clean && flutter pub get`
4. **"Pod install failed"** → Run `pod repo update`

### Quick Fix Command
```bash
flutter clean && flutter pub get && flutter run
```

This solves 90% of build issues! 🎯
