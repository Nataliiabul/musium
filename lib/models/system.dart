import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class System with ChangeNotifier{

  Future <void> setFirstLoading () async {
    final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
        {
          'firstLoading': 'true',
        },
      );
      prefs.setString('system', userData);
  }

  Future<bool> isFirst () async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('system');
  }
}