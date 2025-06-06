import 'package:flutter/material.dart';

class TemporaryExamRoomScreen extends StatelessWidget {
  const TemporaryExamRoomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Icon(Icons.person, color: Colors.black, size: 32),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black, size: 28),
            onPressed: () {
              // TODO: Add logout logic
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Click here to create\na temporary exam room',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Image.network(
                'https://undraw.co/api/illustrations/undraw_teaching_f1cm.svg',
                height: 160,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.image, size: 100, color: Colors.grey[300]),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: OutlinedButton(
                onPressed: () {
                  // TODO: Navigate to exam room creation
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF5B43E9), width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Center(
                  child: Text(
                    'Exam Room',
                    style: TextStyle(
                      color: Color(0xFF5B43E9),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: Image.network(
                'https://undraw.co/api/illustrations/undraw_tasks_re_v2v4.svg',
                height: 120,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.image, size: 80, color: Colors.grey[300]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
