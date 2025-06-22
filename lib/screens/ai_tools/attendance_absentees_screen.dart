import 'package:flutter/material.dart';
import 'smart_analytics_screen.dart';

class AttendanceAbsenteesScreen extends StatelessWidget {
  const AttendanceAbsenteesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final students = [
      {
        'name': 'Ethan Harper',
        'id': '123456',
        'subject': 'Math',
        'absences': 5,
        'avatar': 'female',
      },
      {
        'name': 'Om Harper',
        'id': '123456',
        'subject': 'Science',
        'absences': 4,
        'avatar': 'male',
      },
      {
        'name': 'sanu Harper',
        'id': '123456',
        'subject': 'English',
        'absences': 5,
        'avatar': 'female',
      },
      {
        'name': 'Khush Harper',
        'id': '123456',
        'subject': 'History',
        'absences': 3,
        'avatar': 'male',
      },
      {
        'name': 'Ethan Harper',
        'id': '123456',
        'subject': 'Math',
        'absences': 5,
        'avatar': 'female',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Attendance',
          style: TextStyle(
            color: Color(0xFF5B43E9),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: Text(
              'Students with 3+ Absences',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          ...students.map((student) => _StudentAbsenceTile(
                student: student,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SmartAnalyticsScreen(),
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }
}

class _StudentAbsenceTile extends StatelessWidget {
  final Map<String, dynamic> student;
  final VoidCallback onTap;
  const _StudentAbsenceTile(
      {required this.student, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isFemale = student['avatar'] == 'female';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(32),
        onTap: onTap,
        child: Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: Colors.grey[200],
              child: Icon(
                isFemale ? Icons.account_circle : Icons.account_circle_outlined,
                size: 48,
                color: Colors.brown[300],
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student['name'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'ID : ${student['id']} | ${student['subject']}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '${student['absences']} Absences',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
