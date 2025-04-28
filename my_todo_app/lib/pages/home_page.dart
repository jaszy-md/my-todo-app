import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_todo_app/widgets/emoticons.dart';
import 'package:my_todo_app/widgets/exercises.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd MMMM yyyy').format(now);

    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Hi, Jasmin!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(formattedDate, style: TextStyle(color: Colors.white)),
                SizedBox(height: 20),
                CircleAvatar(
                  backgroundColor: Colors.blue[600],
                  child: Icon(Icons.favorite_border, color: Colors.white),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.blue),
                      SizedBox(width: 5),
                      Text('Search', style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  'How are you feeling today?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.more_horiz, color: Colors.white),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Emoticons(emoticons: '😄'),
                    Emoticons(emoticons: '🙂'),
                    Emoticons(emoticons: '😩'),
                    Emoticons(emoticons: '😁'),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(25),
              color: Colors.grey[100],
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Exercises',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.more_horiz),
                    ],
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView(
                      children: [
                        Exercises(
                          icon: Icons.favorite,
                          exerciseName: 'Communication Skills',
                          numberOfExercises: 10,
                        ),
                        Exercises(
                          icon: Icons.person,
                          exerciseName: 'Notes',
                          numberOfExercises: 10,
                        ),
                        Exercises(
                          icon: Icons.battery_0_bar,
                          exerciseName: 'Relaxing',
                          numberOfExercises: 10,
                        ),
                        Exercises(
                          icon: Icons.star,
                          exerciseName: 'Self Image',
                          numberOfExercises: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
