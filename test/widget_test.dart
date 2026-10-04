import 'package:flutter_test/flutter_test.dart';

import 'package:fitness_application/main.dart';

void main() {
  testWidgets('fitness app loads the dashboard', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Fitness Application'), findsOneWidget);
    expect(find.text('Welcome back, Alex!'), findsOneWidget);
    expect(find.text('Workout'), findsWidgets);
  });
}
