// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names, prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:srs_ml/MyLogin.dart';
class SignIn extends StatefulWidget {
  const SignIn({ Key? key }) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
  
}

class _SignInState extends State<SignIn> {
  get _formKey => null;
  late String _name, _email, _password;
  var _value = false;
  var _value1 = false;
  var _value2 = false;
  var _value3 = false;
  var _value4 = false;
  var _value5 = false;
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
                    RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text:'Set Your Preferences Here!',style: TextStyle(fontSize:25.0,fontWeight: FontWeight.bold,
                color:Colors.pink ),
                // ignore: prefer_const_literals_to_create_immutables
                
              )
            ),
            SizedBox(height: 20),
            Container(
              child: SwitchListTile(
                title:Text('Party Music'),
                subtitle:Text('Will recommend Party Music'),
                activeColor: Colors.pink,
                value: _value,
                onChanged: (value){
                  setState(() {
                    _value=value;
                  });
                },
                )
        ),

        SizedBox(height: 20),
            Container(
              child: SwitchListTile(
                title:Text('Classical Music'),
                subtitle:Text('Will recommend Classical Music'),
                activeColor: Colors.pink,
                value: _value2,
                onChanged: (value){
                  setState(() {
                    _value2=value;
                  });
                },
                )
        ),
        SizedBox(height: 20),
            Container(
              child: SwitchListTile(
                title:Text('K-Pop'),
                subtitle:Text('Will recommend K-Pop Music'),
                activeColor: Colors.pink,
                value: _value3,
                onChanged: (value){
                  setState(() {
                    _value3=value;
                  });
                },
                )
        ),
        SizedBox(height: 20),
            Container(
              child: SwitchListTile(
                title:Text('Bollywood Hits'),
                subtitle:Text('Will recommend Bollywood Hits'),
                activeColor: Colors.pink,
                value: _value4,
                onChanged: (value){
                  setState(() {
                    _value4=value;
                  });
                },
                )
        ),
        SizedBox(height: 20),
            Container(
              child: SwitchListTile(
                title:Text('Old is Gold'),
                subtitle:Text('Will recommend Old Music'),
                activeColor: Colors.pink,
                value: _value1,
                onChanged: (value){
                  setState(() {
                    _value1=value;
                  });
                },
                )
        ),
        SizedBox(height: 20),
            Container(
              child: SwitchListTile(
                title:Text('Peaceful Music'),
                subtitle:Text('Will recommend Silent peaceful music'),
                activeColor: Colors.pink,
                value: _value5,
                onChanged: (value){
                  setState(() {
                    _value5=value;
                  });
                },
                )
        ),
                    // ignore: deprecated_member_use
                    RaisedButton(
                      padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                      onPressed: (){Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyLogin()),
                      );
                      },
                      child: Text('Create!',
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