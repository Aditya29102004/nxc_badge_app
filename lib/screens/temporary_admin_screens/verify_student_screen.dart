import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'verify_student_result_screen.dart';

class VerifyStudentScreen extends StatefulWidget {
  const VerifyStudentScreen({Key? key}) : super(key: key);

  @override
  State<VerifyStudentScreen> createState() => _VerifyStudentScreenState();
}

class _VerifyStudentScreenState extends State<VerifyStudentScreen> {
  bool _isScanning = false;

  Future<void> _startNfcScan() async {
    if (_isScanning) return;
    setState(() => _isScanning = true);
    try {
      bool isAvailable = await NfcManager.instance.isAvailable();
      if (!isAvailable) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('NFC is not available on this device.')),
        );
        setState(() => _isScanning = false);
        return;
      }
      NfcManager.instance.startSession(
        onDiscovered: (NfcTag tag) async {
          // Here, you would fetch student data using the tag info.
          // For demo, use mock data:
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => VerifyStudentResultScreen(
                name: 'John doe',
                id: '001205156',
                course: 'Mathematics 101',
                session: 'Spring 225',
                avatarUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
              ),
            ),
          );
          NfcManager.instance.stopSession();
          setState(() => _isScanning = false);
        },
        onError: (error) async {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('NFC Error: $error')),
          );
          NfcManager.instance.stopSession();
          setState(() => _isScanning = false);
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('NFC Error: $e')),
      );
      setState(() => _isScanning = false);
    }
  }

  @override
  void dispose() {
    NfcManager.instance.stopSession();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Verify Student',
          style: TextStyle(
            color: Color(0xFF5B43E9),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 32),
          Center(
            child: Image.asset(
              'assets/person_with_card.png',
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: 260,
            height: 48,
            child: ElevatedButton(
              onPressed: _isScanning ? null : _startNfcScan,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
              child: Text(
                _isScanning ? 'Scanning...' : 'Tap NFC Card',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Place your card near the device',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
