// In screens/teacher_screen.dart
import 'package:flutter/material.dart';

class TeacherScreen extends StatelessWidget {
  static const String routeName = '/teacher';

  const TeacherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Dashboard'),
      ),
      body: const Center(
        child: Text('Welcome to Teacher Dashboard',
            style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
