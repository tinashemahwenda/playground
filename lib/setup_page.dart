import 'package:flutter/material.dart';
import 'package:playground/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  bool _isFormVisible = true;
  String _existingName = '';

  @override
  void initState() {
    super.initState();
    _checkExistingName();
  }

  _checkExistingName() async {
    final prefs = await SharedPreferences.getInstance();
    final existingName = prefs.getString('name');
    if (existingName != null) {
      setState(() {
        _existingName = existingName;
        _isFormVisible = false;
      });
    }
  }

  saveNameAndPhone() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', _nameController.text);
    prefs.setString('phoneNumber', _phoneNumberController.text);
  }

  @override
  Widget build(BuildContext context) {
    if (_isFormVisible) {
      return Form(
          key: _formKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      label: Text('Name'),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _phoneNumberController,
                    decoration: InputDecoration(
                      label: Text('Phone Number'),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        saveNameAndPhone();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      }
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                  ),
                ],
              ),
            ),
          ));
    } else {
      return HomePage();
    }
  }
}
