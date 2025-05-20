import 'package:flutter/material.dart';

class Admin3Page extends StatelessWidget {
  const Admin3Page({super.key});

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
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Feature Control',
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
            _buildFeatureButton('Hall Tickets'),
            const SizedBox(height: 20),
            _buildFeatureButton('Results Portal'),
            const SizedBox(height: 20),
            _buildFeatureButton('Attendance Tracking'),
            const SizedBox(height: 20),
            _buildFeatureButton('Course Registration'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFF3F3F3),
        selectedItemColor: const Color(0xFF3A2BDD),
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.radio_button_checked),
            label: 'Record',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: 'Community'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 1, // Highlight the 'Record' section as active
        onTap: (index) {
          // Navigation logic here if needed
        },
      ),
    );
  }

  Widget _buildFeatureButton(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xFF3A2BDD),
          borderRadius: BorderRadius.circular(48),
        ),
        child: Row(
          children: [
            const SizedBox(width: 16),
            const Icon(Icons.radio_button_unchecked, color: Colors.white),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
