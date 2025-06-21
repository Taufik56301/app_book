class Book {
  final String id;
  final String title;
  final String authors;
  final String thumbnail;
  final String description;

  Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.thumbnail,
    required this.description,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] ?? '',
      title: json['volumeInfo']['title'] ?? 'No Title',
      authors: (json['volumeInfo']['authors'] ?? ['Unknown']).join(', '),
      thumbnail: json['volumeInfo']['imageLinks']?['thumbnail'] ?? '',
      description: json['volumeInfo']['description'] ?? 'No description',
    );
  }
}