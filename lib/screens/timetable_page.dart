import 'package:flutter/material.dart';

class TimetablePage extends StatelessWidget {
  const TimetablePage({Key? key}) : super(key: key);

  final List<Map<String, String>> schedule = const [
    {
      'day': 'MON',
      'subject': 'MATHEMATICS',
      'time': '9:00 AM - 10:00 AM',
    },
    {
      'day': 'TUE',
      'subject': 'BIOLOGY',
      'time': '10:00 AM - 11:00 AM',
    },
    {
      'day': 'WED',
      'subject': 'HISTORY',
      'time': '11:00 AM - 12:00 PM',
    },
    {
      'day': 'THU',
      'subject': 'ECONOMICS',
      'time': '1:00 PM - 2:00 PM',
    },
    {
      'day': 'FRI',
      'subject': 'NO Classes',
      'time': '',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Timetable',
          style: TextStyle(
            color: Color(0xFF3A2ED4),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: schedule.map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  // Day Pill
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD7CDFF),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      item['day']!,
                      style: const TextStyle(
                        color: Color(0xFF3A2ED4),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Subject + Time Box
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF3A2ED4), width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        children: [
                          Text(
                            item['subject']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          if (item['time']!.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                item['time']!,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
