import 'package:flutter/material.dart';
import '../NavigationScreens/community.dart';
import '../NavigationScreens/profile1.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({Key? key}) : super(key: key);

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
          'Record',
          style: TextStyle(
            color: Color(0xFF3A2BDD), // Dark Blue
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 150,
                height: 150,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF3A2BDD), width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 130,
                      height: 130,
                      child: CircularProgressIndicator(
                        value: 0.88,
                        strokeWidth: 8,
                        color: Colors.green,
                        backgroundColor: Colors.grey.shade300,
                      ),
                    ),
                    const Text(
                      "88%",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Course Attendance',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            _buildCourseAttendance('Introduction to Computer Science', 'CSE101', 0.88),
            const SizedBox(height: 12),
            _buildCourseAttendance('Mathematics', 'MAT201', 0.92),
            const SizedBox(height: 12),
            _buildCourseAttendance('Physics', 'PHY101', 0.70),
            const SizedBox(height: 12),
            _buildCourseAttendance('English', 'ENG101', 0.95),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFF3F3F3),
        selectedItemColor: const Color(0xFF3A2BDD), // Dark Blue for selected
        unselectedItemColor: Colors.black, // Black for unselected
        currentIndex: 1, // Record button selected by default
        onTap: (index) {
          switch (index) {
            /*case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const EventPage()),
              );
              break;*/
            case 1:
              // Record - already here, no action
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Record"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Community"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget _buildCourseAttendance(String courseName, String courseCode, double percentage) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF3A2BDD), width: 2),
        borderRadius: BorderRadius.circular(48),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                courseName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                courseCode,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: percentage,
                  strokeWidth: 6,
                  color: Colors.green,
                  backgroundColor: Colors.grey.shade300,
                ),
                Text(
                  "${(percentage * 100).toStringAsFixed(0)}%",
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}