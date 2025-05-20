import 'package:flutter/material.dart';
import 'admin1.dart'; // ✅ Adjust the import paths as needed
import 'admin2.dart';

class Admin23Page extends StatelessWidget {
  const Admin23Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Back Arrow
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Admin1Page(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Center Heading
              const Center(
                child: Text(
                  'Verify Student',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3A2BDD),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Content Centered
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    // Info Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF3A2BDD)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name : Amit Sharma"),
                          SizedBox(height: 8),
                          Text("Student Id : StudentD_COLL01_001"),
                          SizedBox(height: 8),
                          Text("College ID: COLL01"),
                          SizedBox(height: 8),
                          Text("Roll Number : MATH_001"),
                          SizedBox(height: 8),
                          Text("Exam Title : Math Exam"),
                          SizedBox(height: 8),
                          Text("Room ID : ROOM_001Math"),
                          SizedBox(height: 8),
                          Text("Verify at : 2025-04-30 09:00:00"),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Mark Present Button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Admin2Page(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3A2BDD),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(48),
                          ),
                        ),
                        child: const Text(
                          "Mark present",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Cancel Button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Admin1Page(),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF3A2BDD)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(48),
                          ),
                        ),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF3A2BDD),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
