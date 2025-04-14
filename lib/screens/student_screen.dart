// student_screen.dart
import 'package:flutter/material.dart';
import 'attendance_page.dart';
import 'hall_ticket_page.dart';
import 'timetable_page.dart';
import 'library_page.dart';
import 'rewards_page.dart';
import 'lost_card_page.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.fromARGB(255, 255, 255, 255), // Dark navy background
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E1F),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Uni Tap',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: [
            _buildFeatureButton(
              context,
              'Attendance',
              Icons.calendar_today,
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AttendancePage()),
              ),
            ),
            _buildFeatureButton(
              context,
              'Hall Ticket',
              Icons.receipt_outlined,
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HallTicketPage()),
              ),
            ),
            _buildFeatureButton(
              context,
              'Time Table',
              Icons.schedule,
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TimetablePage()),
              ),
            ),
            _buildFeatureButton(
              context,
              'Library',
              Icons.menu_book,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const StudentCardScreen()),
              ),
            ),
            _buildFeatureButton(
              context,
              'Rewards',
              Icons.emoji_events_outlined,
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RewardsPage()),
              ),
            ),
            _buildFeatureButton(
              context,
              'Lost Card',
              Icons.credit_card,
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LostCardPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureButton(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: IconButton(
              icon: Icon(
                icon,
                size: 36,
                color: Colors.black,
              ),
              onPressed: onPressed,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFB2B2FC), // Light purple/lavender color
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.indigo,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
