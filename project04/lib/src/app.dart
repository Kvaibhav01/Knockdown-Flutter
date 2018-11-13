import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final appBarColor = const Color(0xFFd2527f);
  final bgColor = const Color(0xFFe4e9ed);
  final fabIconColor = const Color(0xFF000000);
  // Use a Widget inside StatelessWidget and pass its context
  Widget build(context) {
    // Return what we want to display (which was earlier in main.dart file)
    return MaterialApp(
    home: Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: appBarColor,
        child: Icon(Icons.polymer, color: fabIconColor,),
        onPressed: (){}
        ),
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text('Third Knockdown'),
      ),
    ),
  );
  }
}