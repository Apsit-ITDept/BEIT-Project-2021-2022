// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: avoid_unnecessary_containers, deprecated_member_use, prefer_const_constructors, file_names, prefer_typing_uninitialized_variables, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:srs_ml/SignIn.dart';





// ignore: use_key_in_widget_constructors
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _email, _password;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        // ignore: avoid_print
        print(user);

        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // ignore: unnecessary_this
    this.checkAuthentification();
  }

  login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        // ignore: unused_local_variable
        UserCredential user =await _auth.signInWithEmailAndPassword(
            email: _email, password: _password);
      } catch (e) {
        // ignore: unused_local_variable
        var msg='Error';
        // ignore: unused_label
        
        // ignore: unused_element
        showError(String errormessage) {
          // ignore: avoid_print
          print('Error message');
        }
       
      }
    }
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        // ignore: duplicate_ignore
        builder: (BuildContext context) {
          // ignore: duplicate_ignore, duplicate_ignore
          return AlertDialog(
            // ignore: prefer_const_constructors
            title: Text('ERROR'),
            content: Text(errormessage),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  navigateToSignUp() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
        child: Container(
        child: Column(
          children: <Widget>[
            // ignore: sized_box_for_whitespace
            Container(
              height: 400,
              child: Image(
                image: AssetImage("images/login.jpg"),
                fit: BoxFit.contain,
              ),
            ),
            Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: TextFormField(
                          validator: (input) {
                            if (input!.isEmpty) return 'Enter Email';
                          },
                          decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email)),
                          onSaved: (input) => _email = input!),
                    ),
                    Container(
                      child: TextFormField(
                          validator: (input) {
                            if (input!.length < 6)
                              // ignore: curly_braces_in_flow_control_structures
                              return 'Provide Minimum 6 Character';
                          },
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                          ),
                          obscureText: true,
                          onSaved: (input) => _password = input!),
                    ),
                    SizedBox(height: 20),
                    RaisedButton(
                      padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                      onPressed: login,
                      child: Text('LOGIN',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                      color: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              child: Text('Create an Account?'),
              onTap: navigateToSignUp,
            )
          ],
        ),
      ),
    )
    );


  }
}