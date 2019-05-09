import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Welcome to Flutter Baraka',
  //     home: Scaffold(
  //       appBar: AppBar(
  //         title: Text('Welcome to Flutter Baraka M'),
  //       ),
  //       body: Center(
  //         // child: const Text('Hello Mahili'),
  //         // child: Text(wordPair.asPascalCase),
  //         child: RandomWords(),
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  // 1. create an empty list (array)
  final List<WordPair> _suggestions = <WordPair>[];

  // 2. create a variable to hold font size
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);

  // 3.  Create a widget (a component) that will return a layout)
  @override
  Widget build(BuildContext context) {
    // final WordPair wordPair = WordPair.random();
    // return Text(wordPair.asPascalCase);
    // 3.a. Layout has a title and a body
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      // The body is calling another method to build its body...returning a component in React
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        // The itemBuilder callback is called once per suggested
        // word pairing, and places each suggestion into a ListTile
        // row. For even rows, the function adds a ListTile row for
        // the word pairing. For odd rows, the function adds a
        // Divider widget to visually separate the entries. Note that
        // the divider may be difficult to see on smaller devices.
        itemBuilder: (BuildContext _context, int i) {
          // Add a one-pixel-high divider widget before each row
          // in the ListView.
          if (i.isOdd) {
            return Divider();
          }

          // The syntax "i ~/ 2" divides i by 2 and returns an
          // integer result.
          // For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2.
          // This calculates the actual number of word pairings
          // in the ListView,minus the divider widgets.
          final int index = i ~/ 2;
          // If you've reached the end of the available word
          // pairings...
          if (index >= _suggestions.length) {
            // ...then generate 10 more and add them to the
            // suggestions list.
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}
