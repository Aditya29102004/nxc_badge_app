// lib/screens/community_page.dart
import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo,
        elevation: 0,
      ),
      body: const Center(
        child: Text(
          'Community Page Content',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}