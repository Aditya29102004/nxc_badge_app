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
  bool _isLoading = false;

  // Map to directly link card types to routes
  final Map<String, String> cardTypeToRoutes = {
    'Student': '/student',
    'Teacher': '/teacher',
    'Normal User': '/normal-user',
    'Temporary Admin': '/admin',
  };

  @override
  void dispose() {
    _studentIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleGoogleLogin() async {
    print('GOOGLE LOGIN pressed');
    print('Current selectedCardType: $selectedCardType');

    if (selectedCardType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a card type')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Try to get FirebaseAuthMethods from provider
      try {
        final authMethods = context.read<FirebaseAuthMethods>();
        await authMethods.signInWithGoogle(context);

        // If successful, navigate to the appropriate screen
        if (mounted) {
          final route = cardTypeToRoutes[selectedCardType];
          print(
              'Google login - Route looked up: $route for type: $selectedCardType');
          if (route != null) {
            print('Attempting to navigate to: $route');
            Navigator.pushReplacementNamed(context, route);
          }
        }
      } catch (e) {
        print('Auth provider error: $e');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Authentication error: ${e.toString()}')),
          );
        }
      }
    } catch (e) {
      print('Google sign in error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sign in failed: ${e.toString()}')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  // Improved dev login handler with extensive debugging
  void _handleDevLogin() {
    print('DEV LOGIN pressed');
    print('Current selectedCardType: $selectedCardType');

    if (selectedCardType == null) {
      print('No card type selected');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a card type')),
      );
      return;
    }

    // Show loading indicator during navigation
    setState(() {
      _isLoading = true;
    });

    try {
      // Debug print to verify the map content
      print('Card type to routes map: $cardTypeToRoutes');

      final route = cardTypeToRoutes[selectedCardType];
      print('Route looked up: $route for type: $selectedCardType');

      if (route != null) {
        print('Navigating to route: $route');

        // Add a small delay to ensure the UI updates before navigation
        Future.delayed(Duration(milliseconds: 100), () {
          try {
            print('Attempting navigation to: $route');
            Navigator.of(context).pushReplacementNamed(route);
            print('Navigation call completed for route: $route');
          } catch (navError) {
            print('Inner navigation error: $navError');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(
                      'Navigation execution failed: ${navError.toString()}')),
            );
          }
        });
      } else {
        print('Route is null for card type: $selectedCardType');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid card type')),
        );
      }
    } catch (e) {
      print('Navigation error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Navigation failed: ${e.toString()}')),
      );
    } finally {
      // Reset loading state
      Future.delayed(Duration(milliseconds: 500), () {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
          print('Loading state reset');
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Print routes on initialization for debugging
    print('Available routes in cardTypeToRoutes: $cardTypeToRoutes');
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
              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        InkWell(
                          onTap: _handleGoogleLogin,
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Center(
                              child: Text(
                                'GOOGLE LOGIN',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Dev Login Button - Direct navigation without auth
                        InkWell(
                          onTap: _handleDevLogin,
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Center(
                              child: Text(
                                'DEV LOGIN',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
              Spacer(),
              // Door illustration with error handling
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  'assets/door_illustration.png',
                  height: 200,
                  errorBuilder: (context, error, stackTrace) {
                    print('Image asset error: $error');
                    return Container(
                      height: 400,
                      width: 100,
                      color: Colors.grey[300],
                      child: Icon(Icons.image_not_supported),
                    );
                  },
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
          print('Selected card type: $type');
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
