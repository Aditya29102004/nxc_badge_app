import 'package:flutter/material.dart';

import 'admin1.dart';
import 'admin14.dart';
import 'admin26.dart';
import 'admin5.dart';
import 'admin13.dart';

class Admin4Page extends StatelessWidget {
  const Admin4Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const Admin1Page()),
            );
          },
        ),
        centerTitle: true,
        title: const Text(
          'Events',
          style: TextStyle(
            color: Color(0xFF3A2BDD),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBar: const _BottomNavBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Center(
                child: Text(
                  'Add New Event',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              _buildTextField(
                hint: 'Enter event title',
                bgColor: const Color(0xFFC6C4FF),
              ),
              const SizedBox(height: 20),
              _buildTextField(
                hint: 'dd/mm/yy',
                bgColor: const Color(0xFF3A2BDD),
                icon: Icons.calendar_today,
                textColor: Colors.white,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                hint: 'Enter event time',
                bgColor: const Color(0xFFC6C4FF),
                icon: Icons.access_time,
              ),
              const SizedBox(height: 40),
              _buildPrimaryButton(
                label: 'Create',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const Admin14Page()),
                  );
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    required Color bgColor,
    IconData? icon,
    Color textColor = Colors.black,
  }) {
    return TextField(
      style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        filled: true,
        fillColor: bgColor,
        hintText: hint,
        hintStyle: TextStyle(color: textColor.withOpacity(0.7)),
        prefixIcon: icon != null ? Icon(icon, color: textColor) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
      ),
    );
  }

  Widget _buildPrimaryButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(48),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

// Updated Bottom Navigation Bar with navigation logic
class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFFF3F3F3),
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      currentIndex: 1,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Admin1Page()),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Admin26Page()),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Admin5Page()),
            );
            break;
          case 3:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Admin13Page()),
            );
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.radio_button_checked),
          label: 'Record',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Community'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
