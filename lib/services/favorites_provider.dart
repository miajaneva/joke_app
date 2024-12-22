import 'package:flutter/material.dart';
import '../models/joke.dart';

class FavoritesProvider with ChangeNotifier {
  final List<Joke> _favorites = [];

  List<Joke> get favorites => _favorites;

  void addFavorite(Joke joke) {
    _favorites.add(joke);
    notifyListeners();
  }

  void removeFavorite(Joke joke) {
    _favorites.remove(joke);
    notifyListeners();
  }
}