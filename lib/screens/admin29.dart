import 'package:flutter/material.dart';

class Admin29Page extends StatelessWidget {
  const Admin29Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back to Support2Page
          },
        ),
        centerTitle: true,
        title: const Text(
          "Successful",
          style: TextStyle(
            color: Color(0xFF3A2BDD), // Dark Blue Title
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 180,
              child: Image.asset(
                'assets/success_illustration.png', // Replace with your image path
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
