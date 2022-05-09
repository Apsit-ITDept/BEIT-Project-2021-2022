// ignore: file_names
// ignore_for_file: file_names, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:srs_ml/SetPref.dart';
class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
  
}

// ignore: non_constant_identifier_names
class _SignUpState extends State<SignUp> {
 final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _name, _email, _password;

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

  signUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
            email: _email, password: _password);
        if (user != null) {
          // UserUpdateInfo updateuser = UserUpdateInfo();
          // updateuser.displayName = _name;
          //  user.updateProfile(updateuser);
          await _auth.currentUser!.updateProfile(displayName: _name);
          // await Navigator.pushReplacementNamed(context,"/") ;

        }
      } catch (e) {
        
        print('This is error $e');
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
                image: AssetImage("images/Cover.jpg"),
                fit: BoxFit.contain,
                
                
              ),
            ),
            SizedBox(height:20),
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text:'Create Your Account!',style: TextStyle(fontSize:25.0,fontWeight: FontWeight.bold,
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
                            if (input!.isEmpty) return 'Enter Your Name';
                          },
                          decoration: const InputDecoration(
                              labelText: 'Name',
                              prefixIcon: Icon(Icons.person),
                          ),
                          onSaved: (input) => _name = input!),
                    ),

                    Container(
                      
                      
                      child: TextFormField(
                          validator: (input) {
                            if (input!.isEmpty) return 'Enter Email';
                          },
                          decoration: const InputDecoration(
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
                      onPressed:() {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SetPref()),
                      );
                      },
                      
                      child: Text('Next>>',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                      color: Colors.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    SizedBox(height:20),
            
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