// lib/screens/portfolio_page.dart
import 'package:flutter/material.dart';
import 'add_project_fields_page.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PORTFOLIO',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Main content
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Illustration
                Image.asset(
                  'assets/portfolio_illustration.png',// Replace with your actual image path
                  height: 200,
                ),
                const SizedBox(height: 30),
                
                // NFC Button - now navigates to Add Project Fields page
                SizedBox(
                  width: 240,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddProjectFieldsPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      'Tap NFC Card',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                
                // Instruction text
                const Text(
                  'Place your card near the device',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          
          // Bottom Navigation
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavButton(Icons.home_outlined, 'Home', false, context),
                _buildNavButton(Icons.play_circle_outline, 'Record', false, context),
                _buildNavButton(Icons.calendar_today_outlined, 'Event', true, context),
                _buildNavButton(Icons.person_outline, 'Profile', false, context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton(
      IconData icon, String label, bool isActive, BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle navigation
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isActive ? Colors.black : Colors.grey,
            size: 24,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isActive ? Colors.black : Colors.grey,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (isActive)
            Container(
              height: 3,
              width: 30,
              margin: const EdgeInsets.only(top: 4),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
        ],
      ),
    );
  }
}