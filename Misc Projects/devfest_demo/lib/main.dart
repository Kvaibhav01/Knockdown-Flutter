import 'package:devfest_demo/config/index.dart';
import 'package:devfest_demo/utils/devfest_demo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  // Set status bar color transparent
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent)
  );

  // Set orientation to be portrait only
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  //? This returns a Future
  DevFestDemo.prefs = await SharedPreferences.getInstance();

  runApp(ConfigPage());
}