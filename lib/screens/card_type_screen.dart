import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth_demo/services/firebase_auth_methods.dart';

class CardTypeScreen extends StatefulWidget {
  static const String routeName = '/card-type';

  const CardTypeScreen({Key? key}) : super(key: key);

  @override
  State<CardTypeScreen> createState() => _CardTypeScreenState();
}

class _CardTypeScreenState extends State<CardTypeScreen> {
  String? selectedCardType;
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _studentIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() async {
    if (selectedCardType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a card type'),
        ),
      );
      return;
    }

    try {
      await context.read<FirebaseAuthMethods>().signInWithGoogle(context);

      // Navigate to the appropriate screen based on card type
      switch (selectedCardType) {
        case 'Student':
          Navigator.pushReplacementNamed(context, '/dashboard');
          break;
        case 'Teacher':
          Navigator.pushReplacementNamed(context, '/teacher');
          break;
        case 'Normal User':
          Navigator.pushReplacementNamed(context, '/normal-user');
          break;
        case 'Temporary Admin':
          Navigator.pushReplacementNamed(context, '/admin');
          break;
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign in failed: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 24.0),
                child: Row(
                  children: [
                    Icon(Icons.arrow_back, color: Colors.grey),
                  ],
                ),
              ),
              Text(
                'Choose your card type!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3F3CE7),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: _buildCardTypeButton('Student'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildCardTypeButton('Teacher'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildCardTypeButton('Normal User'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildCardTypeButton('Temporary Admin'),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFFE5E4FF),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: TextField(
                    controller: _studentIdController,
                    decoration: InputDecoration(
                      hintText: 'Student ID',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFF3F3CE7),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              InkWell(
                onTap: _handleLogin,
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              // Door illustration
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  'assets/door_illustration.png', // Make sure this asset exists
                  height: 100,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardTypeButton(String type) {
    final isSelected = selectedCardType == type;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCardType = type;
        });
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF3F3CE7) : Color(0xFFE5E4FF),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            type,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
