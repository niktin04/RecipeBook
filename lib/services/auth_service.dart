import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe_book/services/error_handler.dart';

import '../home_page.dart';
import '../login_page.dart';

class AuthService {
  // Determine if the user is authenticated.
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return LoginPage();
        }
      },
    );
  }

  // Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  // Sign in
  signIn(String email, String password, context) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((val) {
      print("Sign in");
    }).catchError((e) {
      ErrorHandler().errorDialog(context, e);
    });
  }

  // Sign up a new user
  signUp(String email, String password) {
    return FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }
}
