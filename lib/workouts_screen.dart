import 'package:fitpulse/workout_detail_screen.dart';
import 'package:flutter/material.dart';

class WorkoutsScreen extends StatelessWidget {
  final List<Map<String, String>> workouts = [
    {'title': 'Full Body Burn', 'image': 'assets/fullbody.jpg'},
    {'title': 'Leg Day', 'image': 'assets/legs.jpg'},
    {'title': 'Upper Body Strength', 'image': 'assets/upper.jpg'},
    {'title': 'Core Crusher', 'image': 'assets/core.jpg'},
    {'title': 'Morning Yoga', 'image': 'assets/yoga.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Plans'),
      ),
      body: ListView.builder(
        itemCount: workouts.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          final workout = workouts[index];
          return Card(
            margin: EdgeInsets.only(bottom: 12),
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: EdgeInsets.all(12),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  workout['image']!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(workout['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) => WorkoutDetailScreen(
                    title: workout['title']!,
                    imagePath: workout['image']!,
                    description: 'This is a high-intensity workout to help you get in shape fast!',
                  ),
                ));
              },
            ),
          );
        },
      ),
    );
  }
}
