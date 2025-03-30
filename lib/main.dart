import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(LifeOSApp());
}

class LifeOSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LifeOS 選號儀式',
      theme: ThemeData.dark(),
      home: NumberDrawPage(),
    );
  }
}

class NumberDrawPage extends StatefulWidget {
  @override
  _NumberDrawPageState createState() => _NumberDrawPageState();
}

class _NumberDrawPageState extends State<NumberDrawPage> {
  List<int> numbers = [];
  String luckyMessage = '';

  void generateNumbers() {
    final rand = Random();
    final allNumbers = List.generate(39, (i) => i + 1);
    allNumbers.shuffle(rand);
    setState(() {
      numbers = allNumbers.sublist(0, 5)..sort();
      luckyMessage = luckyMessages[rand.nextInt(luckyMessages.length)];
    });
  }

  final List<String> luckyMessages = [
    '今日吉星高照，心之所願皆成真。',
    '風起雲湧之時，便是轉機降臨之刻。',
    '靜守初心，機運自至。',
    '與其等待天命，不如成為命運。',
    '宇宙聆聽願望，今日正是種下夢想的時機。'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('今日選號儀式')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '今日幸運號碼',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 12,
              children: numbers
                  .map((num) => CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.orangeAccent,
                        child: Text(
                          num.toString().padLeft(2, '0'),
                          style: TextStyle(fontSize: 20),
                        ),
                      ))
                  .toList(),
            ),
            SizedBox(height: 30),
            Text(
              luckyMessage,
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: generateNumbers,
              child: Text('啟動選號儀式'),
            )
          ],
        ),
      ),
    );
  }
}
