import 'package:flutter/material.dart';
import '../NavigationScreens/record.dart';
import '../NavigationScreens/community.dart';
import '../NavigationScreens/profile1.dart';

class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);

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
            Navigator.pop(context); // Navigates to the previous screen
          },
        ),
        centerTitle: true,
        title: const Text(
          "Event",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3A2BDD),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            _buildEventCard(context, "Event1", "Event 1", "2025-05-10", "Auditorium"),
            const SizedBox(height: 20),
            _buildEventCard(context, "Event2", "Event 2", "2025-05-12", "Hall 3"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFF3F3F3),
        selectedItemColor: const Color(0xFF3A2BDD),
        unselectedItemColor: Colors.black,
        currentIndex: 0, // Event button selected
        onTap: (index) {
          switch (index) {
            case 0:
              // Event - already here, no action
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
                MaterialPageRoute(builder: (context) => const CommunityPage()),
              );
              break;
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Profile1Page()),
              );
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.event), label: "Event"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Record"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Community"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget _buildEventCard(BuildContext context, String eventId, String name, String date, String place) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xFF3A2BDD), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            eventId,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3A2BDD),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "NAME OF EVENT: $name\nDATE: $date\nPLACE: $place",
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3A2BDD),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(48),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: () {
                // Add your registration logic here
              },
              child: const Text(
                "REGISTER",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: GestureDetector(
              onTap: () {
                // Add your more details logic here
              },
              child: const Text(
                "MORE DETAILS",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}