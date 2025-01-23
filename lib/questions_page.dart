import 'package:flutter/material.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  final List<Map<String, dynamic>> questions = [
    {'year': 2020, 'paperNumber': 1, 'body': 'Question 1 from 2020'},
    {'year': 2020, 'paperNumber': 2, 'body': 'Question 1 from 2020'},
    {'year': 2021, 'paperNumber': 1, 'body': 'Question 1 from 2021'},
    {'year': 2021, 'paperNumber': 2, 'body': 'Question 1 from 2021'},
    {'year': 2022, 'paperNumber': 1, 'body': 'Question 1 from 2022'}
  ];

  String selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredQuestions = selectedFilter == 'All'
        ? questions
        : questions
            .where((q) => q['year'].toString() == selectedFilter)
            .toList();
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
