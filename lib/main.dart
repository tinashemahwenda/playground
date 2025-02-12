import 'package:flutter/material.dart';
import 'package:playground/digital_clock.dart';

void main() {
  runApp(PlayGround());
}

class PlayGround extends StatelessWidget {
  const PlayGround({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //backgroundColor: Colors.black,
        body: DigitalClock(),
      ),
    );
  }
}
