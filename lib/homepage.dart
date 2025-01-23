import 'package:flutter/material.dart';
import 'package:playground/questions_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _value = 0;
  String _name = '';

  @override
  void initState() {
    super.initState();
    _loadCounter();
    _loadProfileData();
  }

  _loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name');
    setState(() {
      _name = name!;
    });
  }

  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _value = (prefs.getInt('counter') ?? 0);
    });
  }

  void _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _value = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _value);
    });
  }

  void _decrementCounter() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _value = (prefs.getInt('counter') ?? 0) - 1;
      prefs.setInt('counter', _value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Counter in SharedPrefs',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome Back, ${_name.toUpperCase()}'),
          Center(
            child: Text(
              '$_value',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              ElevatedButton(
                onPressed: _incrementCounter,
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blue)),
              ),
              ElevatedButton(
                onPressed: _decrementCounter,
                child: Text(
                  'Subtract',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blue)),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QuestionsPage())),
                child: Text(
                  'Questions',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blue)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
