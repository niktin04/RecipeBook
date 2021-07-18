import 'dart:ui';

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color bgColour;

  const CustomAppBar({Key? key, required this.title, required this.bgColour})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(58.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      title: Text(title),
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: Colors.black,
                ),
                height: 10.0,
                width: 80.0,
                child: Center(
                  child: Text(
                    'Add item',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )),
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/image.jpg'),
                foregroundImage: AssetImage('assets/images/image.jpg'),
              ),
            )),
      ],
    );
  }
}
