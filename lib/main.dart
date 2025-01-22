import 'package:flutter/material.dart';
import 'package:playground/homepage.dart';

void main() {
  runApp(PlayGround());
}

class PlayGround extends StatelessWidget {
  const PlayGround({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
