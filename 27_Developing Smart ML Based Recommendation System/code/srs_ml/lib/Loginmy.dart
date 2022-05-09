// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: prefer_const_constructors, file_names, no_logic_in_create_state, unused_import, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:srs_ml/Welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'SignUp.dart';

class Loginmy extends StatefulWidget {
  const Loginmy({Key? key}) : super(key: key);

  @override
  _LoginmyState createState() => _LoginmyState();
}

// ignore: non_constant_identifier_names
class _LoginmyState extends State<Loginmy> {
  // ignore: unused_field
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _email,_password;

   checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
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
        await _auth.signInWithEmailAndPassword(
            email: _email, password: _password);
      } catch (e) {
       
        print('Error is $e');
      }
    }
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
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
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // ignore: avoid_unnecessary_containers
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
            SizedBox(height:20),
            RichText(
              text: TextSpan(
                text:'Welcome Back',style: TextStyle(fontSize:25.0,fontWeight: FontWeight.bold,
                color:Colors.pink ),
                // ignore: prefer_const_literals_to_create_immutables
                
              )
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
                    // ignore: deprecated_member_use
                    RaisedButton(
                      padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                      onPressed: (){},
                      child: Text('LOGIN',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                      color: Colors.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    )
                  ],
                ),
              ),
            ),
            
          ],
        ),
      ),
    )
      
     
        
        
      
    );
  }
}