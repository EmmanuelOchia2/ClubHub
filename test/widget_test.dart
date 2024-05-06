// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:clubhub_app/modules/search/data/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:clubhub_app/main.dart';

void main() {
  testWidgets('Initial page is working', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final userRepository = UserRepository();
    await tester.pumpWidget(MyApp(
      userRepository: userRepository,
    ));
    expect(find.text('Search'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.search));
    await tester.pump();
  });
}
