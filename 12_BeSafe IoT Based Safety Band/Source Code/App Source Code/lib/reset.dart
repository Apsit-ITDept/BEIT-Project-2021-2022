import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:esecure/services/authservice.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final formKey = new GlobalKey<FormState>();

  late String email;

  Color purpleColor = Colors.purple.shade700;

  //To check fields during submit
  checkFields() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  //To Validate email
  validateEmail(String value) {
    EmailValidator.validate(email);
  }
  /* String? validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Form(key: formKey, child: _buildResetForm())));
  }

  _buildResetForm() {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: ListView(children: [
          SizedBox(height: 75.0),
          Container(
              height: 125.0,
              width: 200.0,
              child: Stack(
                children: [
                  Text('reset',
                      style: TextStyle(fontFamily: 'Trueno', fontSize: 60.0)),
                  //Dot placement
                  Positioned(
                      top: 47.0,
                      left: 160.0,
                      child: Container(
                          height: 10.0,
                          width: 10.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: purpleColor)))
                ],
              )),
          SizedBox(height: 25.0),
          TextFormField(
              decoration: InputDecoration(
                  labelText: 'EMAIL',
                  labelStyle: TextStyle(
                      fontFamily: 'Trueno',
                      fontSize: 12.0,
                      color: Colors.grey.withOpacity(0.5)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: purpleColor),
                  )),
              onChanged: (value) {
                this.email = value;
              },
              validator: (value) =>
                  value!.isEmpty ? 'Email is required' : validateEmail(value)),
          SizedBox(height: 50.0),
          GestureDetector(
            onTap: () {
              if (checkFields()) AuthService().resetPasswordLink(email);
              Navigator.of(context).pop();
            },
            child: Container(
                height: 50.0,
                child: Material(
                    borderRadius: BorderRadius.circular(25.0),
                    shadowColor: Colors.purpleAccent,
                    color: purpleColor,
                    elevation: 7.0,
                    child: Center(
                        child: Text('RESET',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Trueno'))))),
          ),
          SizedBox(height: 20.0),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text('Go back',
                    style: TextStyle(
                        color: purpleColor,
                        fontFamily: 'Trueno',
                        decoration: TextDecoration.underline)))
          ])
        ]));
  }
}
