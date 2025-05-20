import 'package:flutter/material.dart';
import 'admin10.dart'; // Replace with correct path if needed

class Admin11Page extends StatelessWidget {
  const Admin11Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color.fromARGB(255, 0, 0, 0),
            size: 30,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Admin10Page()),
            );
          },
        ),
        title: const Text(
          'Scan QR',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3A2BDD),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Center(
              child: Text(
                'Scan the QR using any UPI app',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: Container(
                height: 200,
                width: 200,
                color: Colors.grey[300],
                child: const Icon(Icons.qr_code, size: 120),
              ),
            ),
            const SizedBox(height: 24),
            const Center(
              child: Text(
                'QR code will expire in 5:00 min',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
