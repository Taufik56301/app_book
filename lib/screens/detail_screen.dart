import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/book_model.dart';
import '../providers/favorites_provider.dart';

class DetailScreen extends StatelessWidget {
  final Book book;
  const DetailScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final provider = Provider.of<FavoritesProvider>(context);
    final isFav = provider.isFavorite(book);

    return Scaffold(
      backgroundColor: isDark ? Colors.grey[900] : Colors.grey[100],
      appBar: AppBar(
        title: Text(
          book.title,
          style: const TextStyle(fontWeight: FontWeight.w600),
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF3A7BD5), Color(0xFF00D2FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
            ),
            onPressed: () => provider.toggleFavorite(book),
            tooltip: isFav ? 'Hapus dari Favorit' : 'Tambahkan ke Favorit',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            if (book.thumbnail.isNotEmpty)
              Hero(
                tag: book.id ?? book.title,
                child: Container(
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: NetworkImage(book.thumbnail),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 20),

            // Judul buku
            Text(
              book.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
            const SizedBox(height: 8),

            // Penulis
            Row(
              children: [
                const Icon(Icons.person, size: 18, color: Colors.blueAccent),
                const SizedBox(width: 6),
                Text(
                  book.authors,
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: isDark ? Colors.grey[300] : Colors.black54,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            const Divider(thickness: 1),

            // Deskripsi
            Text(
              "Deskripsi",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              book.description.isNotEmpty
                  ? book.description
                  : 'Tidak ada deskripsi tersedia.',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: isDark ? Colors.grey[200] : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
