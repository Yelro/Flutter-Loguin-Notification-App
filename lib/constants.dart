import 'package:flutter/material.dart';

final primaryColor = Colors.blueGrey;

final textFieldDecoration = InputDecoration(
  hintStyle: TextStyle(
    color: primaryColor.withAlpha(96),
    fontSize: 16.0,
  ),
  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: primaryColor, width: 1.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: primaryColor, width: 3.0),
  ),
);
