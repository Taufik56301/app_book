import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/book_model.dart';

class BookApi {
  static Future<List<Book>> fetchBooks(String query) async {
    final url = Uri.parse(
      'https://www.googleapis.com/books/v1/volumes?q=$query',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List booksJson = json.decode(response.body)['items'];
      return booksJson.map((json) => Book.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }
}