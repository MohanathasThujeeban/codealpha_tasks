import 'dart:io';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:quotes_generator/quote.dart';
import 'package:sqflite/sqflite.dart';

class QuoteProvider {
  static Database? _db;
  final String _dbName = 'quotes.db';
  static Random rnd = Random();

  QuoteProvider._privateConstructor();
  static final QuoteProvider instance = QuoteProvider._privateConstructor();

  Future<Database> get database async {
    if (_db != null) return _db!;

    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, _dbName);

    ByteData data = await rootBundle.load(join("assets", _dbName));
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(path).writeAsBytes(bytes);

    _db = await openDatabase(path);
    return _db!;
  }

  Future<Quote?> getRandomQuote() async {
    return await getQuote(rnd.nextInt(1642) + 1);
  }

  Future<Quote?> getQuote(int id) async {
    Database db = await database;
    List<Map<String, dynamic>> maps =
        await db.rawQuery("select * from quotes where id=$id");

    if (maps.isNotEmpty) {
      return Quote.fromMap(maps.first);
    }
    return null;
  }
}
