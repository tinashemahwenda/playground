import 'package:flutter/material.dart';
import 'package:playground/homepage.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  final _formKey = GlobalKey<FormState>;
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  bool _isFormVisible = true;
  String _existingName = '';

  @override
  Widget build(BuildContext context) {
    if (_isFormVisible) {
      return Form(child: Column());
    } else {
      return HomePage();
    }
  }
}
