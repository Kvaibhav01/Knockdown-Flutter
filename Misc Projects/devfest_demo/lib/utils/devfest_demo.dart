//? Static constants for the app

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DevFestDemo {
  static const String app_name = 'DevFest Demo';
  static const String app_version = 'Version 1.0.0';
  static const int app_version_code = 1;

  static const String app_color = "#ffd7167";
  static const Color primaryAppColor = Colors.white;
  static const Color secondaryAppColor = Colors.black;

  static const String google_sans_family = 'GoogleSans';

  static bool isDebugMode = true;

  //* Preferences
  static SharedPreferences prefs;
}