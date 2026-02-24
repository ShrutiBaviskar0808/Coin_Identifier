import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/constants.dart';
import 'coin_details_screen.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  CameraController? _cameraController;
  bool _isFlashOn = false;
  bool _isCameraInitialized = false;
  String? _frontImage;
  String? _reverseImage;
  bool _isCapturingFront = true;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      _cameraController = CameraController(
        cameras.first,
        ResolutionPreset.high,
        enableAudio: false,
      );
      await _cameraController!.initialize();
      if (mounted) {
        setState(() => _isCameraInitialized = true);
      }
    }
  }

  Future<void> _toggleFlash() async {
    if (_cameraController != null) {
      setState(() => _isFlashOn = !_isFlashOn);
      await _cameraController!.setFlashMode(
        _isFlashOn ? FlashMode.torch : FlashMode.off,
      );
    }
  }

  Future<void> _pickFromGallery() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null && mounted) {
      _processImage(image.path);
    }
  }

  Future<void> _captureImage() async {
    if (_cameraController != null && _cameraController!.value.isInitialized) {
      final image = await _cameraController!.takePicture();
      if (mounted) {
        _processImage(image.path);
      }
    }
  }

  void _processImage(String imagePath) {
    setState(() {
      if (_isCapturingFront) {
        _frontImage = imagePath;
        _isCapturingFront = false;
      } else {
        _reverseImage = imagePath;
      }
    });

    if (_frontImage != null && _reverseImage != null) {
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => CoinDetailsScreen(
                frontImage: _frontImage!,
                reverseImage: _reverseImage!,
              ),
            ),
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          if (_isCameraInitialized && _cameraController != null)
            SizedBox.expand(
              child: CameraPreview(_cameraController!),
            )
          else
            const Center(child: CircularProgressIndicator(color: Colors.white)),
          CustomPaint(
            size: Size.infinite,
            painter: CircleOverlayPainter(),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Icon(
                          _isFlashOn ? Icons.flash_on : Icons.flash_off,
                          color: Colors.white,
                        ),
                        onPressed: _toggleFlash,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                if (_frontImage != null)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.green.withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.check_circle, color: Colors.white),
                        const SizedBox(width: 8),
                        Text(
                          'Front side captured',
                          style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 16),
                Container(
                  margin: const EdgeInsets.all(24),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Text(
                        _isCapturingFront ? 'Capture Front Side' : 'Capture Reverse Side',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Place coin inside circle',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: _pickFromGallery,
                            icon: const Icon(Icons.photo_library, color: Colors.white, size: 30),
                          ),
                          GestureDetector(
                            onTap: _captureImage,
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: AppColors.goldGradient,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.gold.withValues(alpha: 0.5),
                                    blurRadius: 20,
                                  ),
                                ],
                              ),
                              child: const Icon(Icons.camera, size: 35, color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 50),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CircleOverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withValues(alpha: 0.6)
      ..style = PaintingStyle.fill;

    final circlePaint = Paint()
      ..color = AppColors.gold
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    final center = Offset(size.width / 2, size.height / 2);
    const radius = 140.0;

    path.addOval(Rect.fromCircle(center: center, radius: radius));
    path.fillType = PathFillType.evenOdd;

    canvas.drawPath(path, paint);
    canvas.drawCircle(center, radius, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
