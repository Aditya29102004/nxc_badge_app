import 'package:flutter/material.dart';

// Import your other screens
import 'admin1.dart';
import 'admin5.dart';
import 'admin11.dart';
import 'admin26.dart';
import 'admin27.dart';

class Admin13Page extends StatelessWidget {
  const Admin13Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Admin1Page(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Color.fromARGB(255, 0, 0, 0),
                      size: 30,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'PROFILE',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_avatar.png'),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF3A2BDD)),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  InfoRow(label: 'NAME:', value: 'Larry j. brown'),
                  SizedBox(height: 10),
                  InfoRow(label: 'INSTAGRAM ID:', value: 'Brownlarry27'),
                  SizedBox(height: 10),
                  InfoRow(label: 'FACEBOOK ID:', value: 'Brownlarry27'),
                ],
              ),
            ),
            const SizedBox(height: 30),
            buildButton(context, 'Tap NFC Card', const Admin11Page()),
            const SizedBox(height: 16),
            buildButton(context, 'QR CODE', const Admin11Page()),
            const SizedBox(height: 16),
            buildButton(context, 'Support', const Admin27Page()),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFF3F3F3),
        selectedItemColor: const Color(0xFF3A2BDD),
        unselectedItemColor: Colors.black,
        currentIndex: 3,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.fiber_manual_record),
            label: 'Record',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Community'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const Admin1Page()),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const Admin26Page()),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const Admin5Page()),
              );
              break;
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const Admin13Page()),
              );
              break;
          }
        },
      ),
    );
  }

  static Widget buildButton(BuildContext context, String label, Widget page) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(48),
          ),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => page));
        },
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF3A2BDD),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
