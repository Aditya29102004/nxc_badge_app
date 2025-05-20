import 'package:flutter/material.dart';
import 'admin1.dart'; // Import the Admin1Page

class AdminScreen extends StatelessWidget {
  static const String routeName = '/admin';

  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use a FutureBuilder to add a small delay before redirecting
    // This ensures the widget is fully built before navigation
    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 10)),
      builder: (context, snapshot) {
        // Once the future completes, navigate to Admin1Page
        if (snapshot.connectionState == ConnectionState.done) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const Admin1Page()),
            );
          });
        }

        // Display a loading indicator while redirecting
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Loading Admin Dashboard...')
              ],
            ),
          ),
        );
      },
    );
  }
}
