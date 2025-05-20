import 'package:flutter/material.dart';

import 'teacher3.dart';
import 'teacher12.dart';
import 'teacher13.dart';
import 'teacher23.dart';
import 'SupportScreens/support1.dart';
import 'NavigationScreens/record.dart';

class Teacher11Page extends StatelessWidget {
  const Teacher11Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              color: Color.fromARGB(255, 0, 0, 0), size: 30),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Teacher3Page()),
            );
          },
        ),
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3A2BDD),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            Image.asset(
              'assets/profile_avatar.png', // Ensure this path is valid
              height: 200,
            ),
            const SizedBox(height: 32),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF3A2BDD), width: 2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "NAME:          Larry J. Brown",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3A2BDD),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "INSTAGRAM ID:  Brownlarry27",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3A2BDD),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "FACEBOOK ID:   Brownlarry27",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3A2BDD),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            _buildBlackButton(context, "Tap NFC Card", () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Teacher12Page()),
              );
            }),
            const SizedBox(height: 16),
            _buildBlackButton(context, "QR CODE", () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Teacher13Page()),
              );
            }),
            const SizedBox(height: 16),
            _buildBlackButton(context, "Support", () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Support1Page()),
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFF3F3F3),
        selectedItemColor: const Color(0xFF3A2BDD),
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        currentIndex: 3, // Profile selected
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Teacher3Page()),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const RecordPage()),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Teacher23Page()),
              );
              break;
            case 3:
              // Already on Profile
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Record"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Event"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget _buildBlackButton(
      BuildContext context, String text, VoidCallback onPressed) {
    return SizedBox(
      width: 221,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(48),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
