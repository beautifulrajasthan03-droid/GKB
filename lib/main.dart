import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(const GKBApp());
}

class GKBApp extends StatelessWidget {
  const GKBApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GKB - Baba Kedarnath',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const GKBSuccessScreen(),
    );
  }
}

class GKBSuccessScreen extends StatefulWidget {
  const GKBSuccessScreen({super.key});

  @override
  State<GKBSuccessScreen> createState() => _GKBSuccessScreenState();
}

class _GKBSuccessScreenState extends State<GKBSuccessScreen> {
  final FlutterTts _flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _playSuccessVoice();
  }

  Future<void> _playSuccessVoice() async {
    await _flutterTts.setLanguage("hi-IN");
    await _flutterTts.setSpeechRate(0.45);
    await _flutterTts.setVolume(1.0);
    await _flutterTts.setPitch(1.0);

    String message = "आपकी फेस स्कैन पूरी तरह सफलतापर्वक हो चुकी है, हर हर महादेव! बाबा केदारनाथ के चरणों में कोटि-कोटि प्रणाम।";
    await _flutterTts.speak(message);
  }

  void _skipAndStopVoice() {
    _flutterTts.stop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Skipped successfully!')),
    );
  }

  @override
  void dispose() {
    _flutterTts.stop();
    super.dispose();
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[400],
      appBar: AppBar(
        title: const Text('Jai Baba Kedarnath'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: _skipAndStopVoice,
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.temple_hindu,
                size: 90,
                color: Colors.deepOrange,
              ),
              const SizedBox(height: 30),
              const Text(
                'हर हर महादेव! 🙏\nॐ नमः शिवाय',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'आपकी फेस स्कैन पूरी तरह सफलतापर्वक हो चुकी है, हर हर महादेव! बाबा केदारनाथ के चरणों में कोटि-कोटि प्रणाम।',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

