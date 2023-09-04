import 'dart:io';

import 'package:flutter_samewise/constants/font_size.dart';
import 'package:flutter_samewise/functions/enum_parser.dart';
import 'package:flutter_samewise/models/activites.dart';
import 'package:flutter_samewise/models/customer.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'shared_preferences_function.dart';

class TokenVersion {
  final SharedPreferencesFunction _sharedPreferencesHelper =
      SharedPreferencesFunction();

  String? _token;
  String? _os;
  String? _version;
  List<Activity?>? activites;
  List<Customer?>? customers;
  FontSize _fontSize = FontSize.medium;

  static init() async {
    String? fontSize =
        await instance._sharedPreferencesHelper.getValue('fontSize');

    if (fontSize == null) {
      fontSize = EnumParser.getString(FontSize.medium);
      instance._sharedPreferencesHelper.setStringValue('fontSize', fontSize);
    }
    instance._fontSize = EnumParser.getEnum(FontSize.values, fontSize);
  }

  static double getFontSizeMapping() {
    switch (instance._fontSize) {
      case FontSize.small:
        return 0;
      case FontSize.medium:
        return 1;
      case FontSize.large:
        return 2;
      case FontSize.xlarge:
        return 3;
    }
  }

  static double getFontRatio() {
    switch (instance._fontSize) {
      case FontSize.small:
        return 0.8;
      case FontSize.medium:
        return 1;
      case FontSize.large:
        return 1.2;
      case FontSize.xlarge:
        return 1.4;
    }
  }

  static setFontSizeByMapping(double mapping) async {
    var fontSize = FontSize.values[mapping.toInt()];
    await instance._sharedPreferencesHelper
        .setStringValue('fontSize', EnumParser.getString(fontSize));
    instance._fontSize = fontSize;
  }

  static TokenVersion? _instance;

  static TokenVersion get instance {
    return _instance ?? (_instance = TokenVersion());
  }

  static Future<String> getVersion() async {
    return instance._version ?? "";
  }

  static Future<String?> getOS() async {
    instance._os ??= Platform.isIOS ? "iOS" : "Android";
    return instance._os;
  }

  static Future<String> getVersionString() async {
    var os = await getOS();
    var version = await getVersion();
    return "vers. $os $version";
  }

  static Future<String> getToken() async {
    instance._token ??=
        await instance._sharedPreferencesHelper.getValue('token');
    return instance._token ?? "";
  }

  static Future<Map<String, dynamic>> loadJsonFromAssets(
      String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    return jsonDecode(jsonString);
  }

  static Future<List<Activity?>?> getActivities() async {
    var act = await instance._sharedPreferencesHelper.getValue('activities');
    if (act == null) {
      var file = await loadJsonFromAssets('assets/activities.json');
      instance._sharedPreferencesHelper
          .setStringValue('activities', jsonEncode(file['activities']));
    }
    var read = (jsonDecode(
        await instance._sharedPreferencesHelper.getValue('activities') ??
            "") as List<dynamic>);
    instance.activites ??= read.map((e) => Activity.fromMap(e)).toList();
    return instance.activites ?? [];
  }

  static Future<List<Customer?>> getCustomers() async {
    var act = await instance._sharedPreferencesHelper.getValue('customers');
    if (act == null) {
      var file = await loadJsonFromAssets('assets/customers.json');
      instance._sharedPreferencesHelper
          .setStringValue('customers', jsonEncode(file['customers']));
    }
    var read = (jsonDecode(
            await instance._sharedPreferencesHelper.getValue('customers') ?? "")
        as List<dynamic>);
    instance.customers ??= read.map((e) => Customer.fromMap(e)).toList();
    return instance.customers ?? [];
  }

  static Future<void> setToken(String token) async {
    await instance._sharedPreferencesHelper.setStringValue('token', token);

    instance._token = token;
  }
}
