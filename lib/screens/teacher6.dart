import 'package:flutter/material.dart';
import 'teacher24.dart';
import 'teacher22.dart';

class Teacher6Page extends StatelessWidget {
  const Teacher6Page({Key? key}) : super(key: key);

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
          onPressed: () {
            Navigator.pop(context);  // Just pop to previous page
          },
        ),
        centerTitle: true,
        title: const Text(
          'Attendance',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3A2BDD),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: ListView(
          children: [
            _buildAttendanceCard("John Smith", "IDEMP001", "9:00 AM", "5:00 PM"),
            const SizedBox(height: 16),
            _buildAttendanceCard("Sarah Johnson", "IDEMP002", "9:00 AM", "5:00 PM"),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(48),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Teacher24Page()),
                  );
                },
                child: const Text(
                  "ANALYTICS",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Teacher22Page()),
          );
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildAttendanceCard(String name, String id, String inTime, String outTime) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF3A2BDD), width: 2),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.05 * 255).toInt()),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: const Color(0xFFC6C4FF),
                child: const Icon(Icons.person, color: Colors.black),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    id,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.access_time, size: 18, color: Colors.black),
                  SizedBox(width: 4),
                  Text("IN", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              Text(inTime, style: const TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: const [
                  Icon(Icons.access_time, size: 18, color: Colors.black),
                  SizedBox(width: 4),
                  Text("OUT", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              Text(outTime, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
