// hall_ticket_page.dart
import 'package:flutter/material.dart';

class HallTicketPage extends StatelessWidget {
  const HallTicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hall Ticket'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'EXAMINATION HALL TICKET',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Divider(thickness: 1),
                    const SizedBox(height: 12),
                    _buildInfoRow('Name', 'John Smith'),
                    _buildInfoRow('Roll Number', 'CS2023125'),
                    _buildInfoRow('Program', 'B.Tech Computer Science'),
                    _buildInfoRow('Semester', 'Spring 2025'),
                    const SizedBox(height: 24),
                    const Text(
                      'Examination Schedule',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildExamCard('CSE101', 'Introduction to Computer Science',
                        'April 15, 2025', '9:00 AM - 12:00 PM', 'Room: LH-101'),
                    _buildExamCard('MAT201', 'Advanced Mathematics',
                        'April 18, 2025', '2:00 PM - 5:00 PM', 'Room: LH-205'),
                    _buildExamCard('PHY105', 'Physics Fundamentals',
                        'April 21, 2025', '9:00 AM - 12:00 PM', 'Room: PH-301'),
                    const SizedBox(height: 24),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.download),
                        label: const Text('Download PDF'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  Widget _buildExamCard(
      String code, String subject, String date, String time, String venue) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: Colors.grey.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$code: $subject',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16),
                const SizedBox(width: 8),
                Text(date),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.access_time, size: 16),
                const SizedBox(width: 8),
                Text(time),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16),
                const SizedBox(width: 8),
                Text(venue),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
