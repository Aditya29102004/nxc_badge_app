import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Admin24Page extends StatelessWidget {
  const Admin24Page({super.key});

  static const Color primaryColor = Color(0xFF3A2BDD);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Card Editor',
          style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/person_with_card.png', // Replace with your actual asset
                  height: 200,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // NFC writing logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Tap NFC Card'),
            ),
            const SizedBox(height: 8),
            const Text(
              'Place your card near the device',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
