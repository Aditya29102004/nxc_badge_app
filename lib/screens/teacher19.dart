import 'package:flutter/material.dart';
import 'teacher10.dart';

class Teacher19Page extends StatelessWidget {
  const Teacher19Page({Key? key}) : super(key: key);

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
              MaterialPageRoute(builder: (_) => const Teacher10Page()),
            );
          },
        ),
        centerTitle: true,
        title: const Text(
          "My Timetable",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3A2BDD),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTimetableRow("MON", "MATHEMATICS", "9:00 AM - 10:00 AM"),
            const SizedBox(height: 16),
            _buildTimetableRow("TUE", "BIOLOGY", "10:00 AM - 11:00 AM"),
            const SizedBox(height: 16),
            _buildTimetableRow("WED", "HISTORY", "11:00 AM - 12:00 PM"),
            const SizedBox(height: 16),
            _buildTimetableRow("THU", "ECONOMICS", "1:00 PM - 2:00 PM"),
            const SizedBox(height: 16),
            _buildTimetableRow("FRI", "NO Classes", ""),
          ],
        ),
      ),
    );
  }

  Widget _buildTimetableRow(String day, String subject, String time) {
    return Row(
      children: [
        Container(
          width: 70,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFC6C4FF),
            borderRadius: BorderRadius.circular(48),
          ),
          alignment: Alignment.center,
          child: Text(
            day,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF3A2BDD), width: 2),
              borderRadius: BorderRadius.circular(48),
            ),
            child: Text(
              subject == "NO Classes" ? subject : "$subject\n$time",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                height: 1.3,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
