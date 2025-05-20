import 'package:flutter/material.dart';
import 'teacher3.dart';
import 'teacher11.dart';
import 'NavigationScreens/record.dart';

class Teacher23Page extends StatefulWidget {
  const Teacher23Page({Key? key}) : super(key: key);

  @override
  State<Teacher23Page> createState() => _Teacher23PageState();
}

class _Teacher23PageState extends State<Teacher23Page> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;

    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const Teacher3Page()));
        break;
      case 1:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const RecordPage()));
        break;
      case 2:
        // Already on Event page
        break;
      case 3:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const Teacher11Page()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 56,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              size: 30, color: Color.fromARGB(255, 0, 0, 0)),
          onPressed: () {
            Navigator.pop(context);
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
            _buildEventCard("Event1", "Event 1", "2025-05-10", "Auditorium"),
            const SizedBox(height: 20),
            _buildEventCard("Event2", "Event 2", "2025-05-12", "Hall 3"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFF3F3F3),
        selectedItemColor: const Color(0xFF3A2BDD),
        unselectedItemColor: Colors.black,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long), label: "Record"),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: "Event"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget _buildEventCard(
      String eventId, String name, String date, String place) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF3A2BDD), width: 2),
        borderRadius: BorderRadius.circular(16),
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
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3A2BDD),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(48),
                ),
              ),
              onPressed: () {
                // Handle register
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
                // Handle more details
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
