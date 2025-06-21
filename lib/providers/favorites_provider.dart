import 'package:flutter/material.dart';
import '../models/book_model.dart';

class FavoritesProvider with ChangeNotifier {
  final List<Book> _favoriteBooks = [];

  List<Book> get favorites => _favoriteBooks;

  void toggleFavorite(Book book) {
    if (isFavorite(book)) {
      _favoriteBooks.removeWhere((b) => b.id == book.id);
    } else {
      _favoriteBooks.add(book);
    }
    notifyListeners();
  }

  bool isFavorite(Book book) {
    return _favoriteBooks.any((b) => b.id == book.id);
  }
}