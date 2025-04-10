// lib/screens/add_project_fields_page.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddProjectFieldsPage extends StatelessWidget {
  const AddProjectFieldsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add project fields',
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // LinkedIn button
                  _buildSocialButton(
                    context,
                    'LinkedIn',
                    FaIcon(FontAwesomeIcons.linkedin, color: Colors.white),
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 16),

                  // GitHub button
                  _buildSocialButton(
                    context,
                    'GitHub',
                    Icon(Icons.code, color: Colors.white),
                    color: Colors.black,
                  ),

                  const SizedBox(height: 40),

                  // Illustration
                  Image.asset(
                    'assets/project_illustration.png', // Make sure this asset exists and is added in pubspec.yaml
                    height: 200,
                  ),
                ],
              ),
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
                _buildNavButton(
                    Icons.play_circle_outline, 'Record', false, context),
                _buildNavButton(
                    Icons.calendar_today_outlined, 'Event', true, context),
                _buildNavButton(
                    Icons.person_outline, 'Profile', false, context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(
    BuildContext context,
    String label,
    Widget icon, {
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Center(child: icon),
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
