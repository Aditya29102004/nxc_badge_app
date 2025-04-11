import 'package:flutter/material.dart';

class HallTicketDetailPage extends StatelessWidget {
  const HallTicketDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Hall ticket',
          style: TextStyle(
            color: Colors.indigo,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Hall Ticket Card with purple border
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.indigo, width: 2),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'SUB: math',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'ROLL NO: 101',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'CENTER: Amravati',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'EXAM TIME:9:00AM',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // QR Code - Centered and filling the space
                  Center(
                    child: Container(
                      width: 120,
                      height: 120,
                      color: Colors.white,
                      child: Image.asset(
                        'assets/qr_code.png',
                        width: 120,
                        height: 120,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Export Button with border
            Container(
              width: double.infinity,
              height: 48,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.indigo),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Export Data',
                    style: TextStyle(
                      color: Colors.indigo,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.indigo),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.description_outlined,
                      color: Colors.indigo,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'PDF Will Be Exported Shortly',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            const Spacer(),
            // Insert Button
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SizedBox(
                width: double.infinity,
                height: 46,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Insert',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            // Bottom home indicator line on iPhone
            Container(
              width: 135,
              height: 5,
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
