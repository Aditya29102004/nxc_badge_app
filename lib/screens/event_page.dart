// lib/screens/event_page.dart
import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo,
        elevation: 0,
      ),
      body: const Center(
        child: Text(
          'Event Page Content',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
