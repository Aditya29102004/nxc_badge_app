// lib/screens/vibe_screen.dart
import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'portfolio_page.dart';
import 'community_page.dart';
import 'event_page.dart';
import 'digi_locker_page.dart';
import 'my_docs_page.dart';

class VibeScreen extends StatelessWidget {
  const VibeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Vibe Pass',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Main content area with grid of buttons
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  _buildGridItem(
                    context,
                    icon: Icons.person_outline,
                    label: 'Profile',
                    destinationPage: const ProfilePage(),
                  ),
                  _buildGridItem(
                    context,
                    icon: Icons.work_outline,
                    label: 'Portfolio',
                    destinationPage: const PortfolioPage(),
                  ),
                  _buildGridItem(
                    context,
                    icon: Icons.people_outline,
                    label: 'Community',
                    destinationPage: const CommunityPage(),
                  ),
                  _buildGridItem(
                    context,
                    icon: Icons.calendar_today_outlined,
                    label: 'Event',
                    destinationPage: const EventPage(),
                  ),
                  _buildGridItem(
                    context,
                    icon: Icons.folder_outlined,
                    label: 'Digi locker',
                    destinationPage: const DigiLockerPage(),
                  ),
                  _buildGridItem(
                    context,
                    icon: Icons.description_outlined,
                    label: 'My docs',
                    destinationPage: const MyDocsPage(),
                  ),
                ],
              ),
            ),
          ),
          
          // Bottom Navigation
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavButton(Icons.home_outlined, 'Home', false, context),
                _buildNavButton(Icons.play_circle_outline, 'Record', false, context),
                _buildNavButton(Icons.calendar_today_outlined, 'Event', false, context),
                _buildNavButton(Icons.person_outline, 'Profile', false, context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Widget destinationPage,
  }) {
    return Column(
      children: [
        // Icon container
        Expanded(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => destinationPage),
              );
            },
            child: Center(
              child: Icon(
                icon,
                size: 40,
                color: Colors.black54,
              ),
            ),
          ),
        ),
        // Button label
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.indigo,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavButton(
      IconData icon, String label, bool isActive, BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle navigation
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isActive ? Colors.black : Colors.grey,
            size: 24,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isActive ? Colors.black : Colors.grey,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}