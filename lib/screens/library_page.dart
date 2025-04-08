import 'package:flutter/material.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> _borrowedBooks = [
    {
      'title': 'Introduction to Algorithms',
      'author': 'Thomas H. Cormen',
      'dueDate': '2025-04-20',
      'thumbnail': Icons.book,
    },
    {
      'title': 'Clean Code',
      'author': 'Robert C. Martin',
      'dueDate': '2025-04-15',
      'thumbnail': Icons.book,
    },
  ];

  final List<Map<String, dynamic>> _availableBooks = [
    {
      'title': 'Design Patterns',
      'author': 'Erich Gamma et al.',
      'available': true,
      'thumbnail': Icons.book_online,
    },
    {
      'title': 'The Pragmatic Programmer',
      'author': 'Andrew Hunt and David Thomas',
      'available': true,
      'thumbnail': Icons.book_online,
    },
    {
      'title': 'Refactoring',
      'author': 'Martin Fowler',
      'available': false,
      'thumbnail': Icons.book_online,
    },
    {
      'title': 'Effective Java',
      'author': 'Joshua Bloch',
      'available': true,
      'thumbnail': Icons.book_online,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.indigo,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.indigo,
          tabs: const [
            Tab(text: 'Borrowed Books'),
            Tab(text: 'Browse Books'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Borrowed Books Tab
          _borrowedBooks.isEmpty
              ? const Center(child: Text('No books currently borrowed'))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _borrowedBooks.length,
                  itemBuilder: (context, index) {
                    final book = _borrowedBooks[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.indigo.shade100,
                          child: Icon(book['thumbnail'], color: Colors.indigo),
                        ),
                        title: Text(book['title']),
                        subtitle: Text(book['author']),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text('Due Date:'),
                            Text(
                              book['dueDate'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

          // Browse Books Tab
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for books...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: _availableBooks.length,
                  itemBuilder: (context, index) {
                    final book = _availableBooks[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.indigo.shade100,
                          child: Icon(book['thumbnail'], color: Colors.indigo),
                        ),
                        title: Text(book['title']),
                        subtitle: Text(book['author']),
                        trailing: TextButton(
                          child: Text(
                            book['available'] ? 'Borrow' : 'Reserved',
                            style: TextStyle(
                              color:
                                  book['available'] ? Colors.green : Colors.red,
                            ),
                          ),
                          onPressed: book['available'] ? () {} : null,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
