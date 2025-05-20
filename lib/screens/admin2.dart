import 'package:flutter/material.dart';
import 'admin1.dart'; // Make sure this import is correct

class Admin2Page extends StatelessWidget {
  const Admin2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 56,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Admin1Page()),
            );
          },
        ),
        centerTitle: true,
        title: const Text(
          'Attendance',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3A2BDD),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Center(
              child: Column(
                children: [
                  const Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildAttendanceCard("25-03-2025 - Marked at 9:00 AM"),
                  const SizedBox(height: 16),
                  _buildAttendanceCard("25-03-2025 - Marked at 9:00 AM"),
                  const SizedBox(height: 40),
                  Image.asset(
                    'assets/attendance_chart.png', // replace with actual asset
                    width: 250,
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttendanceCard(String label) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF3A2BDD), width: 2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
