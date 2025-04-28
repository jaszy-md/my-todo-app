import 'package:flutter/material.dart';
import 'package:my_todo_app/controllers/todo_controller.dart';
import 'package:my_todo_app/pages/home_page.dart';
import 'package:my_todo_app/pages/motivation_page.dart';
import 'package:my_todo_app/pages/about_page.dart';
import 'package:my_todo_app/pages/todo_page.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;
  bool isLoading = true;
  List items = [];

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    try {
      final todos = await TodoController.fetchTodos();
      setState(() {
        items = todos;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
    }
  }

  void _deleteTodo(String id) async {
    try {
      await TodoController.deleteTodo(id);
      setState(() {
        items.removeWhere((element) => element['_id'] == id);
      });
    } catch (_) {
      _showErrorMessage('Failed to delete todo');
    }
  }

  void _editTodo(Map item) async {
    await TodoController.navigateToEditPage(context, item);
    await _loadTodos();
  }

  void _addTodo() async {
    await TodoController.navigateToAddPage(context);
    await _loadTodos();
  }

  void _showErrorMessage(String message) {
    final snackBar = SnackBar(
      content: Text(message, style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[200],
        title: const Center(
          child: Text(
            'Moodyboard',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: _getPage(_selectedIndex),
      floatingActionButton:
          _selectedIndex == 1
              ? FloatingActionButton.extended(
                onPressed: _addTodo,
                label: const Text('Add todo'),
              )
              : null,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        backgroundColor: Colors.green[300],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Todo',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Happy'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'About'),
        ],
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return isLoading
            ? const Center(child: CircularProgressIndicator())
            : TodoPage(items: items, onDelete: _deleteTodo, onEdit: _editTodo);
      case 2:
        return const MotivationPage();
      case 3:
        return const AboutPage();
      default:
        return const Center(child: Text('Unknown page'));
    }
  }
}
