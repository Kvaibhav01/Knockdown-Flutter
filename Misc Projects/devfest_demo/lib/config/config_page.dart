import 'package:devfest_demo/config/index.dart';
import 'package:devfest_demo/utils/devfest_demo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  ConfigBloc configBloc;

  @override
  void initState() {
    super.initState();
    setupApp();
  }

  setupApp() {
    configBloc = ConfigBloc();

    // Check the preference and by default make it false
    configBloc.darkModeOn = DevFestDemo.prefs.getBool(DevFestDemo.darkModePref) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider (
      child: BlocBuilder<ConfigBloc, ConfigState> (
        builder: (context, state) {
          return MaterialApp(
            title: 'Google Devfest',
            debugShowCheckedModeBanner: false,
            theme: ThemeData (
              fontFamily: DevFestDemo.google_sans_family,
              primarySwatch: Colors.red,
              primaryColor: configBloc.darkModeOn ? Colors.black : Colors.white,
              disabledColor: Colors.grey,
              cardColor: configBloc.darkModeOn ? Colors.black : Colors.white,
              canvasColor:
                  configBloc.darkModeOn ? Colors.black : Colors.grey[50],
              brightness:
                  configBloc.darkModeOn ? Brightness.dark : Brightness.light,
              buttonTheme: Theme.of(context).buttonTheme.copyWith(
                  colorScheme: configBloc.darkModeOn
                      ? ColorScheme.dark()
                      : ColorScheme.light()),
              appBarTheme: AppBarTheme(
                elevation: 0.0,
              ),
            ),
            home: Scaffold(
              appBar: AppBar(),
              body: Container(),
            ),
          );
        },
      ), create: (BuildContext context) {},
    );
  }
}