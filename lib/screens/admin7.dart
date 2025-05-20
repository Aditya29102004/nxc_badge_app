import 'package:flutter/material.dart';
import 'admin6.dart'; // Make sure this import points to Admin6Page

class Admin7Page extends StatelessWidget {
  const Admin7Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const Admin6Page()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        reverse: true,
        child: Column(
          children: [
            const SizedBox(height: 40),
            _buildCommentBox(),
            const SizedBox(height: 24),
            _buildAddCommentButton(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildCommentBox() {
    return TextField(
      maxLines: 6,
      decoration: InputDecoration(
        hintText:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed eiusmod tempor incididunt ut labore et dolore magna aliqua.....',
        hintStyle: const TextStyle(color: Colors.black54),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFF3A2BDD), width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFF3A2BDD), width: 2),
        ),
      ),
    );
  }

  Widget _buildAddCommentButton() {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          // Add your submit logic here
        },
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFF3A2BDD), width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        child: const Text(
          'Add a comment',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3A2BDD),
          ),
        ),
      ),
    );
  }
}
