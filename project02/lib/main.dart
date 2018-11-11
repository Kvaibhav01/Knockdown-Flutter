import 'package:flutter/material.dart';

void main(){
  // Declare the AppBar color
  final appBarColor = const Color(0xFFd2527f);
  // Declare the background color for Scaffold
  final bgColor = const Color(0xFFe4e9ed);
  var app = MaterialApp(
    // Create a Scaffold
    home: Scaffold(
      // Apply the bgColor
      backgroundColor: bgColor,
      // Create an AppBar
      appBar: AppBar(
        // Apply the AppBar color
        backgroundColor: appBarColor,
      ),
    ),
  );
  runApp(app);
}



