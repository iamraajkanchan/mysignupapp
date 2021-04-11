import 'package:flutter/material.dart';
import 'package:mysignupapp/signup_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'User Details App',
    theme: ThemeData.dark(),
    home: SignUpPage(),
  ));
}