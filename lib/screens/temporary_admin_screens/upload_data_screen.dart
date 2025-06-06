import 'package:flutter/material.dart';

class UploadDataScreen extends StatelessWidget {
  const UploadDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Upload Data',
          style: TextStyle(
            color: Color(0xFF5B43E9),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 32),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Upload Data',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: Container(
              width: 300,
              padding: const EdgeInsets.symmetric(vertical: 32),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF5B43E9), width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.cloud_upload, size: 64, color: Colors.black),
                  const SizedBox(height: 12),
                  const Text(
                    'Choose CSV file to upload',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 180,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Implement file picker
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Choose File',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: SizedBox(
              width: 260,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement upload logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                child: const Text(
                  'UPLOAD',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
