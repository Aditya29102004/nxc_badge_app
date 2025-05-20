import 'package:flutter/material.dart';
import 'teacher3.dart';    
import 'NavigationScreens/record.dart'; // Corrected import path for Record
import 'teacher10.dart';  
import 'teacher23.dart';  
import 'teacher11.dart';  

class Teacher15Page extends StatefulWidget {
  const Teacher15Page({Key? key}) : super(key: key);

  @override
  State<Teacher15Page> createState() => _Teacher15PageState();
}

class _Teacher15PageState extends State<Teacher15Page> {
  int _selectedIndex = 3; // Profile tab selected

  void _onBottomNavTapped(int index) {
    if (index == _selectedIndex) return;

    setState(() {
      _selectedIndex = index;
    });

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
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Teacher11Page()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 56,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 30, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Teacher10Page(),
              ),
            );
          },
        ),
        centerTitle: true,
        title: const Text(
          "Add Project Fields",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3A2BDD),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,  // To center vertically nicely inside Center
          children: [
            _buildProjectFieldButton("LinkedIn", Icons.link, Colors.black),
            const SizedBox(height: 16),
            _buildProjectFieldButton("GitHub", Icons.code, Colors.black),
            const SizedBox(height: 40),
            Image.asset(
              'assets/project_illustration.png',
              height: 200,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFF3F3F3),
        selectedItemColor: const Color(0xFF3A2BDD),
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _onBottomNavTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.record_voice_over), label: "Record"),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: "Event"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget _buildProjectFieldButton(String title, IconData icon, Color iconColor) {
    return Container(
      width: 320,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFC6C4FF),
        borderRadius: BorderRadius.circular(48),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 8),
          Icon(icon, color: iconColor, size: 24),
        ],
      ),
    );
  }
}
