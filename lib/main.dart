// =====================================================================
// Project: Smart Digital India (GKB App)
// Developer / App Builder: Govind Kumar Beragi (GKB)
// ---------------------------------------------------------------------
// MEHNAT KI KAMAAI KA PEHRA (Zero Financial Auto-Pilot Rule):
// PhonePe, Google Pay jaisi financial apps voice command se khul sakti hain 
// (taaki user ko app dhundni na pade), lekin paise bhejne, transfer karne 
// ya payment karne ka kaam voice se kabhi nahi hoga! 
// Aage ka sara kaam user ko khud apni ungliyon aur pin se karna hoga.
// ---------------------------------------------------------------------
// "Main app dobara bana lunga, par kisi ka paisa nahi dubne dunga!" 
// - Govind Kumar Beragi (GKB)
// ---------------------------------------------------------------------
// Log jhooth bol sakte hain par coding mein kiya hua kaam 
// kabhi delete nahi hota. Mera sapna Smart Digital India mein 
// phone ko chalana aasan banana hai, kisi ka ek rupaye bhi 
// apne paas nahi rakhna GKB. Yahi meri zimmedari ka pehla saboot hai!
// =====================================================================

import 'package:flutter/material.dart';

void main() {
  runApp(const GKBApp());
}

class GKBApp extends StatelessWidget {
  const GKBApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GKB Secure App - Digital India',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      home: const GKBCheckRegistrationScreen(),
    );
  }
}

// 1. App registration check gate (Mandatory Registration)
class GKBCheckRegistrationScreen extends StatefulWidget {
  const GKBCheckRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<GKBCheckRegistrationScreen> createState() => _GKBCheckRegistrationScreenState();
}

class _GKBCheckRegistrationScreenState extends State<GKBCheckRegistrationScreen> {
  bool _isAppRegisteredInPhone = false; 

  void _simulateAppRegistered(bool register) {
    setState(() {
      _isAppRegisteredInPhone = register;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isAppRegisteredInPhone) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('GKB Security Gate: Not Registered'),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.warning_amber_rounded, size: 80, color: Colors.orangeAccent),
              const SizedBox(height: 20),
              const Text(
                'GKB App is not registered on this phone!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              const Text(
                'Rule: Since the app is not registered, this phone will run via normal manual touch only. Voice magic is disabled.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () => _simulateAppRegistered(true),
                child: const Text('Register & Activate GKB Voice Guard', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      );
    }

    return const GKBSecureDashboard();
  }
}

// 2. Secure Dashboard for registered users
class GKBSecureDashboard extends StatefulWidget {
  const GKBSecureDashboard({Key? key}) : super(key: key);

  @override
  State<GKBSecureDashboard> createState() => _GKBSecureDashboardState();
}

class _GKBSecureDashboardState extends State<GKBSecureDashboard> {
  String _currentStatus = 'GKB Secure Voice Shield Active 🛡️';
  String _financialWarning = 'Zero Financial Auto-Pilot: ON (Voice money transfer is blocked)';

  void _executeVoiceAction(String appName) {
    setState(() {
      if (appName == 'PhonePe' || appName == 'GooglePay') {
        _currentStatus = '$appName Display Switched via Voice! 📱';
        _financialWarning = 'Warning: App opened, user will send money manually using pin!';
      } else {
        _currentStatus = 'Switched to $appName via Voice Command 🚀';
        _financialWarning = 'Financial Guard: Safe';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GKB Secure Master Dashboard'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Jai Baba Kedarnath! Welcome, Govind Bhai!',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.amber),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_currentStatus, style: const TextStyle(color: Colors.greenAccent, fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(_financialWarning, style: const TextStyle(color: Colors.orangeAccent, fontSize: 13)),
                ],
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Test Safe Voice Shortcuts:',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  onPressed: () => _executeVoiceAction('PhonePe'),
                  child: const Text('Say PhonePe', style: TextStyle(color: Colors.black)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  onPressed: () => _executeVoiceAction('Chrome'),
                  child: const Text('Say Chrome', style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
            const Spacer(),
            const Center(
              child: Text(
                'Main app dobara bana lunga, par kisi ka paisa nahi dubne dunga!\n- Govind Kumar Beragi (GKB)',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.amber, fontStyle: FontStyle.italic, fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

