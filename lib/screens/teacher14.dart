import 'package:flutter/material.dart';
import 'teacher15.dart'; // Import Teacher15Page

class Teacher14Page extends StatelessWidget {
  const Teacher14Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top Back Arrow and Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16), // consistent horizontal padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,  // consistent icon style and size
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Portfolio',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3A2BDD),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40), // to balance layout, same width as back button
                ],
              ),
            ),
            const SizedBox(height: 40),  // consistent gap after AppBar area

            // Main Content (Centered)
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/person_with_card.png',
                      height: 200,
                      width: 200,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: 200,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(48),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const Teacher15Page()),
                          );
                        },
                        child: const Text(
                          'Tap Student Card',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Place your card near the device',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
