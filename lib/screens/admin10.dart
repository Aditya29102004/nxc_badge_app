import 'package:flutter/material.dart';
import 'admin1.dart'; // Replace with the correct import path
import 'admin11.dart'; // Replace with the correct import path

class Admin10Page extends StatelessWidget {
  const Admin10Page({super.key});

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
              MaterialPageRoute(builder: (context) => const Admin1Page()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Center(
              child: Text(
                'LOST CARD',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3A2BDD),
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildSecondaryButton('Report lost card'),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Color(0xFF3A2BDD), width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Please enter your details',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildInputLabel('Enter your ID number :'),
                  _buildTextField(),
                  const SizedBox(height: 12),
                  _buildInputLabel('Enter your  mobile NO:'),
                  _buildTextField(),
                  const SizedBox(height: 12),
                  _buildInputLabel('Enter OTP:'),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      4,
                      (index) => Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color: Color(0xFFC6C4FF),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Center(
                    child: Text(
                      'Pay 70/-  for new CARD',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            _buildPrimaryButton('Continue', () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Admin11Page()),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildInputLabel(String label) {
    return Text(
      label,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
    );
  }

  Widget _buildTextField() {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFC6C4FF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      ),
      style: const TextStyle(color: Colors.black, fontSize: 16),
    );
  }

  Widget _buildPrimaryButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      child: Text(text),
    );
  }

  Widget _buildSecondaryButton(String text) {
    return OutlinedButton(
      onPressed: () {
        // Handle lost card report
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: Color(0xFF3A2BDD),
        side: const BorderSide(color: Color(0xFF3A2BDD), width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      child: Text(text),
    );
  }
}
