import 'package:flutter/material.dart';

// Declare a new class which uses Stateful widget
class App extends StatefulWidget {
  // Use createState method to make a mutable state for this widget. See docs: https://docs.flutter.io/flutter/widgets/StatefulWidget/createState.html
  createState() {
    // Return our State class
    return StateKeeper();
  }
}

// Change class name and use State
class StateKeeper extends State<App> {
  // Declare a new variable which will increment on FAB tap
  int counter = 1;
  final appBarColor = const Color(0xFFd2527f);
  final bgColor = const Color(0xFFe4e9ed);
  final fabIconColor = const Color(0xFFFFFFFF);
  Widget build(context) {
    return MaterialApp(
    home: Scaffold(
      // Use the body of the app to display the value of counter as a Text
      body: Text('$counter'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: appBarColor,
        child: Icon(Icons.add, color: fabIconColor,),
        onPressed: (){
          // Use setState method to change value on tap
          setState(() {
            // Increment the counter value by one. Equal to counter = counter + 1
            counter++;
          });
        }
        ),
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text('Fifth Knockdown'),
      ),
    ),
  );
  }
}
