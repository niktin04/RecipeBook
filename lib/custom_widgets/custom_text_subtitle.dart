import 'package:flutter/material.dart';
import 'package:recipe_book/app_constants.dart';

class CustomSubTitle extends StatelessWidget {
  final String subtitle;

  CustomSubTitle(this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        subtitle,
        style: TextStyle(
          color: subtitleColour,
          fontSize: subtitleFontSize,
        ),
      ),
    );
  }
}
