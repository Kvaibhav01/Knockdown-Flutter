# project05 - The fifth knockdown :punch:

## Stateful Widgets in Flutter 

This app focuses on making a Stateful Widget by implementing a counter by these steps:

**_project05 > lib > src > **app.dart**_**

1. `class StateKeeper extends State<App>` We change the class name from `App` to `StateKeeper` and extend it to the [`State`](https://docs.flutter.io/flutter/widgets/State-class.html) class which is used to update only that specific _state_ of the app UI which needs updation (in this case, it's the `Text`). Inside the angular brackets we pass in the class which `extends` our `StatefulWidget`.

2. `body: Text('$counter')` Inside the [`body`](https://docs.flutter.io/flutter/material/Scaffold/body.html) property of `Scaffold` we assign a [`Text`](https://docs.flutter.io/flutter/widgets/Text-class.html) widget which takes in the variable `counter` as a `String` (therefore it's `$counter` and not `counter`).

3. `setState((){})` The `setState` is a callback method which tells Flutter that the state of the object has to be changed, i.e. our text should change and as it's a child of `onPressed()`, it means that this will be called whenever our FAB is pressed.
