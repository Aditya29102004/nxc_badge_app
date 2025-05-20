import 'package:flutter/material.dart';
// Make sure the path is correct
import 'admin29.dart'; // Adjust path if needed

class Admin28Page extends StatelessWidget {
  const Admin28Page({Key? key}) : super(key: key);

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
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          'Support',
          style: TextStyle(
            color: Color(0xFF3A2BDD), // Dark Blue
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Frequently Asked Questions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            _buildFaqTile('How do I reset my password?', [
              'Step 1: Go to settings.',
              'Step 2: Tap on "Account".',
              'Step 3: Select "Reset Password".',
            ]),
            const SizedBox(height: 8),
            _buildFaqTile('How to update account details?', [
              'Step 1: Go to Profile.',
              'Step 2: Tap "Edit Profile".',
              'Step 3: Save your changes.',
            ]),
            const SizedBox(height: 8),
            _buildFaqTile('Where can I find my invoices?', [
              'Step 1: Go to "Billing".',
              'Step 2: Tap "Invoices".',
              'Step 3: Download your invoice.',
            ]),
            const SizedBox(height: 24),
            const Text(
              'Contact Support',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            _buildTextField('Name', 'Your name'),
            const SizedBox(height: 16),
            _buildTextField('Email', 'Your@email.com'),
            const SizedBox(height: 16),
            _buildDropdownField('Issue Type', 'Technical issue'),
            const SizedBox(height: 16),
            _buildTextField('Message', 'Describe your issue...', maxLines: 4),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Admin29Page(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(48),
                  ),
                ),
                child: const Text(
                  'Submit Request',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFaqTile(String question, List<String> steps) {
    return ExpansionTile(
      title: Text(
        question,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      iconColor: const Color(0xFF3A2BDD),
      collapsedIconColor: const Color(0xFF3A2BDD),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: steps
                .map(
                  (step) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      step,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, String hint, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(48),
          borderSide: const BorderSide(color: Color(0xFF3A2BDD), width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(48),
          borderSide: const BorderSide(color: Color(0xFF3A2BDD), width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(48),
          borderSide: const BorderSide(color: Color(0xFF3A2BDD), width: 2),
        ),
      ),
    );
  }

  Widget _buildDropdownField(String label, String defaultValue) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(48),
          borderSide: const BorderSide(color: Color(0xFF3A2BDD), width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(48),
          borderSide: const BorderSide(color: Color(0xFF3A2BDD), width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(48),
          borderSide: const BorderSide(color: Color(0xFF3A2BDD), width: 2),
        ),
      ),
      value: defaultValue,
      items: const [
        DropdownMenuItem(
          value: 'Technical issue',
          child: Text('Technical issue'),
        ),
        DropdownMenuItem(value: 'Billing issue', child: Text('Billing issue')),
        DropdownMenuItem(value: 'Other', child: Text('Other')),
      ],
      onChanged: (value) {},
    );
  }
}
