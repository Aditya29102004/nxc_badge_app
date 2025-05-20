import 'package:flutter/material.dart';
import 'admin22.dart'; // Make sure this is the correct path

class Admin21Page extends StatelessWidget {
  const Admin21Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            // Back Arrow
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Admin22Page(),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Color.fromARGB(255, 0, 0, 0),
                    size: 30,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Heading
            const Center(
              child: Text(
                "Admin id created\nsuccessfull",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF3A2BDD),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Image
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/images/admin_success.png', // replace with your actual asset
                  height: 250,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
