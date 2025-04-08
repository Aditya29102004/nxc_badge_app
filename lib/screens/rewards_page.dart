import 'package:flutter/material.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rewards'),
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
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.stars,
                          color: Colors.amber.shade700,
                          size: 32,
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Your Points',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      '580',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildPointsBadge(
                          'This Week',
                          '+45',
                          Colors.green.shade100,
                          Colors.green,
                        ),
                        const SizedBox(width: 12),
                        _buildPointsBadge(
                          'Level',
                          'Silver',
                          Colors.grey.shade300,
                          Colors.grey.shade700,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Recent Achievements',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildAchievementCard(
              'Perfect Attendance',
              'Attended all classes for 2 weeks straight',
              '+ 50 points',
              Icons.calendar_today,
              Colors.blue,
            ),
            _buildAchievementCard(
              'Book Worm',
              'Borrowed 5 library books this semester',
              '+ 30 points',
              Icons.menu_book,
              Colors.orange,
            ),
            _buildAchievementCard(
              'Early Bird',
              'Submitted all assignments before deadlines',
              '+ 75 points',
              Icons.access_time_filled,
              Colors.green,
            ),
            const SizedBox(height: 24),
            const Text(
              'Redeem Rewards',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildRewardCard(
              'Cafeteria Voucher',
              '100 points',
              '10% off on your next meal',
              Icons.fastfood,
            ),
            _buildRewardCard(
              'Extra Library Time',
              '200 points',
              '+2 hours of library access after hours',
              Icons.access_time,
            ),
            _buildRewardCard(
              'Premium Study Room',
              '350 points',
              '1-day access to premium study rooms',
              Icons.meeting_room,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPointsBadge(String label, String value, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: textColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementCard(String title, String description, String points, IconData icon, Color iconColor) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconColor.withOpacity(0.2),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(title),
        subtitle: Text(description),
        trailing: Text(
          points,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ),
    );
  }

  Widget _buildRewardCard(String title, String points, String description, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.indigo.shade100,
              radius: 24,
              child: Icon(icon, color: Colors.indigo),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(description),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
              ),
              child: Text(points),
            ),
          ],
        ),
      ),
    );
  }
}