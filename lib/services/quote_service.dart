import 'dart:math';
import '../models/quote_model.dart';

class QuoteService {
  static final QuoteService _instance = QuoteService._internal();
  factory QuoteService() => _instance;
  QuoteService._internal();

  final Random _random = Random();

  // Comprehensive collection of inspiring quotes with categories
  final List<Quote> _quotes = [
    // Motivational
    Quote(
      id: 1,
      text: "The only way to do great work is to love what you do.",
      author: "Steve Jobs",
      category: "Motivational",
      tags: ["work", "passion", "success"],
      createdAt: DateTime.now(),
    ),
    Quote(
      id: 2,
      text: "Innovation distinguishes between a leader and a follower.",
      author: "Steve Jobs",
      category: "Innovation",
      tags: ["leadership", "innovation", "technology"],
      createdAt: DateTime.now(),
    ),
    Quote(
      id: 3,
      text:
          "The future belongs to those who believe in the beauty of their dreams.",
      author: "Eleanor Roosevelt",
      category: "Dreams",
      tags: ["future", "dreams", "belief"],
      createdAt: DateTime.now(),
    ),
    Quote(
      id: 4,
      text:
          "Success is not final, failure is not fatal: it is the courage to continue that counts.",
      author: "Winston Churchill",
      category: "Success",
      tags: ["success", "failure", "courage", "perseverance"],
      createdAt: DateTime.now(),
    ),
    Quote(
      id: 5,
      text: "The way to get started is to quit talking and begin doing.",
      author: "Walt Disney",
      category: "Action",
      tags: ["action", "start", "doing"],
      createdAt: DateTime.now(),
    ),
    Quote(
      id: 6,
      text: "Life is what happens when you're busy making other plans.",
      author: "John Lennon",
      category: "Life",
      tags: ["life", "planning", "present"],
      createdAt: DateTime.now(),
    ),
    Quote(
      id: 7,
      text:
          "It is during our darkest moments that we must focus to see the light.",
      author: "Aristotle",
      category: "Hope",
      tags: ["hope", "darkness", "light", "focus"],
      createdAt: DateTime.now(),
    ),
    Quote(
      id: 8,
      text: "Believe you can and you're halfway there.",
      author: "Theodore Roosevelt",
      category: "Belief",
      tags: ["belief", "confidence", "achievement"],
      createdAt: DateTime.now(),
    ),
    Quote(
      id: 9,
      text: "The only impossible journey is the one you never begin.",
      author: "Tony Robbins",
      category: "Journey",
      tags: ["journey", "beginning", "possibility"],
      createdAt: DateTime.now(),
    ),
    Quote(
      id: 10,
      text: "In the middle of difficulty lies opportunity.",
      author: "Albert Einstein",
      category: "Opportunity",
      tags: ["opportunity", "difficulty", "challenges"],
      createdAt: DateTime.now(),
    ),
    Quote(
      id: 11,
      text: "Your time is limited, don't waste it living someone else's life.",
      author: "Steve Jobs",
      category: "Authenticity",
      tags: ["time", "authenticity", "individuality"],
      createdAt: DateTime.now(),
    ),
    Quote(
      id: 12,
      text: "Be yourself; everyone else is already taken.",
      author: "Oscar Wilde",
      category: "Authenticity",
      tags: ["authenticity", "uniqueness", "individuality"],
      createdAt: DateTime.now(),
    ),
    Quote(
      id: 13,
      text:
          "Two things are infinite: the universe and human stupidity; and I'm not sure about the universe.",
      author: "Albert Einstein",
      category: "Wisdom",
      tags: ["wisdom", "humor", "universe"],
      createdAt: DateTime.now(),
    ),
    Quote(
      id: 14,
      text:
          "The best time to plant a tree was 20 years ago. The second best time is now.",
      author: "Chinese Proverb",
      category: "Action",
      tags: ["action", "timing", "start"],
      createdAt: DateTime.now(),
    ),
    Quote(
      id: 15,
      text: "You miss 100% of the shots you don't take.",
      author: "Wayne Gretzky",
      category: "Opportunity",
      tags: ["opportunity", "action", "risk"],
      createdAt: DateTime.now(),
    ),
    Quote(
      id: 16,
      text: "Whether you think you can or you think you can't, you're right.",
      author: "Henry Ford",
      category: "Mindset",
      tags: ["mindset", "belief", "attitude"],
      createdAt: DateTime.now(),
    ),
    Quote(
      id: 17,
      text:
          "The only person you are destined to become is the person you decide to be.",
      author: "Ralph Waldo Emerson",
      category: "Self-Development",
      tags: ["self-development", "destiny", "choice"],
      createdAt: DateTime.now(),
    ),
    Quote(
      id: 18,
      text: "Don't watch the clock; do what it does. Keep going.",
      author: "Sam Levenson",
      category: "Persistence",
      tags: ["persistence", "time", "action"],
      createdAt: DateTime.now(),
    ),
    Quote(
      id: 19,
      text: "Everything you've ever wanted is on the other side of fear.",
      author: "George Addair",
      category: "Fear",
      tags: ["fear", "courage", "goals"],
      createdAt: DateTime.now(),
    ),
    Quote(
      id: 20,
      text:
          "The greatest glory in living lies not in never falling, but in rising every time we fall.",
      author: "Nelson Mandela",
      category: "Resilience",
      tags: ["resilience", "failure", "recovery"],
      createdAt: DateTime.now(),
    ),
  ];

  List<Quote> get allQuotes => List.unmodifiable(_quotes);

  List<String> get categories =>
      _quotes.map((quote) => quote.category).toSet().toList()..sort();

  List<String> get allTags =>
      _quotes.expand((quote) => quote.tags).toSet().toList()..sort();

  Quote getRandomQuote() {
    return _quotes[_random.nextInt(_quotes.length)];
  }

  Quote? getQuoteById(int id) {
    try {
      return _quotes.firstWhere((quote) => quote.id == id);
    } catch (e) {
      return null;
    }
  }

  List<Quote> getQuotesByCategory(String category) {
    return _quotes.where((quote) => quote.category == category).toList();
  }

  List<Quote> getQuotesByTag(String tag) {
    return _quotes.where((quote) => quote.tags.contains(tag)).toList();
  }

  List<Quote> searchQuotes(String query) {
    final lowercaseQuery = query.toLowerCase();
    return _quotes.where((quote) {
      return quote.text.toLowerCase().contains(lowercaseQuery) ||
          quote.author.toLowerCase().contains(lowercaseQuery) ||
          quote.category.toLowerCase().contains(lowercaseQuery) ||
          quote.tags.any((tag) => tag.toLowerCase().contains(lowercaseQuery));
    }).toList();
  }

  List<Quote> getFavoriteQuotes(List<int> favoriteIds) {
    return _quotes.where((quote) => favoriteIds.contains(quote.id)).toList();
  }
}
