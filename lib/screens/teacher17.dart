import 'package:flutter/material.dart';
import 'teacher10.dart';
import 'teacher16.dart';
import 'NavigationScreens/record.dart';
import 'teacher3.dart';
import 'teacher23.dart';
import 'teacher11.dart';

class Teacher17Page extends StatelessWidget {
  const Teacher17Page({Key? key}) : super(key: key);

  void _navigateBack(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Teacher10Page()),
    );
  }

  void _navigateToAddNotes(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Teacher16Page()),
    );
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
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 30),
          onPressed: () => _navigateBack(context),
        ),
        centerTitle: true,
        title: const Text(
          "Notes",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3A2BDD),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                _buildNoteItem("Lecture 1", "2025-04-08"),
                const SizedBox(height: 12),
                _buildNoteItem("Lecture 2", "2025-04-09"),
                const SizedBox(height: 12),
                _buildNoteItem("Lecture 3", "2025-04-10"),
                const SizedBox(height: 32),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 90), // Add space above FAB
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(48),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "Downloading",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.close, color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddNotes(context),
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFF3F3F3),
        selectedItemColor: const Color(0xFF3A2BDD),
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.record_voice_over), label: "Record"),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: "Event"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => const Teacher3Page()));
              break;
            case 1:
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => const RecordPage()));
              break;
            case 2:
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => const Teacher23Page()));
              break;
            case 3:
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => const Teacher11Page()));
              break;
          }
        },
      ),
    );
  }

  Widget _buildNoteItem(String title, String date) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF3A2BDD), width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Title: $title",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                "Date: $date",
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.download_rounded, color: Color(0xFF3A2BDD)),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
