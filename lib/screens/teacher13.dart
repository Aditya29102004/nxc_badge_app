import 'package:flutter/material.dart';
import 'teacher11.dart'; // Import the destination page

class Teacher13Page extends StatelessWidget {
  const Teacher13Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 56,  // ensure height
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 30),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Teacher11Page()),
            );
          },
        ),
        centerTitle: true,
        title: const Text(
          "Scan QR",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3A2BDD),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(  // Center everything horizontally and vertically
          child: Column(
            mainAxisSize: MainAxisSize.min, // to center tightly
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  fixedSize: const Size(221, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(48),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "SCAN QR",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Image.asset(
                'assets/qr_code.png',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              const Text(
                "QR code will expire in 5:00 min",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
