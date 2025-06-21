import 'package:flutter/material.dart';
import '../models/book_model.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final VoidCallback onTap;

  const BookCard({super.key, required this.book, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(book.thumbnail, width: 50, fit: BoxFit.cover),
      title: Text(book.title),
      subtitle: Text(book.authors),
      onTap: onTap,
    );
  }
}