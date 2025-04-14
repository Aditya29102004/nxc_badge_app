import 'package:flutter/material.dart';

class AttendanceDetailPage extends StatefulWidget {
  const AttendanceDetailPage({Key? key}) : super(key: key);

  @override
  State<AttendanceDetailPage> createState() => _AttendanceDetailPageState();
}

class _AttendanceDetailPageState extends State<AttendanceDetailPage> {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Attendance Details',
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Overall attendance card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'Overall Attendance',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: CircularProgressIndicator(
                          value: overallAttendance / 100,
                          strokeWidth: 12,
                          backgroundColor: Colors.grey.shade200,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            overallAttendance >= 75
                                ? Colors.deepPurple
                                : Colors.red,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            '${overallAttendance.toStringAsFixed(1)}%',
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            overallAttendance >= 75
                                ? 'Good Standing'
                                : 'Below Requirement',
                            style: TextStyle(
                              color: overallAttendance >= 75
                                  ? Colors.deepPurple
                                  : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Course Breakdown',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _courses.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final course = _courses[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  title: Text(
                    course['name'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(course['code']),
                  trailing: Container(
                    width: 60,
                    height: 60,
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircularProgressIndicator(
                          value: course['attendance'] / 100,
                          backgroundColor: Colors.grey.shade200,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            course['attendance'] >= 75
                                ? Colors.deepPurple
                                : Colors.red,
                          ),
                          strokeWidth: 6,
                        ),
                        Text(
                          '${course['attendance']}%',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
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
      // Use the same bottom navigation to maintain consistency
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.black12)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(Icons.home_outlined, 'Home'),
            _buildNavItem(Icons.radio_button_checked, 'Record',
                isSelected: true),
            _buildNavItem(Icons.calendar_today_outlined, 'Event'),
            _buildNavItem(Icons.person_outline, 'Profile'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, {bool isSelected = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isSelected ? Colors.black : Colors.black54,
          size: 24,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.black54,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
