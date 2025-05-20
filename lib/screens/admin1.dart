import 'package:flutter/material.dart';

import 'admin22.dart';
import 'admin23.dart';
import 'admin3.dart';
import 'admin4.dart';
import 'admin5.dart';
import 'admin6.dart';
import 'admin8.dart';
import 'admin15.dart';
import 'admin14.dart'; // for create
import 'admin26.dart'; // for record
import 'admin13.dart'; // for profile

class Admin1Page extends StatelessWidget {
  const Admin1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 56,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Admin Dashboard',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3A2BDD),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 32,
                  children: [
                    _buildDashboardItem(
                      context,
                      'assets/admin_tools.png',
                      'Admin Tools',
                      const Admin22Page(),
                    ),
                    _buildDashboardItem(
                      context,
                      'assets/attendance.png',
                      'Attendance',
                      const Admin23Page(),
                    ),
                    _buildDashboardItem(
                      context,
                      'assets/features.png',
                      'Features',
                      const Admin3Page(),
                    ),
                    _buildDashboardItem(
                      context,
                      'assets/events.png',
                      'Events',
                      const Admin4Page(),
                    ),
                    _buildDashboardItem(
                      context,
                      'assets/community.png',
                      'Community',
                      const Admin5Page(),
                    ),
                    _buildDashboardItem(
                      context,
                      'assets/news.png',
                      'News',
                      const Admin6Page(),
                    ),
                    _buildDashboardItem(
                      context,
                      'assets/issuance.png',
                      'Issuance',
                      const Admin15Page(),
                    ),
                    _buildDashboardItem(
                      context,
                      'assets/analytics.png',
                      'Analytics',
                      const Admin8Page(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Add logout functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(48),
                  ),
                ),
                child: const Text(
                  'LOGOUT',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildBottomNavBar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardItem(
    BuildContext context,
    String assetPath,
    String label,
    Widget targetScreen,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => targetScreen),
        );
      },
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: Center(child: Image.asset(assetPath, fit: BoxFit.contain)),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 36,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFFC6C4FF),
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: FittedBox(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavIcon(
            context,
            Icons.add_circle_outline,
            Colors.black,
            const Admin14Page(), // Create → Admin14
          ),
          _buildNavIcon(
            context,
            Icons.home,
            Colors.black,
            const Admin1Page(), // Home
          ),
          _buildNavIcon(
            context,
            Icons.fiber_manual_record,
            const Color(0xFF3A2BDD),
            const Admin26Page(), // Record
          ),
          _buildNavIcon(
            context,
            Icons.group,
            Colors.black,
            const Admin5Page(), // Community
          ),
          _buildNavIcon(
            context,
            Icons.person,
            Colors.black,
            const Admin13Page(), // Profile
          ),
        ],
      ),
    );
  }

  Widget _buildNavIcon(
    BuildContext context,
    IconData icon,
    Color color,
    Widget destination,
  ) {
    return IconButton(
      icon: Icon(icon, size: 28, color: color),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => destination));
      },
    );
  }
}
