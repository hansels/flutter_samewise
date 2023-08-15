import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_samewise/configs/configs.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_samewise/functions/double_back_function.dart';
import 'package:flutter_samewise/screens/home/home_screen.dart';
import 'package:flutter_samewise/widgets/builder/future_use.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_samewise/functions/token_version.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Configs.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "DINPro",
        useMaterial3: true,
        primaryColor: Configs.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimatedSplashScreen(
        splash: "assets/SameWise.png",
        splashIconSize: 225,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: Colors.white,
        duration: 1500,
        nextScreen: getHomeScreen(context),
        curve: Curves.easeInOutCirc,
      ),
    );
  }

  static Widget getHomeScreen(BuildContext context) {
    return FutureUse<String>(
      future: initAndGetToken(),
      builder: (context, snapshot) {
        return DoubleBackFunction.use(const HomeScreen());
      },
    );
  }

  static Future<String> initAndGetToken() async {
    await TokenVersion.init();
    String token = await TokenVersion.getToken();

    return token;
  }
}
