import 'package:flutter/material.dart';
import 'admin1.dart'; // Make sure the path is correct

class Admin8Page extends StatelessWidget {
  const Admin8Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const Admin1Page()),
            );
          },
        ),
        centerTitle: true,
        title: const Text(
          'Analytics',
          style: TextStyle(
            color: Color(0xFF3A2BDD),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Tab Row
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFC6C4FF),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: Row(
                children: [
                  _buildTab('Summary'),
                  _buildTab('Attendance'),
                  _buildTab('Library'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Stats Boxes
            Row(
              children: [
                Expanded(
                  child: _buildStatBox(
                    'Total Students',
                    '2,547',
                    '+12% this month',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildStatBox(
                    'Attendance Rate',
                    '94.2%',
                    '+2.1% this week',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Monthly Overview
            _buildCard(
              title: 'Monthly Overview',
              height: 150,
              child: Center(
                child: Image.asset('assets/bar_graph.png', height: 100),
              ),
            ),
            const SizedBox(height: 20),

            // Recent Activity
            _buildCard(
              title: 'Recent Activity',
              child: Column(
                children: [
                  _buildActivityItem(
                    'Library Access Peak',
                    '250 students accessed today',
                  ),
                  const SizedBox(height: 10),
                  _buildActivityItem(
                    'Hall Tickets Generated',
                    '180 tickets issued',
                  ),
                ],
              ),
            ),

            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(48),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'DOWNLOAD',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String title) {
    return Expanded(
      child: Container(
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatBox(String title, String value, String subtext) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF3A2BDD)),
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xFF3A2BDD),
            ),
          ),
          Text(subtext, style: const TextStyle(color: Colors.green)),
        ],
      ),
    );
  }

  Widget _buildCard({
    required String title,
    double? height,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      height: height,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF3A2BDD)),
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget _buildActivityItem(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF3A2BDD)),
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(subtitle, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
