# project01 - The first knockdown :punch:

## The most basic Flutter project displaying a simple text

This app focuses on printing out the text "Hi there, Vaibhav" by following these steps:

_project01 > lib > **main.dart**_

1. `import 'package:flutter/material.dart';` Importing the [Material Dart](https://docs.fluttera.io/flutter/material/material-library.html) library to implement [Material Design](https://material.io/) in our app. 
2. `void main()` Creating the [`main()`](https://www.dartlang.org/guides/language/language-tour#the-main-function) method which will be our entry point of the app. It returns void i.e no `return` value. 
3. `var app = MaterialApp(home: Text('Hi there, Vaibhav'));` Create a [`Text`](https://docs.flutter.io/flutter/widgets/Text-class.html) widget with a [`MaterialApp`](https://docs.flutter.io/flutter/material/MaterialApp-class.html)  widget class and pass in 'Hi there, Vaibhav' as the output text to be displayed. All of this is stored in the `app` variable.
4. `runApp(app);` Call the [`runApp`](https://docs.flutter.io/flutter/widgets/runApp.html) function and pass in the `app` variable created in the previous step.




