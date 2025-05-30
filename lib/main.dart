import 'package:fitpulse/edit_profile_screen.dart';
import 'package:fitpulse/profile_screen.dart';
import 'package:fitpulse/workout_calendar_screen.dart';
import 'package:fitpulse/workout_detail_screen.dart';
import 'package:fitpulse/workouts_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home_screen.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(FitPulseApp());
}

class FitPulseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitPulse',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Color(0xFFF7F8FA),
        textTheme: TextTheme(
          headlineMedium: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
          bodyMedium: TextStyle(color: Colors.black54),
        ),
      ),
      home: AuthWrapper(),
      routes: {
        '/home': (_) => HomeScreen(),
        '/workouts': (_) => WorkoutsScreen(),
        '/profile': (_) => ProfileScreen(),
        '/login': (_) => LoginScreen(),
        '/register': (_) => RegisterScreen(),
        '/workout-detail': (_) => WorkoutDetailScreen(title: '', imagePath: '', description: ''),
        '/edit-profile': (_) => EditProfileScreen(),
        '/calendar': (_) => WorkoutCalendarScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return HomeScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
