import 'package:flutter/material.dart';

const kEmailTextInput = InputDecoration(
  hintText: 'Enter your email',
  contentPadding: EdgeInsets.symmetric(
      vertical: 20.0, horizontal: 20.0),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.pinkAccent, width: 1.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.pinkAccent, width: 2.0),
  ),
);

const kPasswordTextInput = InputDecoration(
  hintText: 'Enter your password',
  contentPadding: EdgeInsets.symmetric(
      vertical: 20.0, horizontal: 20.0),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.pinkAccent, width: 1.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.pinkAccent, width: 2.0),
  ),
);

// const kMessageTextFieldDecoration = InputDecoration(
//   contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//   hintText: 'Type your message here...',
//   border: InputBorder.none,
// );