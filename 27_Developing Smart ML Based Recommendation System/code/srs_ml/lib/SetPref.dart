// ignore: file_names
// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:srs_ml/SignUp.dart';

class SetPref extends StatefulWidget {
  const SetPref({ Key? key }) : super(key: key);

  @override
  _SetPrefState createState() => _SetPrefState();
}

class _SetPrefState extends State<SetPref> {
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
          child: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: SwitchListTile(
                // ignore: prefer_const_constructors
                title:Text('Party Music'),
                // ignore: prefer_const_constructors
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
                // ignore: prefer_const_constructors
                title:Text('Classical Music'),
                // ignore: prefer_const_constructors
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
        // ignore: prefer_const_constructors
        SizedBox(height: 20),
            Container(
              child: SwitchListTile(
                // ignore: prefer_const_constructors
                title:Text('K-Pop'),
                // ignore: prefer_const_constructors
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
        // ignore: prefer_const_constructors
        SizedBox(height: 20),
            Container(
              child: SwitchListTile(
                // ignore: prefer_const_constructors
                title:Text('Bollywood Hits'),
                // ignore: prefer_const_constructors
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
        // ignore: prefer_const_constructors
        SizedBox(height: 20),
            Container(
              child: SwitchListTile(
                // ignore: prefer_const_constructors
                title:Text('Old is Gold'),
                // ignore: prefer_const_constructors
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
        // ignore: prefer_const_constructors
        SizedBox(height: 20),
            Container(
              child: SwitchListTile(
                // ignore: prefer_const_constructors
                title:Text('Peaceful Music'),
                // ignore: prefer_const_constructors
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
        
          ]

       )
      
          )

        )
            );
  }
}