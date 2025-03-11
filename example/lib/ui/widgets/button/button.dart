import 'package:flutter/material.dart';
import 'package:cndesign_flutter/cndesign_flutter.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('按钮')),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              '主要按钮',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            CnButton(text: '主要按钮', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
