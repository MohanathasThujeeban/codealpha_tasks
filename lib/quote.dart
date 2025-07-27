class Quote {
  late int id;
  late String text;
  late String author;

  Quote();

  Quote.fromMap(Map<String, dynamic> map) {
    id = map['id'] ?? 0;
    text = map['text'] ?? '';
    author = map['author'] ?? '';
  }
}
