import 'package:esecure/home_page.dart';
import 'package:flutter/material.dart';
import 'package:esecure/error_handler.dart';
import 'package:esecure/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //Determine if the user is authenticated.
  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else
            return LoginPage();
        });
  }

  //Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  //Sign In
  signIn(String email, String password, context) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((val) {
      print('signed in');
    }).catchError((e) {
      ErrorHandler().errorDialog(context, e);
    });
  }

  //Signup a new user
  signUp(String email, String password) {
    return FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  //Reset Password
  resetPasswordLink(String email) {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
