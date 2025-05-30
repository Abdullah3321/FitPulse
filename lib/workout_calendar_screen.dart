import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WorkoutCalendarScreen extends StatefulWidget {
  @override
  _WorkoutCalendarScreenState createState() => _WorkoutCalendarScreenState();
}

class _WorkoutCalendarScreenState extends State<WorkoutCalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<String>> _events = {};
  final userId = FirebaseAuth.instance.currentUser?.uid;

  @override
  void initState() {
    super.initState();
    _fetchWorkouts();
  }

  void _fetchWorkouts() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('workout_schedule')
        .get();

    Map<DateTime, List<String>> loaded = {};
    for (var doc in snapshot.docs) {
      DateTime date = DateTime.parse(doc.id);
      loaded[date] = List<String>.from(doc['workouts']);
    }

    setState(() {
      _events = loaded;
    });
  }

  List<String> _getWorkoutsForDay(DateTime day) {
    return _events[DateTime(day.year, day.month, day.day)] ?? [];
  }

  void _addWorkout(String workout) async {
    final dateKey = DateTime(_selectedDay!.year, _selectedDay!.month, _selectedDay!.day);
    final ref = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('workout_schedule')
        .doc(dateKey.toIso8601String());

    final existing = _events[dateKey] ?? [];
    final updated = [...existing, workout];

    await ref.set({'workouts': updated});
    setState(() {
      _events[dateKey] = updated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Workout Calendar")),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2023, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            eventLoader: _getWorkoutsForDay,
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Colors.teal,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.tealAccent,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text("Workouts on ${_selectedDay?.toLocal().toString().split(' ')[0] ?? 'Select a day'}"),
          const SizedBox(height: 8),
          ..._getWorkoutsForDay(_selectedDay ?? _focusedDay)
              .map((e) => ListTile(title: Text(e))),
          ElevatedButton(
            onPressed: () {
              if (_selectedDay == null) return;
              _showAddWorkoutDialog();
            },
            child: Text("Add Workout"),
          )
        ],
      ),
    );
  }

  void _showAddWorkoutDialog() {
    String workout = '';
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Add Workout"),
        content: TextField(
          decoration: InputDecoration(labelText: "Workout Name"),
          onChanged: (val) => workout = val,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (workout.isNotEmpty) {
                _addWorkout(workout);
              }
            },
            child: Text("Add"),
          )
        ],
      ),
    );
  }
}
