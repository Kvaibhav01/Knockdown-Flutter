# project02 - The second knockdown :punch:

## A basic Flutter project showcasing the use of Scaffolding and adding custom colors

This app focuses on adding Scaffolding and custom colors features of Flutter by following these steps:

_project02 > lib > **main.dart**_

1. `final appBarColor = const Color(0xFFd2527f);` Declaring a custom [`Color`](https://docs.flutter.io/flutter/dart-ui/Color-class.html) for our [AppBar](https://docs.flutter.io/flutter/material/AppBar-class.html). We use [`final`](https://www.dartlang.org/guides/language/language-tour#final-and-const) as we don't want the value of `appBarColor` to change anyhere throughout the app. Same goes for the use of [`const`](https://www.dartlang.org/guides/language/language-tour#final-and-const). Flutter uses 32-bit [ARGB](https://en.wikipedia.org/wiki/RGBA_color_space) value i.e. _Alpha Red Green Blue_ for colors. Every color value begins with `0x` ([thinking why `0x`?](https://stackoverflow.com/a/4581351)), next comes the opacity to use, we choose `FF` or full opaque without any transparency. Next up is our usual hex value of `d2527f` without any hash (#).

2. `final bgColor = const Color(0xFFe4e9ed);` Same goes for the background color for the [`home`](https://docs.flutter.io/flutter/material/MaterialApp/home.html).

3. `home: Scaffold` Here we create a [`Scaffold`](https://docs.flutter.io/flutter/material/Scaffold-class.html). This is used to implement [Material Design](https://material.io) providing APIs for other material elements like [`SnackBar`](https://docs.flutter.io/flutter/material/SnackBar-class.html), [`Drawer`](https://docs.flutter.io/flutter/material/Drawer-class.html) etc.

4. `backgroundColor: bgColor,` We use the declared `bgColor` inside the `Scaffold` to give it a value of `0xFFe4e9ed`.

5. `appBar: AppBar` We initialise the `AppBar` which is basically a material toolbar containing the app's name and/or other elements like logo and other actions (menu).

6. `backgroundColor: appBarColor` Finally, we do the same, apply the declared `appBarColor` to the `AppBar` as its background color.