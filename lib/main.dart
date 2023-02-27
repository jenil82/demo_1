import 'package:flutter/material.dart';
import 'add.dart';
import 'detail.dart';
import 'homepage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Home(),
        'add': (context) => Add(),
        'detail': (context) => Detail(),
      },
    ),
  );
}