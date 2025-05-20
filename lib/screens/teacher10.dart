import 'package:flutter/material.dart';
import 'teacher3.dart';
import 'teacher11.dart';
import 'teacher14.dart';
import 'teacher17.dart';
import 'teacher18.dart';
import 'teacher19.dart';
import 'teacher23.dart';
import 'NavigationScreens/record.dart';

class Teacher10Page extends StatelessWidget {
  const Teacher10Page({Key? key}) : super(key: key);

  void _navigateTo(BuildContext context, String label) {
    switch (label) {
      case "Profile":
        Navigator.push(context, MaterialPageRoute(builder: (_) => const Teacher11Page()));
        break;
      case "Portfolio":
        Navigator.push(context, MaterialPageRoute(builder: (_) => const Teacher14Page()));
        break;
      case "Community":
        Navigator.push(context, MaterialPageRoute(builder: (_) => const Teacher18Page()));
        break;
      case "Event":
        Navigator.push(context, MaterialPageRoute(builder: (_) => const Teacher23Page()));
        break;
      case "Time table":
        Navigator.push(context, MaterialPageRoute(builder: (_) => const Teacher19Page()));
        break;
      case "Notes":
        Navigator.push(context, MaterialPageRoute(builder: (_) => const Teacher17Page()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Custom AppBar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, size: 30, color: Colors.black,),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Text(
                      "Tools",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3A2BDD),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // Reserve space to balance back icon
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Tool Grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.0,
                  children: [
                    _buildToolButton(context, Icons.person, "Profile"),
                    _buildToolButton(context, Icons.work, "Portfolio"),
                    _buildToolButton(context, Icons.people, "Community"),
                    _buildToolButton(context, Icons.event, "Event"),
                    _buildToolButton(context, Icons.calendar_today, "Time table"),
                    _buildToolButton(context, Icons.note_add, "Notes"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFF3F3F3),
        selectedItemColor: const Color(0xFF3A2BDD),
        unselectedItemColor: Colors.black,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(context, MaterialPageRoute(builder: (_) => const Teacher3Page()));
              break;
            case 1:
              Navigator.push(context, MaterialPageRoute(builder: (_) => const RecordPage()));
              break;
            case 2:
              Navigator.push(context, MaterialPageRoute(builder: (_) => const Teacher23Page()));
              break;
            case 3:
              Navigator.push(context, MaterialPageRoute(builder: (_) => const Teacher11Page()));
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.record_voice_over), label: "Record"),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: "Event"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget _buildToolButton(BuildContext context, IconData iconData, String label) {
    return GestureDetector(
      onTap: () => _navigateTo(context, label),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(13), // 5% opacity
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(iconData, size: 32, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFC6C4FF),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
