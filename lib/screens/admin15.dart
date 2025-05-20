import 'package:flutter/material.dart';
import 'admin1.dart';
import 'admin5.dart';
import 'admin13.dart';
import 'admin26.dart';
import 'admin16.dart'; // Add this import
import 'admin19.dart'; // Add this import

class Admin15Page extends StatelessWidget {
  const Admin15Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // AppBar
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const Admin1Page()),
                      );
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Issuance',
                    style: TextStyle(
                      color: Color(0xFF3A2BDD),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ),
      ),

      // Body
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),

            // Bulk Issuance Button
            buildButton(
              label: 'Bulk Issuance',
              backgroundColor: const Color(0xFFC6C4FF),
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const Admin16Page()),
                );
              },
            ),

            const SizedBox(height: 24),

            // Single Student Issuance Button
            buildButton(
              label: 'Single Student Issuance',
              backgroundColor: const Color(0xFF3A2BDD),
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const Admin19Page()),
                );
              },
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFF3F3F3),
        selectedItemColor: const Color(0xFF3A2BDD),
        unselectedItemColor: Colors.black,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.fiber_manual_record),
            label: 'Record',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Community'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const Admin1Page()),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const Admin26Page()),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const Admin5Page()),
              );
              break;
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const Admin13Page()),
              );
              break;
          }
        },
      ),
    );
  }

  Widget buildButton({
    required String label,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 280,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(48),
          ),
          elevation: 0,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
