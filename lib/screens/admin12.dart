import 'package:flutter/material.dart';

class Admin12Page extends StatelessWidget {
  const Admin12Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Replace with your actual image asset or network image
            Center(
              child: Image.asset(
                'assets/images/coming_soon.png', // replace with correct path
                height: 250,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Coming Soon',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3A2BDD),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
