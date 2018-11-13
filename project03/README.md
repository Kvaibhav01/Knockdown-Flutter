# project03 - The third knockdown :punch:

## A Flutter project to showcase adding a Title and Floating Action Button (FAB)

This app focuses on adding a custom app title (app name) and FAB customisation by following these steps:

_project03 > lib > **main.dart**_

1. `floatingActionButton: FloatingActionButton` We first use the `floatingActionButton` variable to store all the information about [FAB](https://docs.flutter.io/flutter/material/FloatingActionButton-class.html). The FAB is used to allow user to start a primary action to the app.

2. `child: Icon(Icons.polymer, color: fabIconColor,)` The `child` is used when we need to store some information into a bigger item. So here, we have FAB inside which we have its _child_ for declaring the [`Icons`](https://docs.flutter.io/flutter/material/Icons-class.html) class. The `Icons` is a class under the [`Icon`](https://docs.flutter.io/flutter/widgets/Icon-class.html) widget class. We give it a property of `color` and assign it to the `fabIconColor` declared in [line 6](https://github.com/Kvaibhav01/Knockdown-Flutter/blob/34b64ec84d815bdfb83b2e7b3b4811abf0464b5b/project03/lib/main.dart#L6). [See how to do this](https://github.com/Kvaibhav01/Knockdown-Flutter/blob/master/project02/README.md). As for the icon, we choose the [polymer](https://material.io/tools/icons/?search=polymer&icon=polymer&style=baseline) icon from the Material Icon asset.

3. `onPressed: ()` This method is called when we tap the FAB and want something to happen by the tap action. As for this project, it's kept blank. See [docs](https://docs.flutter.io/flutter/material/FloatingActionButton/onPressed.html).

4. `title: Text('Third Knockdown')` We add a `title` property to the [`AppBar`](https://docs.flutter.io/flutter/material/AppBar-class.html), adding a [`Text`](https://docs.flutter.io/flutter/widgets/Text-class.html) widget class to display a single style text i.e. our app name which we pass in as a `String`.
