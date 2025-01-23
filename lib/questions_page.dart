import 'package:flutter/material.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  final List<Map<String, dynamic>> questions = [
    {'year': 2020, 'paperNumber': 1, 'body': 'Question 1 from 2020'},
    {'year': 2020, 'paperNumber': 2, 'body': 'Question 2 from 2020'},
    {'year': 2021, 'paperNumber': 1, 'body': 'Question 1 from 2021'},
    {'year': 2021, 'paperNumber': 2, 'body': 'Question 2 from 2021'},
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

    List<String> filterOptions = [
      'All',
      ...questions.map((q) => q['year'].toString()).toSet().toList(),
    ];
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
          Row(
            children: filterOptions.map((filter) {
              return Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedFilter == filter
                          ? Colors.blue
                          : Colors.grey[200],
                    ),
                    child: Text(filter)),
              );
            }).toList(),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: filteredQuestions.length,
                  itemBuilder: (context, index) {
                    final question = filteredQuestions[index];
                    return ListTile(
                      title: Text('Year ${question['year']}'),
                      subtitle: Text(
                          'Paper ${question['paperNumber']} : ${question['body']}'),
                    );
                  }))
        ],
      ),
    );
  }
}
