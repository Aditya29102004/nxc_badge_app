import 'package:flutter/material.dart';
import 'teacher17.dart';

class Teacher16Page extends StatelessWidget {
  const Teacher16Page({Key? key}) : super(key: key);

  void _navigateToTeacher17(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Teacher17Page()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 56,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 30),
          onPressed: () {
            _navigateToTeacher17(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          "Add Notes",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3A2BDD),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF3A2BDD), width: 2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  _buildInputField("Title", "Lecture 1"),
                  const SizedBox(height: 16),
                  _buildInputField("Description", "Key Points...", isMultiline: true),
                  const SizedBox(height: 16),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFF3A2BDD), width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.cloud_upload, size: 40, color: Color(0xFF3A2BDD)),
                        SizedBox(height: 8),
                        Text(
                          "Upload File\nPDF file only",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(48),
                ),
              ),
              onPressed: () {
                _navigateToTeacher17(context);
              },
              child: const Text(
                "Save Notes",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, String hint, {bool isMultiline = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 4),
        TextField(
          maxLines: isMultiline ? 4 : 1,
          decoration: InputDecoration(
            hintText: hint,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            filled: true,
            fillColor: const Color(0xFFC6C4FF),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            hintStyle: const TextStyle(color: Colors.black54),
          ),
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
