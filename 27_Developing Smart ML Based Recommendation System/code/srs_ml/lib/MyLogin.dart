
// ignore_for_file: file_names, prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:srs_ml/MusicDD.dart';
import 'package:srs_ml/Welcome.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  get _formKey => null;
  late String _email,_password;

  

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
                      onPressed: (){Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MusicDD()),
                      );
                      },
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