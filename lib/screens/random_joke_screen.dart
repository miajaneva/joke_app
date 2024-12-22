import 'package:flutter/material.dart';

class RandomJokeScreen extends StatelessWidget {
  final Map<String, dynamic> joke;

  RandomJokeScreen({required this.joke});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Random Joke')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(joke['setup'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text(joke['punchline'], style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}