import 'package:flutter/material.dart';

class Admin26Page extends StatelessWidget {
  const Admin26Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Record',
          style: TextStyle(
            color: Color(0xFF3A2BDD),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Overall Attendance
            Center(
              child: Container(
                width: 160,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF3A2BDD)),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Overall Attendance",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: CircularProgressIndicator(
                            value: 0.88,
                            color: Colors.green,
                            backgroundColor: Colors.grey.shade300,
                            strokeWidth: 8,
                          ),
                        ),
                        const Text(
                          "88%",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text("Good", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
            const Text(
              "Course Attendance",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 16),

            // Course Cards
            courseCard("Introduction to Computer Science", "CSE101", "84%"),
            courseCard("Introduction to Computer Science", "MAT201", "76%"),
            courseCard("Introduction to Computer Science", "PHY101", null),
            courseCard("Introduction to Computer Science", "ENG101", null),
          ],
        ),
      ),
    );
  }

  Widget courseCard(String title, String code, String? percent) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF3A2BDD)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(code, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          percent != null
              ? Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: Text(
                  percent,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              )
              : const CircleAvatar(radius: 16, backgroundColor: Colors.black),
        ],
      ),
    );
  }
}
