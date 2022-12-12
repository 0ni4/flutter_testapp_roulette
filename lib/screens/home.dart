import 'package:flutter/material.dart';
import 'package:myapp1/screens/roulette.dart';

class MenuPage extends StatelessWidget {
  static const routeName = '/';
  MenuPage({super.key});

  final oneController = TextEditingController();
  final twoController = TextEditingController();
  final threeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing Sample'),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
                controller: oneController,
                decoration: InputDecoration(
                  hintText: '1つめ',
                )
            ),
            TextField(
                controller: twoController,
                decoration: InputDecoration(
                  hintText: '2つめ',
                )
            ),
            TextField(
                controller: threeController,
                decoration: InputDecoration(
                  hintText: '3つめ',
                )
            ),
            ElevatedButton(
              onPressed: (){
                final _one = oneController.text;
                final _two = twoController.text;
                final _three = threeController.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RouletteApp(
                      one: _one,
                      two: _two,
                      three: _three,
                    ),
                  ),
                );
              },
              child: Text(
                  'GO Roulette'
              ),

            )
          ],
        ),
      ),

    );
  }
}