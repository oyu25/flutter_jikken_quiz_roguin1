// main.dart
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '辞書アプリ',
      // home: DictionaryScreen(),
    );
  }
}

class jishoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('辞書'),
      ),
      body: DictionaryList(),
    );
  }
}

class DictionaryList extends StatelessWidget {
  final List<String> dictionary = [
    'あ', 'い', 'う', 'え', 'お',
    'か', 'き', 'く', 'け', 'こ',
    // 他の行も同様に続ける
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dictionary.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(dictionary[index]),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(letter: dictionary[index]),
              ),
            );
          },
        );
      },
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String letter;

  DetailScreen({required this.letter});

  // 仮の辞書データ
  final Map<String, String> dictionaryData = {
    'あ': 'あの言葉の意味です。',
    'あ': 'あの言葉',
    'い': 'いい感じの意味です。',
    'う': 'うれしいときの気持ちを表します。',
    'え': '絵の意味です。',
    'お': 'おおきな意味があります。',
    // 他の行も同様に続ける
  };

  String getMeaning() {
    return dictionaryData[letter] ?? '意味が見つかりませんでした。';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(letter),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(getMeaning()),
        ),
      ),
    );
  }
}