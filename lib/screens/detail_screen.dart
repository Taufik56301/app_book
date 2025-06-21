import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/book_model.dart';
import '../providers/favorites_provider.dart';

class DetailScreen extends StatelessWidget {
  final Book book;
  const DetailScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoritesProvider>(context);
    final isFav = provider.isFavorite(book);

    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
        actions: [
          IconButton(
            icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
            onPressed: () => provider.toggleFavorite(book),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            if (book.thumbnail.isNotEmpty)
              Image.network(book.thumbnail, height: 200),
            const SizedBox(height: 10),
            Text(
              book.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "Penulis: ${book.authors}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(book.description),
          ],
        ),
      ),
    );
  }
}