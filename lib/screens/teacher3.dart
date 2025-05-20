import 'package:flutter/material.dart';
import 'teacher1.dart';
import 'teacher4.dart';
import 'teacher10.dart';
import 'teacher11.dart';
import 'teacher7.dart';
import 'NavigationScreens/record.dart';
import 'teacher18.dart';

class Teacher3Page extends StatelessWidget {
  const Teacher3Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.person, color: Colors.black, size: 30),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Teacher11Page()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black, size: 30),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Teacher1Page()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildOptionButton(
              context,
              'Attendance mode',
              const Teacher4Page(),
            ),
            const SizedBox(height: 12),
            _buildOptionButton(
              context,
              'Tools',
              const Teacher10Page(),
            ),
            const SizedBox(height: 12),
            _buildOptionButton(
              context,
              'Librarian mode',
              const Teacher7Page(),
            ),
            const SizedBox(height: 30),
            Image.asset(
              'assets/illustration.png',
              height: 200,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFF3F3F3),
        selectedItemColor: const Color(0xFF3A2BDD), // Dark Blue for selected
        unselectedItemColor: Colors.black, // Black for unselected
        currentIndex: 0, // Home selected by default
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Teacher1Page()),
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
                MaterialPageRoute(builder: (context) => const Teacher18Page()),
              );
              break;
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Teacher11Page()),
              );
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Record'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Community'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildOptionButton(BuildContext context, String text, Widget targetPage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: 250,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14),
            side: const BorderSide(color: Color(0xFF3A2BDD)), // Consistent Dark Blue
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48), // Consistent rounded corners
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => targetPage),
            );
          },
          child: Text(
            text,
            style: const TextStyle(color: Color(0xFF3A2BDD), fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}