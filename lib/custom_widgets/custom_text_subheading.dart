import 'package:flutter/material.dart';
import 'package:recipe_book/app_constants.dart';

class CustomSubHeading extends StatelessWidget {
  final String subheading;

  CustomSubHeading(this.subheading);

  @override
  Widget build(BuildContext context) {
    return Text(
      subheading.toUpperCase(),
      style: TextStyle(
        color: subheadingColour,
        fontSize: subheadingFontSize,
      ),
    );
  }
}
