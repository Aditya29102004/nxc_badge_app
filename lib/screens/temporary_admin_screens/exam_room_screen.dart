import 'package:flutter/material.dart';

class ExamRoomScreen extends StatelessWidget {
  const ExamRoomScreen({Key? key}) : super(key: key);

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
          'Exam Room',
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
        children: [
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                _ExamRoomButton(
                  icon: Icons.meeting_room,
                  label: 'Create Room',
                  onTap: () {},
                ),
                const SizedBox(height: 24),
                _ExamRoomButton(
                  icon: Icons.upload_file,
                  label: 'Upload List',
                  onTap: () {},
                ),
                const SizedBox(height: 24),
                _ExamRoomButton(
                  icon: null,
                  label: 'Export Data',
                  onTap: () {},
                  isFilled: true,
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: SizedBox(
              width: 260,
              height: 48,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                child: const Text(
                  'Start Checking In',
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

class _ExamRoomButton extends StatelessWidget {
  final IconData? icon;
  final String label;
  final VoidCallback onTap;
  final bool isFilled;

  const _ExamRoomButton({
    Key? key,
    this.icon,
    required this.label,
    required this.onTap,
    this.isFilled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(28),
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: isFilled ? const Color(0xFF5B43E9) : Colors.transparent,
          borderRadius: BorderRadius.circular(28),
          border: isFilled
              ? null
              : Border.all(color: const Color(0xFF5B43E9), width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon,
                  color: isFilled ? Colors.white : Colors.black, size: 24),
              const SizedBox(width: 12),
            ],
            Text(
              label,
              style: TextStyle(
                color: isFilled ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(width: 12),
            Icon(Icons.arrow_forward_ios,
                color: isFilled ? Colors.white : Color(0xFF5B43E9), size: 20),
          ],
        ),
      ),
    );
  }
}
