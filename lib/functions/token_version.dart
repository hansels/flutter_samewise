import 'dart:io';

import 'package:flutter_samewise/constants/font_size.dart';
import 'package:flutter_samewise/functions/enum_parser.dart';

import 'shared_preferences_function.dart';

class TokenVersion {
  final SharedPreferencesFunction _sharedPreferencesHelper =
      SharedPreferencesFunction();

  String? _token;
  String? _os;
  String? _version;
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

  static Future<void> setToken(String token) async {
    await instance._sharedPreferencesHelper.setStringValue('token', token);

    instance._token = token;
  }
}
