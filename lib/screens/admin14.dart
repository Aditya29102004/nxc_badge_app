import 'package:flutter/material.dart';

// Import your pages here
import 'admin1.dart';
import 'admin4.dart';
import 'admin5.dart';
import 'admin13.dart';
import 'admin26.dart';

class Admin14Page extends StatelessWidget {
  const Admin14Page({super.key});

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
                        MaterialPageRoute(builder: (_) => const Admin4Page()),
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
                    'Event',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 40),
            buildEventCard('Event1'),
            const SizedBox(height: 32),
            buildEventCard('Event2'),
            const SizedBox(height: 32),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFF3F3F3),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        currentIndex: 0, // Set Home as active by default
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

  Widget buildEventCard(String title) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF3A2BDD)),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              const EventInfo(label: 'NAME OF EVENT:'),
              const EventInfo(label: 'DATE:'),
              const EventInfo(label: 'PLACE:'),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF3A2BDD),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(48),
              ),
            ),
            onPressed: () {
              // Handle register button action
            },
            child: const Text(
              'REGISTER',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'MORE DETAILS',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ],
    );
  }
}

class EventInfo extends StatelessWidget {
  final String label;

  const EventInfo({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF3A2BDD),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}
