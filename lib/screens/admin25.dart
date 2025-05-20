import 'package:flutter/material.dart';

class Admin25Page extends StatelessWidget {
  const Admin25Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // AppBar
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Hall ticket',
                    style: TextStyle(
                      color: Color(0xFF3A2BDD),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ),
      ),

      // Body
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 40),

            // Ticket Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF3A2BDD)),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ticketDetailRow('SUB:', 'math'),
                  _ticketDetailRow('ROLL NO:', '101'),
                  _ticketDetailRow('CENTER:', 'Amravati'),
                  _ticketDetailRow('EXAM TIME:', '9:00AM'),
                  const SizedBox(height: 16),
                  Center(
                    child: Image.asset(
                      'assets/images/qrcode.png',
                      width: 120,
                      height: 120,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Export Data Button
            OutlinedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Exporting PDF...')),
                );
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF3A2BDD)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              icon: const Icon(Icons.picture_as_pdf, color: Color(0xFF3A2BDD)),
              label: const Text(
                'Export Data',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3A2BDD),
                  fontSize: 16,
                ),
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'PDF Will Be Exported Shortly',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),

            const SizedBox(height: 24),

            // Insert Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Insert action triggered')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(48),
                  ),
                ),
                child: const Text(
                  'Insert',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Utility function to build each detail row
  Widget _ticketDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$label ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            TextSpan(
              text: value,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
