import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:flutter/material.dart';
import 'package:recipe_book/pages/profile_page.dart';
import 'package:recipe_book/services/error_handler.dart';

import '../pages/home_page.dart';
import '../pages/login_page.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  // Determine if the user is authenticated.
  handleAuth() {
    return StreamBuilder(
      stream: _auth.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return ProfilePage();
        } else {
          return LoginPage();
        }
      },
    );
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Sign in
  signIn(String email, String password, context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  // Sign up a new user
  signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  // Google sign-in
  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final googleAuthCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    await _auth.signInWithCredential(googleAuthCredential);
  }
}
