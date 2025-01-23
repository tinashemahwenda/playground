import 'package:flutter/material.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: AppBar(
        title: Text(
          'Revision Questions',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Center(
            child: Text('Questions here'),
          )
        ],
      ),
    );
  }
}
