import 'package:flutter/material.dart';
import 'teacher2.dart'; // Import the Teacher1Page

class TeacherScreen extends StatelessWidget {
  static const String routeName = '/teacher';

  const TeacherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use a FutureBuilder to add a small delay before redirecting
    // This ensures the widget is fully built before navigation
    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 10)),
      builder: (context, snapshot) {
        // Once the future completes, navigate to Teacher1Page
        if (snapshot.connectionState == ConnectionState.done) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const Teacher2Page()),
            );
          });
        }

        // Display a loading indicator while redirecting
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF3A2BDD)),
                ),
                SizedBox(height: 16),
                Text(
                  'Loading Teacher Dashboard...',
                  style: TextStyle(
                    color: Color(0xFF3A2BDD),
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
