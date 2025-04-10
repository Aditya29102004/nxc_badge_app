// lib/screens/digi_locker_page.dart
import 'package:flutter/material.dart';

class DigiLockerPage extends StatelessWidget {
  const DigiLockerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digi Locker'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo,
        elevation: 0,
      ),
      body: const Center(
        child: Text(
          'Digi Locker Page Content',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
