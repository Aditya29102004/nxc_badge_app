import 'package:flutter/material.dart';
import 'teacher21.dart'; // Make sure to import Teacher21Page

class Teacher20Page extends StatelessWidget {
  const Teacher20Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 30, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          "Librarian Mode",
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
            _buildButton("Issue Book", const Color(0xFFC6C4FF), Colors.black, context),
            const SizedBox(height: 20),
            _buildButton("Return Book", const Color(0xFF3A2BDD), Colors.white, context),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, Color bgColor, Color textColor, BuildContext context) {
    return SizedBox(
      width: 250,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(48),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Teacher21Page()),
          );
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
