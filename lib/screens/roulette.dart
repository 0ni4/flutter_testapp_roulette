import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

//ここからルーレットアプリの内部です
class RouletteApp extends StatefulWidget {
  static const routeName = '/roulette_page';
  final String? one;
  final String? two;
  final String? three;

  const RouletteApp({
    Key? key,
    this.one,
    this.two,
    this.three,
  }) : super(key: key);

  @override
  _RouletteAppState createState() => _RouletteAppState();
}

class _RouletteAppState extends State<RouletteApp> {
  StreamController<int> selected = StreamController<int>();

//streamControllerを作ります　後述

  @override
  Widget build(BuildContext context) {
    final items = [
       widget.one,
       widget.two,
       widget.three,
    ];
//ルーレットに入れるアイテムを定義しています。

    return Scaffold(
      appBar: AppBar(
        title: const Text('ルーレット'),
      ),
//ここから見た目の記述ですね
      body: GestureDetector(
        onTap: () {
//タップすると以下が動作します
          setState(() {
//setStateはウィジェットを再構築するものです
//何回でもクリックするとルーレットが回るようにしています
            selected.add(
              Fortune.randomInt(0, items.length),
            );
          });
        },
        child: Column(
          children: [
            Expanded(
              child: FortuneWheel(
                selected: selected.stream,
                items: [
                  for (var it in items) FortuneItem(child: Text(it!)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}