// attendance_page.dart
import 'package:flutter/material.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({Key? key}) : super(key: key);

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  final List<Map<String, dynamic>> _courses = [
    {
      'code': 'CSE101',
      'name': 'Introduction to Computer Science',
      'attendance': 85
    },
    {'code': 'MAT201', 'name': 'Advanced Mathematics', 'attendance': 92},
    {'code': 'PHY105', 'name': 'Physics Fundamentals', 'attendance': 78},
    {'code': 'ENG104', 'name': 'Technical Communication', 'attendance': 88},
    {'code': 'ECO202', 'name': 'Microeconomics', 'attendance': 95},
  ];

  @override
  Widget build(BuildContext context) {
    final overallAttendance = _courses.fold<double>(
          0.0,
          (sum, course) => sum + (course['attendance'] as int? ?? 0),
        ) /
        _courses.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Overall Attendance',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 120,
                          width: 120,
                          child: CircularProgressIndicator(
                            value: overallAttendance / 100,
                            strokeWidth: 12,
                            backgroundColor: Colors.grey.shade300,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              overallAttendance >= 75
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        ),
                        Text(
                          '${overallAttendance.toStringAsFixed(1)}%',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      overallAttendance >= 75
                          ? 'Good Standing'
                          : 'Attendance Below Requirement',
                      style: TextStyle(
                        color:
                            overallAttendance >= 75 ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
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
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _courses.length,
              itemBuilder: (context, index) {
                final course = _courses[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    title: Text(course['name']),
                    subtitle: Text(course['code']),
                    trailing: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(
                            value: course['attendance'] / 100,
                            backgroundColor: Colors.grey.shade200,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              course['attendance'] >= 75
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        ),
                        Text(
                          '${course['attendance']}%',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
