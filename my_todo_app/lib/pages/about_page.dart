import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showAboutDialog(
              context: context,
              applicationIcon: FlutterLogo(),
              applicationName: 'About page App',
              applicationVersion: '0.0.1',
              applicationLegalese: 'DEVELOPED BY JAZZIE',
              children: [
                SizedBox(height: 20),
                Text('This app was created with love and Flutter.'),
              ],
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pink[200],
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          ),
          child: Text('View Licenses', style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
