import 'package:flutter/material.dart';
import 'package:recipe_book/services/auth_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("You are logged in."),
          ElevatedButton(
            onPressed: () {
              AuthService().signOut();
            },
            child: Text("Log Out!"),
          )
        ],
      ),
    );
  }
}