import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Privacy & Security', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection('Data Protection', Icons.shield, 'Your personal data is encrypted using industry-standard AES-256 encryption. All information is stored securely on our servers with multiple layers of protection. We comply with GDPR and other international data protection regulations to ensure your privacy is maintained at all times.'),
          _buildSection('Camera Access', Icons.camera_alt, 'Camera permission is only used when you actively scan coins. We never access your camera in the background or store any images without your explicit consent. All scanned images are processed locally on your device first before any data is transmitted.'),
          _buildSection('Location Services', Icons.location_on, 'We do not collect or track your location data. The app functions fully without requiring any location permissions. Your privacy and anonymity are our top priorities.'),
          _buildSection('Third-Party Sharing', Icons.people, 'We never sell, rent, or share your personal information with third parties for marketing purposes. Any data shared with service providers is strictly limited to what is necessary for app functionality and is protected by confidentiality agreements.'),
          _buildSection('Data Retention', Icons.storage, 'Your scan history and saved coins are stored locally on your device and in your secure cloud account. You can delete any data at any time through the app settings. We automatically delete inactive accounts after 2 years of no activity.'),
          _buildSection('Account Security', Icons.lock, 'We recommend using a strong password and enabling two-factor authentication for enhanced security. Your password is hashed and salted before storage, making it impossible for anyone, including our staff, to access your account credentials.'),
        ],
      ),
    );
  }

  Widget _buildSection(String title, IconData icon, String content) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: AppColors.lightGold.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(12)),
                child: Icon(icon, color: AppColors.gold, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(child: Text(title, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark))),
            ],
          ),
          const SizedBox(height: 12),
          Text(content, style: GoogleFonts.poppins(fontSize: 14, color: AppColors.textDark, height: 1.6), textAlign: TextAlign.justify),
        ],
      ),
    );
  }
}
