import 'package:esecure/reset.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  Color purpleColor = Colors.purple.shade700;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Settings',
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Trueno',
            ),
          ),
          backgroundColor: purpleColor,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ResetPassword()));
                  },
                  child: Container(
                      height: 50.0,
                      width: 300.0,
                      child: Material(
                          borderRadius: BorderRadius.circular(25.0),
                          shadowColor: Colors.purpleAccent,
                          color: purpleColor,
                          elevation: 7.0,
                          child: Center(
                              child: Text('Reset Password',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Trueno'))))),
                ),
              ),
            ],
          ),
        ));
  }
}
