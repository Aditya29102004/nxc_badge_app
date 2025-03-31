import 'package:flutter/material.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Portal'),
      ),
      body: const Center(
        child: Text('Student Content Goes Here'),
      ),
    );
  }
}
