import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<WorkoutPlan> workouts = const [
    WorkoutPlan(
      title: 'Morning Run',
      duration: '30 min',
      calories: '240 kcal',
      progress: 0.75,
      color: Color(0xFF2CC9B4),
      icon: Icons.directions_run,
    ),
    WorkoutPlan(
      title: 'HIIT Circuit',
      duration: '20 min',
      calories: '190 kcal',
      progress: 0.55,
      color: Color(0xFF7F7BFF),
      icon: Icons.fitness_center,
    ),
    WorkoutPlan(
      title: 'Mobility Flow',
      duration: '15 min',
      calories: '120 kcal',
      progress: 0.90,
      color: Color(0xFFFFA94D),
      icon: Icons.self_improvement,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Fitness Application',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF7A7A8B),
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Welcome back, Abdullah!',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF171A1F),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.07),
                            offset: const Offset(0, 8),
                            blurRadius: 16,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.notifications_none_rounded,
                        color: Color(0xFF171A1F),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search workouts, meals, and goals',
                      hintStyle: TextStyle(color: Color(0xFF9AA0A6)),
                      prefixIcon: Icon(Icons.search, color: Color(0xFF8E9198)),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF2CC9B4), Color(0xFF1EA5D0)],
                    ),
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF2CC9B4).withValues(alpha: 0.32),
                        blurRadius: 22,
                        offset: const Offset(0, 14),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Progress',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '52% of your goal',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Keep pushing for 12 more minutes today.',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 98,
                        height: 98,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 88,
                              height: 88,
                              child: CircularProgressIndicator(
                                value: 0.52,
                                strokeWidth: 8,
                                backgroundColor: Colors.white.withValues(
                                  alpha: 0.2,
                                ),
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            ),
                            const Text(
                              '52%',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 26),
                const Text(
                  'Workout',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF171A1F),
                  ),
                ),
                const SizedBox(height: 14),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: const [
                    _CategoryChip(label: 'Cardio', icon: Icons.favorite_border),
                    _CategoryChip(
                      label: 'Strength',
                      icon: Icons.fitness_center,
                    ),
                    _CategoryChip(
                      label: 'Recovery',
                      icon: Icons.self_improvement,
                    ),
                    _CategoryChip(label: 'Nutrition', icon: Icons.local_dining),
                  ],
                ),
                const SizedBox(height: 26),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Today\'s plan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF171A1F),
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2CC9B4),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                ...workouts.map((workout) => _WorkoutCard(workout: workout)),
                const SizedBox(height: 26),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 18,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFE7D4),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Icon(
                          Icons.timer_outlined,
                          color: Color(0xFFFFA94D),
                        ),
                      ),
                      const SizedBox(width: 14),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Next session',
                              style: TextStyle(
                                color: Color(0xFF8A8F96),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Upper body power',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF171A1F),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2CC9B4),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text('Start'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() => selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart),
            label: 'Stats',
          ),
          NavigationDestination(
            icon: Icon(Icons.directions_run_outlined),
            selectedIcon: Icon(Icons.directions_run),
            label: 'Workout',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: const Color(0xFF2CC9B4)),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF171A1F),
            ),
          ),
        ],
      ),
    );
  }
}

class WorkoutPlan {
  const WorkoutPlan({
    required this.title,
    required this.duration,
    required this.calories,
    required this.progress,
    required this.color,
    required this.icon,
  });

  final String title;
  final String duration;
  final String calories;
  final double progress;
  final Color color;
  final IconData icon;
}

class _WorkoutCard extends StatelessWidget {
  const _WorkoutCard({required this.workout});

  final WorkoutPlan workout;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: workout.color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(workout.icon, color: workout.color),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  workout.title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF171A1F),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      workout.duration,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF7A7A8B),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      workout.calories,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF7A7A8B),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  value: workout.progress,
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(10),
                  backgroundColor: const Color(0xFFEAF0F2),
                  valueColor: AlwaysStoppedAnimation<Color>(workout.color),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '${(workout.progress * 100).round()}%',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Color(0xFF171A1F),
            ),
          ),
        ],
      ),
    );
  }
}
