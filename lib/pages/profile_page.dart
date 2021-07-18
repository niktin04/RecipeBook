import 'package:flutter/material.dart';

import 'package:recipe_book/custom_widgets/custom_text_title.dart';
import 'package:recipe_book/custom_widgets/custom_text_subtitle.dart';

import 'package:recipe_book/services/auth_service.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 24.0,
            ),
            CircleAvatar(
              radius: 120.0,
              backgroundImage: NetworkImage(
                  "https://i.pinimg.com/1200x/19/40/d5/1940d507f821565e93d507a548e0e11b.jpg"),
            ),
            new CustomTitle("Nitin Prakash"),
            new CustomSubTitle("Co-founder & Chief Product Officer"),
            ElevatedButton(
              onPressed: () {
                AuthService().signOut();
              },
              child: Text("LogOut"),
            ),
          ],
        ),
      ),
    );
  }
}
