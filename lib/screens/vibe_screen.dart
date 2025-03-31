import 'package:flutter/material.dart';

class VibeScreen extends StatelessWidget {
  const VibeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vibe Portal'),
      ),
      body: const Center(
        child: Text('Vibe Content Goes Here'),
      ),
    );
  }
}
