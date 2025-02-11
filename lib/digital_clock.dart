import 'dart:async';
import 'package:flutter/material.dart';

class DigitalClock extends StatefulWidget {
  const DigitalClock({super.key});

  @override
  State<DigitalClock> createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  late String _timeString;
  late Timer _timer;
  late int _seconds;
  late int hoursLeft;
  late int minutesLeft;

  @override
  void initState() {
    super.initState();
    _updateTime();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _updateTime());
  }

  void _updateTime() {
    final now = DateTime.now();
    setState(() {
      _timeString = "${now.hour.toString().padLeft(2, '0')}:"
          "${now.minute.toString().padLeft(2, '0')}";
      _seconds = now.second;
      hoursLeft = 24 - now.hour;
      minutesLeft = 60 - now.minute;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
          _timeString,
          style: TextStyle(
            fontSize: 100,
            fontFamily: 'Led-Font',
            color: Colors.white,
          ),
        )),
        SizedBox(
          height: 100,
        ),
        SizedBox(
          width: 200,
          child: LinearProgressIndicator(
            value: _seconds / 60,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            backgroundColor: Colors.white24,
            borderRadius: BorderRadius.circular(40),
            minHeight: 5,
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Time remaining today: ${hoursLeft.toString()} hours & ${minutesLeft.toString()} minutes',
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
