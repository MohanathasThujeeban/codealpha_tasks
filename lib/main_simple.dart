import 'package:flutter/material.dart';
import 'package:quotes_generator/simple_home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote Generator',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: SimpleHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
