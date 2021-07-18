import 'package:flutter/material.dart';
import 'package:recipe_book/app_constants.dart';

class CustomTitle extends StatelessWidget {
  final String title;

  CustomTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 4.0),
      child: Text(
        title,
        style: TextStyle(
          color: titleColour,
          fontSize: titleFontSize,
          fontFamily: titleFontFamily,
        ),
      ),
    );
  }
}
