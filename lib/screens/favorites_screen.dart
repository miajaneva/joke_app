import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorite Jokes')),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('favorites').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final jokes = snapshot.data!.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
            return ListView.builder(
              itemCount: jokes.length,
              itemBuilder: (context, index) {
                final joke = jokes[index];
                return ListTile(
                  title: Text(joke['setup']),
                  subtitle: Text(joke['punchline']),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => firestore.collection('favorites').doc(joke['id'].toString()).delete(),
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