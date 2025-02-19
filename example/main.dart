import 'package:flutter/material.dart';
import 'package:ez_circle_avatar/ez_circle_avatar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: MyCard(name: 'John Doe'),
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  final String name;

  const MyCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: EzCircleAvatar(name: name),
        title: Text(name),
      ),
    );
  }
}
