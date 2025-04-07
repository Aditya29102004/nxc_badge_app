import 'package:flutter/material.dart';
import 'package:firebase_auth_demo/services/firebase_auth_methods.dart';
import 'package:provider/provider.dart';
import 'student_screen.dart';
import 'vibe_screen.dart';
import 'animation.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthMethods>().user;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.black,
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.arrow_forward,
              color: Colors.black,
            ),
            onPressed: () {
              // Navigation action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),

          // Buttons section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              children: [
                // UniTap button
                _buildButton(
                  context,
                  title: 'UniTap',
                  destination: const StudentScreen(),
                  color: Colors.purple,
                ),

                const SizedBox(height: 15),

                // Vibe pass button
                _buildButton(
                  context,
                  title: 'Vibe pass',
                  destination: const VibeScreen(),
                  color: Colors.purple,
                ),
              ],
            ),
          ),

          const SizedBox(height: 50),

          // Illustration section
          Expanded(
            child: Center(
              child: Image.asset('assets/dashboard_illustration.png'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.grey.shade200, width: 1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(Icons.home, 'Home', isSelected: true),
            _buildNavItem(Icons.radio_button_checked, 'Record'),
            _buildNavItem(Icons.calendar_today, 'Event'),
            _buildNavItem(Icons.person, 'Profile'),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required String title,
    required Widget destination,
    required Color color,
  }) {
    return OutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => destination,
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
          ),
        );
      },
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        side: BorderSide(color: color, width: 1),
        padding: EdgeInsets.symmetric(vertical: 15),
        minimumSize: Size(double.infinity, 45),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, {bool isSelected = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isSelected ? Colors.black : Colors.grey,
          size: 24,
        ),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
