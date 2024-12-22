import 'package:flutter/material.dart';
import '../models/joke.dart';

class JokeListItem extends StatelessWidget {
  final Joke joke;

  JokeListItem({required this.joke});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              joke.setup,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(joke.punchline, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}