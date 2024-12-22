import 'package:flutter/material.dart';
import '../services/api_services.dart';
import 'jokes_by_type_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Joke Types'),
        actions: [
          IconButton(
            icon: Icon(Icons.shuffle),
            onPressed: () async {
              final joke = await ApiService.getRandomJoke();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RandomJokeScreen(joke: joke),
                ),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<String>>(
        future: ApiService.getJokeTypes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final types = snapshot.data!;
            return ListView.builder(
              itemCount: types.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(types[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JokesByTypeScreen(type: types[index]),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}