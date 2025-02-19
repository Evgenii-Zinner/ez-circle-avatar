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

    testWidgets('displays custom background color',
        (WidgetTester tester) async {
      const customColor = Colors.red;
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: EzCircleAvatar(
            name: 'John Doe',
            backgroundColor: customColor,
          ),
        ),
      ));

      final circleAvatarFinder = find.byType(CircleAvatar);
      final circleAvatar = tester.widget<CircleAvatar>(circleAvatarFinder);
      expect(circleAvatar.backgroundColor, customColor);
    });

    testWidgets('displays custom foreground color',
        (WidgetTester tester) async {
      const customColor = Colors.green;
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: EzCircleAvatar(
            name: 'John Doe',
            foregroundColor: customColor,
          ),
        ),
      ));

      final defaultTextStyleFinder = find.descendant(
        of: find.byType(CircleAvatar),
        matching: find.byType(DefaultTextStyle),
      );
      final defaultTextStyle =
          tester.widget<DefaultTextStyle>(defaultTextStyleFinder.first);
      expect(defaultTextStyle.style.color, customColor);
    });

    testWidgets('displays custom child', (WidgetTester tester) async {
      const customChild = Icon(Icons.star);
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: EzCircleAvatar(
            name: 'John Doe',
            child: customChild,
          ),
        ),
      ));

      final childFinder = find.byWidget(customChild);
      expect(childFinder, findsOneWidget);
    });

    testWidgets('displays custom radius', (WidgetTester tester) async {
      const customRadius = 50.0;
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: EzCircleAvatar(
            name: 'John Doe',
            radius: customRadius,
          ),
        ),
      ));

      final circleAvatarFinder = find.byType(CircleAvatar);
      final circleAvatar = tester.widget<CircleAvatar>(circleAvatarFinder);
      expect(circleAvatar.radius, customRadius);
    });

    testWidgets('displays custom maxRadius', (WidgetTester tester) async {
      const customMaxRadius = 60.0;
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: EzCircleAvatar(
            name: 'John Doe',
            maxRadius: customMaxRadius,
          ),
        ),
      ));

      final circleAvatarFinder = find.byType(CircleAvatar);
      final circleAvatar = tester.widget<CircleAvatar>(circleAvatarFinder);
      expect(circleAvatar.maxRadius, customMaxRadius);
    });

    testWidgets('displays custom minRadius', (WidgetTester tester) async {
      const customMinRadius = 20.0;
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: EzCircleAvatar(
            name: 'John Doe',
            minRadius: customMinRadius,
          ),
        ),
      ));

      final circleAvatarFinder = find.byType(CircleAvatar);
      final circleAvatar = tester.widget<CircleAvatar>(circleAvatarFinder);
      expect(circleAvatar.minRadius, customMinRadius);
    });

    testWidgets('displays custom backgroundImage', (WidgetTester tester) async {
      const customImage = AssetImage('test/image.png');
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: EzCircleAvatar(
            name: 'John Doe',
            backgroundImage: customImage,
          ),
        ),
      ));

      final circleAvatarFinder = find.byType(CircleAvatar);
      final circleAvatar = tester.widget<CircleAvatar>(circleAvatarFinder);
      expect(circleAvatar.backgroundImage, customImage);
    });

    testWidgets('displays custom foregroundImage', (WidgetTester tester) async {
      const customImage = AssetImage('test/image.png');
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: EzCircleAvatar(
            name: 'John Doe',
            foregroundImage: customImage,
          ),
        ),
      ));

      final circleAvatarFinder = find.byType(CircleAvatar);
      final circleAvatar = tester.widget<CircleAvatar>(circleAvatarFinder);
      expect(circleAvatar.foregroundImage, customImage);
    });
  });
}
