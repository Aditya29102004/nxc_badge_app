import 'package:flutter/material.dart';
import 'temporary_admin_welcome_screen.dart';

class TemporaryAdminLoginScreen extends StatefulWidget {
  const TemporaryAdminLoginScreen({Key? key}) : super(key: key);

  @override
  State<TemporaryAdminLoginScreen> createState() =>
      _TemporaryAdminLoginScreenState();
}

class _TemporaryAdminLoginScreenState extends State<TemporaryAdminLoginScreen> {
  String selectedType = 'Temporary Admin';
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final List<String> cardTypes = [
    'Student',
    'Teacher',
    'Normal User',
    'Temporary Admin',
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
          'Choose your card type!',
          style: TextStyle(
            color: Color(0xFF5B43E9),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: cardTypes.map((type) {
                  final bool isSelected = selectedType == type;
                  return ChoiceChip(
                    label: Text(
                      type,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Color(0xFF5B43E9),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    selected: isSelected,
                    selectedColor: Color(0xFF5B43E9),
                    backgroundColor: Color(0xFFD6D1F8),
                    onSelected: (selected) {
                      setState(() {
                        selectedType = type;
                      });
                    },
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: idController,
                decoration: InputDecoration(
                  hintText: '|Temporary Admin ID',
                  filled: true,
                  fillColor: Color(0xFFD6D1F8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 18,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '|Password',
                  filled: true,
                  fillColor: Color(0xFF5B43E9),
                  hintStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 18,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: selectedType == 'Temporary Admin'
                    ? () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                const TemporaryAdminWelcomeScreen(),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: const Size(220, 50),
                ),
                child: const Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Placeholder for illustration
              SizedBox(
                height: 140,
                child: Center(
                  child: Image.network(
                    'https://undraw.co/api/illustrations/undraw_enter_uhqk.svg',
                    height: 120,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.image,
                      size: 80,
                      color: Colors.grey[300],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
