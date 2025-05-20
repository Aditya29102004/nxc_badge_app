import 'package:flutter/material.dart';
import 'teacher6.dart';

class Teacher22Page extends StatelessWidget {
  const Teacher22Page({Key? key}) : super(key: key);

  void _selectOption(BuildContext context, String title, List<String> options) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SizedBox(
          height: 250,
          child: Column(
            children: [
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3A2BDD),
                ),
              ),
              const Divider(),
              Expanded(
                child: ListView(
                  children: options.map((option) {
                    return ListTile(
                      title: Text(option),
                      onTap: () {
                        Navigator.pop(context);
                        // Handle selection if needed
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 56,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 30, color: Color.fromARGB(255, 0, 0, 0)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          "Attendance",
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
            _buildButton("Choose Class", const Color(0xFF3A2BDD), Colors.white, context, () {
              _selectOption(context, "Select Class", ["Class 6A", "Class 6B", "Class 7A"]);
            }),
            const SizedBox(height: 20),
            _buildButton("Choose Subject", const Color(0xFFC6C4FF), Colors.black, context, () {
              _selectOption(context, "Select Subject", ["Math", "English", "Science"]);
            }),
            const SizedBox(height: 20),
            _buildButton("Choose Date", const Color(0xFFC6C4FF), Colors.black, context, () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime(2100),
              );
              if (pickedDate != null) {
                // Optionally handle picked date
              }
            }),
            const SizedBox(height: 30),
            SizedBox(
              width: 250,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(48),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const Teacher6Page()),
                  );
                },
                child: const Text(
                  "Start checking in",
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

  Widget _buildButton(
    String text,
    Color bgColor,
    Color textColor,
    BuildContext context,
    VoidCallback onPressed,
  ) {
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
        onPressed: onPressed,
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
