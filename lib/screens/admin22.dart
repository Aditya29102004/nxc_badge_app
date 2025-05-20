import 'package:flutter/material.dart';
import 'admin1.dart'; // ✅ Make sure this path is correct
import 'admin21.dart';

class Admin22Page extends StatelessWidget {
  const Admin22Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back Arrow
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Admin1Page()),
                  );
                },
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),

            // Heading - Admin Tools
            const SizedBox(height: 20),
            const Center(
              child: Text(
                "Admin Tools",
                style: TextStyle(
                  color: Color(0xFF3A2BDD),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Subheading - Create admin ID
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Create admin ID",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Form Container
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF3A2BDD)),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    _buildTextField(
                      hintText: "Enter name",
                      bgColor: const Color(0xFF3A2BDD),
                      textColor: Colors.white,
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      hintText: "Enter class",
                      bgColor: const Color(0xFFC6C4FF),
                      textColor: Colors.black,
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      hintText: "dd/mm/yy",
                      bgColor: const Color(0xFF3A2BDD),
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Create ID Button
            Center(
              child: SizedBox(
                width: 200,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Admin21Page(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(48),
                    ),
                  ),
                  child: const Text(
                    "Create ID",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildTextField({
    required String hintText,
    required Color bgColor,
    required Color textColor,
  }) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: bgColor,
        hintText: hintText,
        hintStyle: TextStyle(color: textColor),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(color: textColor),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFFF3F3F3),
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        // TODO: Add navigation based on index
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Record'),
        BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Event'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
