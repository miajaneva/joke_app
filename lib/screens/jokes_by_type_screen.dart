import 'package:flutter/material.dart';
import '../services/api_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class JokesByTypeScreen extends StatelessWidget {
  final String type;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  JokesByTypeScreen({required this.type});

  Future<void> toggleFavorite(Map<String, dynamic> joke) async {
    final doc = firestore.collection('favorites').doc(joke['id'].toString());
    final docSnapshot = await doc.get();

    if (docSnapshot.exists) {
      await doc.delete();
    } else {
      await doc.set(joke);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$type Jokes')),
      body: FutureBuilder<List<dynamic>>(
        future: ApiService.getJokesByType(type),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final jokes = snapshot.data!;
            return ListView.builder(
              itemCount: jokes.length,
              itemBuilder: (context, index) {
                final joke = jokes[index];
                return ListTile(
                  title: Text(joke['setup']),
                  subtitle: Text(joke['punchline']),
                  trailing: IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () => toggleFavorite(joke),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}