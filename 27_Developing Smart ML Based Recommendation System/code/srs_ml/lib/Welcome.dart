// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_signin_button/flutter_signin_button.dart';
// ignore: unused_import

import 'package:srs_ml/SignIn.dart';

import 'MyLogin.dart';

// ignore: use_key_in_widget_constructors
class Welcome extends StatefulWidget {

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(
          
          children: <Widget> 
          [
            SizedBox(height:45.0),
            // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
            Container(
              height: 300,
              child: Image(image: AssetImage("images/Welcome.JPG"),
              fit: BoxFit.contain,
              ),
            ),
            SizedBox(height:20),
            RichText(
              text: TextSpan(
                text:'Welcome to Music App',style: TextStyle(fontSize:25.0,fontWeight: FontWeight.bold,
                color:Colors.pink),
                // ignore: prefer_const_literals_to_create_immutables
                
              )
            ),
            SizedBox(height:10.0),
            Text('Let go world on!',style: TextStyle(color:Colors.pink),),
            SizedBox(height:30.0),


            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                // ignore: deprecated_member_use
                RaisedButton(
                  padding:EdgeInsets.only(left:30,right:30),
                  onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyLogin()),
                      );
                        },
                  child: Text('Login',style: TextStyle(
                    fontSize: 20,
                    fontWeight:FontWeight.bold,
                    color:Colors.white,
                  ),),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    
                  ),
                  color:Colors.pink
                  ),
                  SizedBox(width:20.0),
                  // ignore: deprecated_member_use
                  RaisedButton(
                   padding:EdgeInsets.only(left:30,right:30),
                  onPressed: (){Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                      );
                      },
                  
                  child: Text('Sign Up!',style: TextStyle(
                    fontSize: 20,
                    fontWeight:FontWeight.bold,
                    color:Colors.white,
                  ),),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    
                  ),
                  color:Colors.pink
                  ),
                  SizedBox(height: 30.0),

                  
              ],
            ),
            SignInButton(
                    Buttons.Google,
                       text: "Sign up with Google",
                        onPressed: (){Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                      );
                      },
              )
            
          ],
          ),
      ),
      
    );
  }
}