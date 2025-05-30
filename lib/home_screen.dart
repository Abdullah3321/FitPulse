import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, String>> workouts = [
    {'title': 'Cardio Blast', 'image': 'assets/cardio.jpg'},
    {'title': 'Strength Training', 'image': 'assets/strength.jpg'},
    {'title': 'Yoga Flow', 'image': 'assets/yoga.jpg'},
    {'title': 'HIIT', 'image': 'assets/hiit.jpg'},
    {'title': 'Crossfit', 'image': 'assets/crossfit.jpg'},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.teal),
                child: Text(
                  'FitPulse Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.fitness_center),
                title: Text('Workouts'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/workouts');
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/profile');
                },
              ),
              // Added Workout Calendar here
              ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text('Workout Calendar'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/calendar');
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                  Navigator.pop(context);
                  _logout();
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('FitPulse'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Grid View'),
            Tab(text: 'List View'),
          ],
          indicatorColor: Colors.white,
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [
            // Grid View
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: workouts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 3 / 2,
                ),
                itemBuilder: (context, index) {
                  final workout = workouts[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.teal[50],
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                            child: Image.asset(
                              workout['image']!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            workout['title']!,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // List View
            ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: workouts.length,
              separatorBuilder: (_, __) => Divider(),
              itemBuilder: (context, index) {
                final workout = workouts[index];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      workout['image']!,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    workout['title']!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Optionally: Navigate to workout details screen
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
