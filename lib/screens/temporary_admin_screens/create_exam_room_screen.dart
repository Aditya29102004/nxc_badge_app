import 'package:flutter/material.dart';

class CreateExamRoomScreen extends StatefulWidget {
  const CreateExamRoomScreen({Key? key}) : super(key: key);

  @override
  State<CreateExamRoomScreen> createState() => _CreateExamRoomScreenState();
}

class _CreateExamRoomScreenState extends State<CreateExamRoomScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _classController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _roomController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();

  String? _selectedCollege;
  final List<String> _colleges = [
    'Select College',
    'College A',
    'College B',
    'College C',
  ];

  @override
  void initState() {
    super.initState();
    _selectedCollege = _colleges[0];
  }

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
          'Exam room',
          style: TextStyle(
            color: Color(0xFF5B43E9),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xFF5B43E9), width: 2),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 8,
                    offset: const Offset(4, 6),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _FormLabel('Exam Title'),
                    _FormInput(
                      controller: _titleController,
                      hintText: 'e.g, Math Exam',
                    ),
                    const SizedBox(height: 16),
                    const _FormLabel('Class /Section'),
                    _FormInput(
                      controller: _classController,
                      hintText: 'e.g, CS101-A',
                    ),
                    const SizedBox(height: 16),
                    const _FormLabel('Date'),
                    _FormInput(
                      controller: _dateController,
                      hintText: 'YYYY-MM-DD,e.g,2025-04-30',
                    ),
                    const SizedBox(height: 16),
                    const _FormLabel('College ID'),
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF5B43E9), width: 2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: DropdownButton<String>(
                        value: _selectedCollege,
                        isExpanded: true,
                        underline: const SizedBox(),
                        borderRadius: BorderRadius.circular(16),
                        items: _colleges.map((college) {
                          return DropdownMenuItem<String>(
                            value: college,
                            child: Text(college,
                                style: TextStyle(
                                    color: college == 'Select College'
                                        ? Colors.grey
                                        : Colors.black)),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedCollege = value;
                          });
                        },
                      ),
                    ),
                    const _FormLabel('Room ID'),
                    _FormInput(
                      controller: _roomController,
                      hintText: 'e.g,ROOM_001',
                    ),
                    const SizedBox(height: 16),
                    const _FormLabel('Expiry Date'),
                    _FormInput(
                      controller: _expiryController,
                      hintText: 'YYYY-MM-DD,e.g,2025-06-30',
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 120,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text('Cancel',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ),
                SizedBox(
                  width: 120,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Save logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF5B43E9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text('Save',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _FormLabel extends StatelessWidget {
  final String text;
  const _FormLabel(this.text, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 4),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}

class _FormInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const _FormInput({required this.controller, required this.hintText, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFF5B43E9), width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFF5B43E9), width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFF5B43E9), width: 2),
          ),
        ),
      ),
    );
  }
}
