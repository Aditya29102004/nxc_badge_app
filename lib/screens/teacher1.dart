import 'package:flutter/material.dart';
import 'teacher2.dart'; // Make sure this import is correct based on your file structure

class Teacher1Page extends StatelessWidget {
  const Teacher1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color.fromARGB(255, 0, 0, 0), size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          "Choose Your Card Type!",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3A2BDD),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                _buildCardTypeButton("Student", false),
                _buildCardTypeButton("Teacher", true),
                _buildCardTypeButton("Normal User", false),
                _buildCardTypeButton("Temporary Admin", false),
              ],
            ),
            const SizedBox(height: 40),
            _buildInputField("Teacher ID", Colors.grey[200]!),
            const SizedBox(height: 16),
            _buildInputField("Password", Colors.grey[200]!),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(48),
                ),
              ),
              onPressed: () {
                // Navigate to TempAdmin2Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Teacher2Page()),
                );
              },
              child: const Text(
                "LOGIN",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(height: 32),
            Image.asset(
              'assets/door_illustration.png',
              height: 150,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardTypeButton(String text, bool selected) {
    return GestureDetector(
      onTap: () {
        // Handle card type selection if needed
      },
      child: Container(
        width: 160,
        height: 50,
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF3A2BDD) : const Color(0xFFC6C4FF),
          borderRadius: BorderRadius.circular(48),
          boxShadow: [
            if (selected)
              const BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 4),
              ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: selected ? Colors.white : const Color(0xFF3A2BDD),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String hintText, Color bgColor) {
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(48),
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          hintStyle: const TextStyle(color: Colors.black54),
        ),
        style: const TextStyle(color: Colors.black),
        obscureText: hintText == "Password",
      ),
    );
  }
}
