import 'package:flutter/material.dart';
import 'teacher5.dart';  // screen5.dart
import 'teacher9.dart';  // screen9.dart

class Teacher4Page extends StatelessWidget {
  const Teacher4Page({Key? key}) : super(key: key);

  // Primary Button (Dark Blue bg, white text)
  Widget _primaryButton(BuildContext context, String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF3A2BDD), // Dark Blue
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white, // White text
        ),
      ),
    );
  }

  // Secondary Button (Light Purple bg, Dark Blue text)
  Widget _secondaryButton(BuildContext context, String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFC6C4FF), // Light Purple
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xFF3A2BDD), // Dark Blue text
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 56,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 30),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Attendance Mode',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3A2BDD),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 280,
                child: _primaryButton(context, 'Attendance', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Teacher5Page()),
                  );
                }),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 280,
                child: _secondaryButton(context, 'View Data', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Teacher9Page()),
                  );
                }),
              ),
              const SizedBox(height: 40),
              Image.asset(
                'assets/attendance_illustration.png',
                height: 180,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Connect your NFC Reader Before Proceeding',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF3A2BDD),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
