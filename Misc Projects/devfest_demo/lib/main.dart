import 'package:devfesr_demo/config/config_page.dart';
import 'package:devfesr_demo/utils/devfest.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  Devfest.prefs = await SharedPreferences.getInstance();

  runApp(ConfigPage());
}
