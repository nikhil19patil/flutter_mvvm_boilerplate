import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:illumine/src/core/value/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final strRes = prefs.getString(key);
    //debugPrint("read strRes = ${strRes}");
    if (strRes != null) {
      final jsonRes = json.decode(strRes);
      //debugPrint("read json = ${jsonRes}");
      return jsonRes;
    }
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    final str = json.encode(value);
    debugPrint("save str = ${str}");
    prefs.setString(key, str);
    debugPrint("saved val = ${str}");
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  clearUserDataFromSharedPref() async {
    try {
      await remove(Constants.kSharedPrefConstant.kUserModel);
    } catch (Excepetion) {
      // do something
    }
  }
}

/// Common shared preference helper class
class SharedPreferencesHelper {
  static final String _authToken = "authToken";
  static final String _customURL = "customURL";

  static Future<String?> getAuthToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_authToken);
  }

  //Returns empty String if token is not set
  static Future<String> getAuthTokenWithNullCheck() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_authToken) ?? "";
  }

  static Future<bool> setAuthToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_authToken, value);
  }

  static Future<bool> clearAuthToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(_authToken);
  }

  static Future<String?> getCustomURL() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_customURL);
  }

  static Future<bool> setCustomURL(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_customURL, value);
  }
}
