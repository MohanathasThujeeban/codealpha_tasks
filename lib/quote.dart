class Quote {
  int id;
  String text;
  String author;

  Quote();

  Quote.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    text = map['text'];
    author = map['author'];
  }
}
