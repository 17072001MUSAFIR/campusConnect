import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '', _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (input) {
                  if (input?.isEmpty ?? true) {
                    return 'Please enter an email';
                  }
                  return null;
                },
                onSaved: (input) => {if (input != null) _email = input},
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                validator: (input) {
                  if (input?.isEmpty ?? true) {
                    return 'Please enter a password';
                  }
                  return null;
                },
                onSaved: (input) => {if (input != null) _password = input},
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(width: 16.0),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print(_email);
      print(_password);
    }
  }
}
