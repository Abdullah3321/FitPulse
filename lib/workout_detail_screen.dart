import 'package:flutter/material.dart';

class WorkoutDetailScreen extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;

  WorkoutDetailScreen({
    required this.title,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath, width: double.infinity, height: 220, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleLarge),
                  SizedBox(height: 12),
                  Text(description, style: TextStyle(fontSize: 16)),
                  SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.play_arrow),
                    label: Text("Start Workout"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
