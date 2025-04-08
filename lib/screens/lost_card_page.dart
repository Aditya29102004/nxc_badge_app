import 'package:flutter/material.dart';

class LostCardPage extends StatefulWidget {
  const LostCardPage({Key? key}) : super(key: key);

  @override
  State<LostCardPage> createState() => _LostCardPageState();
}

class _LostCardPageState extends State<LostCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: const BackButton(),
        title: const Text(
          'LOST CARD',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Make text clearly visible at the top with larger font
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 20),
                    child: const Text(
                      'Inform college admin about LOST CARD!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(),
                  // Center the illustration
                  Center(
                    child: Image.asset(
                      'assets/lost_card_illustration.png',
                      height: 200,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey, width: 0.5),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildBottomNavItem(Icons.home_outlined, 'Home'),
                buildBottomNavItem(Icons.circle_outlined, 'Record'),
                buildBottomNavItem(Icons.calendar_today_outlined, 'Event',
                    isActive: true),
                buildBottomNavItem(Icons.person_outline, 'Profile'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottomNavItem(IconData icon, String label,
      {bool isActive = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isActive ? Colors.blue : Colors.grey,
          size: 22,
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.blue : Colors.grey,
            fontSize: 10,
          ),
        ),
        if (isActive)
          Container(
            width: 8,
            height: 2,
            color: Colors.blue,
            margin: const EdgeInsets.only(top: 3),
          ),
      ],
    );
  }
}
