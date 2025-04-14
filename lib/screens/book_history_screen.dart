import 'package:flutter/material.dart';

class BookHistoryScreen extends StatelessWidget {
  const BookHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample returned book history
    final List<Map<String, String>> returnedBooks = [
      {
        'title': 'Book A',
        'returnDate': '2025-04-01 14:30',
      },
      {
        'title': 'Book B',
        'returnDate': '2025-04-05 14:30',
      },
      {
        'title': 'Book C',
        'returnDate': '2025-04-05 14:30',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Library',
          style: TextStyle(
            color: Colors.indigo,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black54),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Returned books list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: returnedBooks.length,
              itemBuilder: (context, index) {
                final book = returnedBooks[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.indigo,
                        width: 1.5,
                      ),
                    ),
                    child: Text(
                      '${book['title']} - Returned ${book['returnDate']}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Library illustration
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Image.asset(
              'assets/library_illustration.png',
              height: 180,
            ),
          ),

          // Bottom navigation bar
          const BottomNavigationSection(),
        ],
      ),
    );
  }
}

class BottomNavigationSection extends StatelessWidget {
  const BottomNavigationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.shade300, width: 1.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(Icons.home, 'Home', false),
            _buildNavItem(Icons.videocam_outlined, 'Record', false),
            _buildNavItem(Icons.calendar_today, 'Event', true),
            _buildNavItem(Icons.person_outline, 'Profile', false),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isSelected ? Colors.black : Colors.grey,
          size: 24,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
