/// Model data buku yang digunakan dalam aplikasi.
class Book {
  /// ID unik dari buku (diperoleh dari Google Books API).
  final String id;

  /// Judul buku.
  final String title;

  /// Daftar nama penulis buku, digabung menjadi satu string.
  final String authors;

  /// URL gambar thumbnail buku.
  final String thumbnail;

  /// Deskripsi buku.
  final String description;

  /// Konstruktor utama [Book].
  Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.thumbnail,
    required this.description,
  });

  /// Factory constructor untuk membuat instance Book dari JSON.
  factory Book.fromJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'] ?? {};
    final imageLinks = volumeInfo['imageLinks'] ?? {};

    return Book(
      id: json['id'] ?? 'unknown-id',
      title: volumeInfo['title'] ?? 'Tanpa Judul',
      authors: (volumeInfo['authors'] as List?)?.join(', ') ?? 'Tidak diketahui',
      thumbnail: imageLinks['thumbnail'] ?? '',
      description: volumeInfo['description'] ?? 'Tidak ada deskripsi.',
    );
  }

  /// Konversi objek Book menjadi JSON (opsional untuk fitur simpan/favorit lokal).
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'authors': authors,
      'thumbnail': thumbnail,
      'description': description,
    };
  }
}
