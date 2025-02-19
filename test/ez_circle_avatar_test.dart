import 'package:ez_circle_avatar/ez_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EzCircleAvatar', () {
    testWidgets('displays initials correctly for a two-word name',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: EzCircleAvatar(name: 'John Doe'),
        ),
      ));

      final textFinder = find.text('JD');
      expect(textFinder, findsOneWidget);
    });

    testWidgets('displays single initial correctly for a one-word name',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: EzCircleAvatar(name: 'Jane'),
        ),
      ));

      final textFinder = find.text('J');
      expect(textFinder, findsOneWidget);
    });

    testWidgets('displays person icon for an empty name',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: EzCircleAvatar(name: ''),
        ),
      ));

      final iconFinder = find.byWidgetPredicate((widget) =>
          widget is Icon && widget.icon == EzAvatarHelper.defaultIcon.icon);
      expect(iconFinder, findsOneWidget);
    });

    testWidgets('displays correct color for the same name',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: EzCircleAvatar(name: 'John Doe'),
        ),
      ));

      final circleAvatarFinder = find.byType(CircleAvatar);
      final circleAvatar = tester.widget<CircleAvatar>(circleAvatarFinder);
      final color1 = circleAvatar.backgroundColor;

      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: EzCircleAvatar(name: 'John Doe'),
        ),
      ));

      final circleAvatarFinder2 = find.byType(CircleAvatar);
      final circleAvatar2 = tester.widget<CircleAvatar>(circleAvatarFinder2);
      final color2 = circleAvatar2.backgroundColor;

      expect(color1, color2);
    });

    testWidgets('displays different colors for different names',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: EzCircleAvatar(name: 'John Doe'),
        ),
      ));

      final circleAvatarFinder = find.byType(CircleAvatar);
      final circleAvatar = tester.widget<CircleAvatar>(circleAvatarFinder);
      final color1 = circleAvatar.backgroundColor;

      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: EzCircleAvatar(name: 'Jane Smith'),
        ),
      ));

      final circleAvatarFinder2 = find.byType(CircleAvatar);
      final circleAvatar2 = tester.widget<CircleAvatar>(circleAvatarFinder2);
      final color2 = circleAvatar2.backgroundColor;

      expect(color1, isNot(color2));
    });
  });

  group('EzAvatarHelper', () {
    test('getInitials returns correct initials', () {
      expect(EzAvatarHelper.getInitials('John Doe'), 'JD');
      expect(EzAvatarHelper.getInitials('Jane'), 'J');
      expect(EzAvatarHelper.getInitials(''), '');
      expect(EzAvatarHelper.getInitials('   '), '');
      expect(EzAvatarHelper.getInitials('John Doe Smith'), 'JS');
    });
    test('getInitials returns correct initials for three-word name', () {
      expect(EzAvatarHelper.getInitials('John Doe Smith'), 'JS');
    });

    test('stringToColor returns the same color for the same string', () {
      final color1 = EzAvatarHelper.stringToColor('John Doe');
      final color2 = EzAvatarHelper.stringToColor('John Doe');
      expect(color1, color2);
    });

    test('stringToColor returns different colors for different strings', () {
      final color1 = EzAvatarHelper.stringToColor('John Doe');
      final color2 = EzAvatarHelper.stringToColor('Jane Smith');
      expect(color1, isNot(color2));
    });
  });
}
