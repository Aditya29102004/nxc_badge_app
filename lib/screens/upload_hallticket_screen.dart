import 'package:flutter/material.dart';

class UploadHallticketScreen extends StatefulWidget {
  const UploadHallticketScreen({Key? key}) : super(key: key);

  @override
  State<UploadHallticketScreen> createState() => _UploadHallticketScreenState();
}

class _UploadHallticketScreenState extends State<UploadHallticketScreen> {
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _pdfController = TextEditingController();
  final List<Map<String, String>> _uploaded = [
    {'title': 'Hallticket 1', 'id': '123456'},
    {'title': 'Hallticket 1', 'id': '123456'},
    {'title': 'Hallticket 1', 'id': '123456'},
  ];

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
          'Upload Halltickets',
          style: TextStyle(
            color: Color(0xFF5B43E9),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            const Text(
              'Student ID',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            _OutlinedInput(
              controller: _studentIdController,
              hintText: 'Enter Student ID',
              icon: null,
              onIconTap: null,
            ),
            const SizedBox(height: 24),
            const Text(
              'Hallticket PDF',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            _OutlinedInput(
              controller: _pdfController,
              hintText: 'Upload PDF',
              icon: Icons.outbond,
              onIconTap: () {
                // TODO: Implement PDF picker
              },
            ),
            const SizedBox(height: 24),
            Center(
              child: SizedBox(
                width: 120,
                height: 44,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Implement upload logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Upload',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Uploaded Hallticket',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            ..._uploaded.map((item) =>
                _UploadedTile(title: item['title']!, id: item['id']!)),
          ],
        ),
      ),
    );
  }
}

class _OutlinedInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? icon;
  final VoidCallback? onIconTap;
  const _OutlinedInput(
      {required this.controller,
      required this.hintText,
      this.icon,
      this.onIconTap,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: const EdgeInsets.all(20),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Color(0xFF5B43E9), width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Color(0xFF5B43E9), width: 2),
            ),
          ),
        ),
        if (icon != null)
          Positioned(
            bottom: 12,
            right: 12,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: onIconTap,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Icon(icon, color: Color(0xFF5B43E9)),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _UploadedTile extends StatelessWidget {
  final String title;
  final String id;
  const _UploadedTile({required this.title, required this.id, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child:
                const Icon(Icons.picture_as_pdf, color: Colors.red, size: 32),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Text(
                'Student ID : $id',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
