import 'package:flutter/material.dart';
import 'teacher6.dart';

class Teacher24Page extends StatefulWidget {
  const Teacher24Page({Key? key}) : super(key: key);

  @override
  State<Teacher24Page> createState() => _Teacher24PageState();
}

class _Teacher24PageState extends State<Teacher24Page> {
  final Color primaryColor = const Color(0xFF3A2BDD);
  final Color secondaryColor = const Color(0xFFC6C4FF);

  int _selectedTabIndex = 0;
  final List<String> _tabs = ['Summary', 'Attendance', 'Library'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 56,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 30, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Teacher6Page()));
          },
        ),
        title: const Text(
          'Analytics',
          style: TextStyle(
            color: Color(0xFF3A2BDD),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Tab Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(_tabs.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTabIndex = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: _selectedTabIndex == index ? primaryColor : Colors.transparent,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: primaryColor),
                    ),
                    child: Text(
                      _tabs[index],
                      style: TextStyle(
                        color: _selectedTabIndex == index ? Colors.white : primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 24),

            // Tab content
            if (_selectedTabIndex == 0) ...[
              _buildAnalyticsCard('Total Students', '2,547', '+12% this month'),
              _buildAnalyticsCard('Attendance Rate', '94.2%', '+2.1% this week'),
              const SizedBox(height: 20),
              _buildGraph(),
              const SizedBox(height: 20),
              _buildActivityCard(),
            ] else if (_selectedTabIndex == 1) ...[
              _buildGraph(),
              const SizedBox(height: 20),
              _buildAnalyticsCard('Average Daily Attendance', '94.2%', '+1.8% from last week'),
              const SizedBox(height: 20),
              _buildActivityCard(),
            ] else if (_selectedTabIndex == 2) ...[
              _buildAnalyticsCard('Books Issued', '1,280', '+5.4% this month'),
              _buildAnalyticsCard('Late Returns', '34', '-3.0% this week'),
              const SizedBox(height: 20),
              _buildActivityCard(),
            ],
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildAnalyticsCard(String title, String value, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF3A2BDD)),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
          color: Colors.grey.withAlpha((0.08 * 255).toInt()),

            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(value, style: TextStyle(color: primaryColor, fontSize: 28, fontWeight: FontWeight.bold)),
          Text(subtitle, style: const TextStyle(fontSize: 14, color: Colors.green)),
        ],
      ),
    );
  }

  Widget _buildGraph() {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF3A2BDD)),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
          color: Colors.grey.withAlpha((0.08 * 255).toInt()),

            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Center(
        child: Text(
          'Monthly Overview Graph Placeholder',
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }

  Widget _buildActivityCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF3A2BDD)),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
          color: Colors.grey.withAlpha((0.08 * 255).toInt()),

            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: const [
          Text('Recent Activity', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 8),
          Text('Library Access Peak\n250 students accessed today', textAlign: TextAlign.center),
          SizedBox(height: 4),
          Text('Hall Tickets Generated\n180 tickets issued', textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
