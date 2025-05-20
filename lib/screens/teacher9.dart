import 'package:flutter/material.dart';
import 'teacher4.dart';

class Teacher9Page extends StatelessWidget {
  const Teacher9Page({Key? key}) : super(key: key);

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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Teacher4Page()),
            );
          },
        ),
        centerTitle: true,
        title: const Text(
          "View Data",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3A2BDD),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            const SizedBox(height: 24),
            _buildMainButton("Attendance"),
            const SizedBox(height: 16),
            _buildExportButton("Export Data"),
            const SizedBox(height: 32),
            _buildMainButton("Library"),
            const SizedBox(height: 16),
            _buildExportButton("Export Data"),
            const SizedBox(height: 32),
            Expanded(
              child: Image.asset(
                'assets/viewdata_illustration.png',
                height: 180,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainButton(String text) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFC6C4FF),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(48),
          ),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3A2BDD),
          ),
        ),
      ),
    );
  }

  Widget _buildExportButton(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF3A2BDD), width: 2),
        borderRadius: BorderRadius.circular(48),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Image.asset(
            'assets/pdf_icon.png',
            height: 24,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
