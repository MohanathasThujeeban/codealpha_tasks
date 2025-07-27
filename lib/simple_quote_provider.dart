import 'dart:math';

class Quote {
  late int id;
  late String text;
  late String author;

  Quote({required this.id, required this.text, required this.author});

  Quote.fromMap(Map<String, dynamic> map) {
    id = map['id'] ?? 0;
    text = map['text'] ?? '';
    author = map['author'] ?? '';
  }
}

class QuoteProvider {
  static final List<Quote> _quotes = [
    Quote(
        id: 1,
        text: "The only way to do great work is to love what you do.",
        author: "Steve Jobs"),
    Quote(
        id: 2,
        text: "Life is what happens when you're busy making other plans.",
        author: "John Lennon"),
    Quote(
        id: 3,
        text:
            "The future belongs to those who believe in the beauty of their dreams.",
        author: "Eleanor Roosevelt"),
    Quote(
        id: 4,
        text:
            "It is during our darkest moments that we must focus to see the light.",
        author: "Aristotle"),
    Quote(
        id: 5,
        text: "The way to get started is to quit talking and begin doing.",
        author: "Walt Disney"),
    Quote(
        id: 6,
        text: "Don't let yesterday take up too much of today.",
        author: "Will Rogers"),
    Quote(
        id: 7,
        text: "You learn more from failure than from success.",
        author: "Unknown"),
    Quote(
        id: 8,
        text:
            "If you are working on something exciting that you really care about, you don't have to be pushed.",
        author: "Steve Jobs"),
    Quote(
        id: 9,
        text:
            "Success is not final, failure is not fatal: it is the courage to continue that counts.",
        author: "Winston Churchill"),
    Quote(
        id: 10,
        text: "The only impossible journey is the one you never begin.",
        author: "Tony Robbins"),
  ];

  static Random rnd = Random();

  QuoteProvider._privateConstructor();
  static final QuoteProvider instance = QuoteProvider._privateConstructor();

  Future<Quote?> getRandomQuote() async {
    if (_quotes.isEmpty) return null;
    return _quotes[rnd.nextInt(_quotes.length)];
  }

  Future<Quote?> getQuote(int id) async {
    try {
      return _quotes.firstWhere((quote) => quote.id == id);
    } catch (e) {
      return null;
    }
  }
}
