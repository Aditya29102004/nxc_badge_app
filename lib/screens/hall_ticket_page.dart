import 'package:flutter/material.dart';
import 'hall_ticket_detail_page.dart';

class HallTicketPage extends StatelessWidget {
  const HallTicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Hall Ticket',
          style: TextStyle(
            color: Colors.indigo,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Illustration showing the gray dots UI element at top
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 6,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  // Person holding card illustration - using exact illustration from image
                  Image.asset(
                    'assets/person_with_card.png',
                    height: 180,
                  ),
                  const SizedBox(height: 50),
                  // Button to tap student card
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HallTicketDetailPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'Tap Student Card',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Place your card near the device',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottom navigation bar
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.black12)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(Icons.home, 'Home'),
                _buildNavItem(Icons.circle_outlined, 'Record'),
                _buildNavItem(Icons.calendar_today, 'Event'),
                _buildNavItem(Icons.person_outline, 'Profile'),
              ],
            ),
          ),
          // Bottom home indicator line on iPhone
          Container(
            width: 135,
            height: 5,
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: label == 'Home' ? Colors.black : Colors.black54,
          size: 24,
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            color: label == 'Home' ? Colors.black : Colors.black54,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
