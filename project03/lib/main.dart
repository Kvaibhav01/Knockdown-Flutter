import 'package:flutter/material.dart';

void main(){
  final appBarColor = const Color(0xFFd2527f);
  final bgColor = const Color(0xFFe4e9ed);
  final fabIconColor = const Color(0xFF000000);
  var app = MaterialApp(
    home: Scaffold(
      // Add FAB
      floatingActionButton: FloatingActionButton(
        // Using custom color for FAB
        backgroundColor: appBarColor,
        // Add icon to FAB and override default color
        child: Icon(Icons.polymer, color: fabIconColor,),
        onPressed: (){}
        ),
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        // Add a title
        title: Text('Third Knockdown'),
      ),
    ),
  );
  runApp(app);
}



