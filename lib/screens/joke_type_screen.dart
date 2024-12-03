import 'package:flutter/material.dart';
import '../services/api_services.dart';
import '../models/joke_model.dart';

class JokeTypeScreen extends StatelessWidget {
  final String type;

  const JokeTypeScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$type Jokes")),
      body: FutureBuilder<List<Joke>>(
        future: ApiService.fetchJokesByType(type),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!
                  .map((joke) => ListTile(
                title: Text(joke.setup),
                subtitle: Text(joke.punchline),
              ))
                  .toList(),
            );
          } else {
            return const Center(child: Text("No jokes found"));
          }
        },
      ),
    );
  }
}