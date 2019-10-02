import 'package:flutter/material.dart';
import 'Screens/ReadingList.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reading List',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: ReadingList(),
    );
  }
}