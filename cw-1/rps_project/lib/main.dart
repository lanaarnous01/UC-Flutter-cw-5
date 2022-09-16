import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var hand1 = 1;

  var hand2 = 1;

  var draw = 'Draw';

  var wins = 'Wins';

  var lost = 'Better Luck next time';

  void go() {
    hand1 = Random().nextInt(3) + 1;
    hand2 = Random().nextInt(3) + 1;
    setState(() {});
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text('Rock Paper Scissors Shoot'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                go();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Image.asset(
                      'assets/i_$hand1.png',
                      height: 120,
                      width: 120,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Image.asset(
                      'assets/i_$hand2.png',
                      height: 120,
                      width: 120,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 80),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Text('Player 1'),
                ),
                Container(
                  padding: EdgeInsets.only(top: 80),
                ),
                Container(
                  padding: EdgeInsets.only(left: 100),
                  child: Text('Player 2'),
                ),
              ],
            ),
            Container(
              height: 70,
            ),
            Container(
                height: 60,
                width: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                  ),
                  onPressed: () {
                    go();
                  },
                  child: Text('Go'),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                ),
                if (hand1 == hand2)
                  Text('$draw', style: TextStyle(fontSize: 20)),
                if (hand1 > hand2)
                  Text('Hand 1 $wins    --    Hand 2 $lost',
                      style: TextStyle(fontSize: 20)),
                if (hand1 < hand2)
                  Text(
                    'Hand 2 $wins    --    Hand 1 $lost',
                    style: TextStyle(fontSize: 20),
                  ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
