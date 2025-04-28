import 'package:flutter/material.dart';

class MotivationPage extends StatelessWidget {
  const MotivationPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> messages = [
      'You are capable of amazing things!',
      'Believe in yourself and all that you are.',
      'Your hard work will pay off!',
      'Dream big and dare to fail.',
      'The only way to do great work is to love what you do.',
      'Success is not final, failure is not fatal.',
    ];

    List<Color?> colors = [
      Colors.blue[200],
      Colors.orange[200],
      Colors.green[200],
      Colors.purple[200],
      Colors.red[200],
      Colors.yellow[200],
    ];

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(messages.length, (index) {
          return Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: colors[index],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              messages[index],
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          );
        }),
      ),
    );
  }
}
