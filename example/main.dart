import 'package:ez_circle_avatar/ez_circle_avatar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EZ Circle Avatar Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'EZ Circle Avatar Demo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '1. Basic Usage (Auto-Color & Initials)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                EzCircleAvatar(name: 'John Doe'),
                EzCircleAvatar(name: 'Alice Smith'),
                EzCircleAvatar(name: 'Bob'),
                EzCircleAvatar(name: 'Super Cool User'),
              ],
            ),
            const Divider(height: 32),
            const Text(
              '2. Custom Styling (Override Colors & Radius)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                EzCircleAvatar(
                  name: 'Dark Mode',
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  radius: 30,
                ),
                EzCircleAvatar(
                  name: 'Gold',
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  radius: 40,
                ),
              ],
            ),
            const Divider(height: 32),
            const Text(
              '3. Image Support (With Fallback)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                // Valid Image
                EzCircleAvatar(
                  name: 'Valid Image',
                  backgroundImage: NetworkImage('https://picsum.photos/200'),
                  radius: 30,
                ),
                // Broken Image (Falls back to initials)
                EzCircleAvatar(
                  name: 'Broken Image',
                  backgroundImage:
                      NetworkImage('https://invalid-url.com/image.jpg'),
                  radius: 30,
                ),
              ],
            ),
            const Divider(height: 32),
            const Text(
              '4. Edge Cases (Empty Name, Special Chars)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                EzCircleAvatar(name: ''), // Empty name -> Default icon
                EzCircleAvatar(name: '   '), // Whitespace -> Default icon
                EzCircleAvatar(name: '@#'), // Special chars
                EzCircleAvatar(name: '123'), // Numbers
              ],
            ),
          ],
        ),
      ),
    );
  }
}
