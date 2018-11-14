# project04 - The fourth knockdown :punch:

## Stateful and Stateless Widgets in Flutter 

This app focuses on describing/making Stateful/Stateless Widgets and making a fresh Dart class by following these steps:

**_project04 > lib > src > **app.dart**_**

1. `class App extends StatelessWidget` We create a new Dart class named `App` which extends (carries properties of) [`StatelessWidget`](https://docs.flutter.io/flutter/widgets/StatelessWidget-class.html) class. A `StatelessWidget` is used when we don't want to save any data in our app. Since, we don't have anything to save right now, therefore we don't use the [`StatefulWidget`](https://docs.flutter.io/flutter/widgets/StatefulWidget-class.html).

2. `Widget build(context)` Here we're returning a [`Widget`](https://docs.flutter.io/flutter/widgets/Widget-class.html), because, this is exactly what Flutter is all about! Also, we're using `StatelessWidget`, that's why. Next, we call the `build()` method which takes in the [`context`](https://docs.flutter.io/flutter/widgets/State/context.html).

3. `return MaterialApp` Now, inside the `Widget`, we `return` the entire `MaterialApp` widget, exactly what we coded earlier in _main.dart_ .

___

_project04 > lib > **main.dart**_

1. `runApp(App());` We change the `runApp()` method and call the `App` class which's inside the _app.dart_ file making the project modularised.

2. `import 'src/app.dart';` Using `App` in the `main` class will not work as by default Flutter looks into _lib_ folder of the project directory to run the app. Hence, we need to `import` the _app.dart_ class.




