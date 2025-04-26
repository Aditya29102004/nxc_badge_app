import 'package:flutter/material.dart';

class NormalUserScreen extends StatelessWidget {
  static const String routeName = '/normal-user';

  const NormalUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Normal User Dashboard'),
      ),
      body: const Center(
        child: Text('Welcome to Normal User Dashboard'),
      ),
    );
  }
}
