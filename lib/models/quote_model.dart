class Quote {
  final int id;
  final String text;
  final String author;
  final String category;
  final List<String> tags;
  final DateTime createdAt;

  Quote({
    required this.id,
    required this.text,
    required this.author,
    required this.category,
    required this.tags,
    required this.createdAt,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['id'] ?? 0,
      text: json['text'] ?? '',
      author: json['author'] ?? 'Unknown',
      category: json['category'] ?? 'General',
      tags: List<String>.from(json['tags'] ?? []),
      createdAt:
          DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'author': author,
      'category': category,
      'tags': tags,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  Quote copyWith({
    int? id,
    String? text,
    String? author,
    String? category,
    List<String>? tags,
    DateTime? createdAt,
  }) {
    return Quote(
      id: id ?? this.id,
      text: text ?? this.text,
      author: author ?? this.author,
      category: category ?? this.category,
      tags: tags ?? this.tags,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
