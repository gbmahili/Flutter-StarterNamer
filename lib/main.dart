import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Welcome to Flutter Baraka',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter Baraka M'),
        ),
        body: Center(
          // child: const Text('Hello Mahili'),
          child: Text(wordPair.asPascalCase),
        ),
      ),
    );
  }
}
