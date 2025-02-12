import 'package:flutter/material.dart';

import 'package:playground/image_homepage.dart';

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
        body: SafeArea(child: ImageHomepage()),
      ),
    );
  }
}
