import 'package:flutter/material.dart';
import '../SupportScreens/support1.dart';
import '../NavigationScreens/profile2.dart';
import '../NavigationScreens/profile3.dart';
import '../NavigationScreens/record.dart';
import '../NavigationScreens/community.dart';
import '../NavigationScreens/event.dart';

class Profile1Page extends StatelessWidget {
  const Profile1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color.fromARGB(255, 0, 0, 0), size: 30),
          onPressed: () {
            Navigator.pop(context);
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
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              Image.asset('assets/profile_avatar.png', height: 200),
              const SizedBox(height: 32),
              _buildProfileInfo(),
              const SizedBox(height: 32),
              _buildBlackButton(context, "Tap NFC Card", () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Profile2Page()))),
              const SizedBox(height: 16),
              _buildBlackButton(context, "QR CODE", () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Profile3Page()))),
              const SizedBox(height: 16),
              _buildBlackButton(context, "Support", () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Support1Page()))),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildProfileInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF3A2BDD), width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("NAME:          Larry J. Brown", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF3A2BDD))),
          SizedBox(height: 12),
          Text("INSTAGRAM ID:  Brownlarry27", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF3A2BDD))),
          SizedBox(height: 12),
          Text("FACEBOOK ID:   Brownlarry27", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF3A2BDD))),
        ],
      ),
    );
  }

  Widget _buildBlackButton(BuildContext context, String text, VoidCallback onPressed) {
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

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFFF3F3F3),
      selectedItemColor: const Color(0xFF3A2BDD),
      unselectedItemColor: Colors.black,
      currentIndex: 3,
      onTap: (index) {
        switch (index) {
          case 0: Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const EventPage())); break;
          case 1: Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RecordPage())); break;
          case 2: Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CommunityPage())); break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.event), label: "Event"),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: "Record"),
        BottomNavigationBarItem(icon: Icon(Icons.group), label: "Community"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
