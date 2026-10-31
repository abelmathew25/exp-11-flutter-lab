import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ios_app/main.dart';

void main() {
  testWidgets('Home screen UI is shown', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('iOS Flutter Application'), findsOneWidget);
    expect(find.text('Flutter iOS App'), findsOneWidget);
    expect(find.byIcon(Icons.phone_iphone), findsOneWidget);
    expect(find.text('✓ Application Ready'), findsOneWidget);
  });

  testWidgets('Test Button shows success message', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Test Button'));
    await tester.pump();

    expect(find.text('Button clicked successfully!'), findsOneWidget);
  });

  testWidgets('Empty text field blocks navigation', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Go to Next Screen'));
    await tester.pump();

    expect(find.text('Please enter your name'), findsOneWidget);
    expect(find.text('Second Screen'), findsNothing);
  });

  testWidgets('Text field, navigation, image and back transition',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(find.byKey(const Key('nameField')), 'Abel');
    await tester.tap(find.text('Go to Next Screen'));
    await tester.pumpAndSettle();

    expect(find.text('Second Screen'), findsOneWidget);
    expect(find.text('Welcome, Abel!'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);

    await tester.tap(find.text('Back to Home'));
    await tester.pumpAndSettle();

    expect(find.text('Second Screen'), findsNothing);
    expect(find.text('iOS Flutter Application'), findsOneWidget);
  });
}
