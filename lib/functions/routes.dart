import 'package:flutter/material.dart';
import 'package:flutter_samewise/constants/page_name.dart';
import 'package:flutter_samewise/functions/enum_parser.dart';
import 'package:flutter_samewise/functions/loading_function.dart';
import 'package:flutter_samewise/interfaces/i_route_configuration.dart';
import 'package:flutter_samewise/screens/activity_details/activity_detail_screen_route_configuration.dart';
import 'package:flutter_samewise/screens/home/home_screen_route_configuration.dart';
import 'package:flutter_samewise/screens/user_detail/user_detail_screen_route_configuration.dart';
import 'package:flutter_samewise/screens/user_list/user_list_screen_route_configuration.dart';
import 'package:flutter_samewise/widgets/builder/future_use.dart';

class Routes {
  static List<IRouteConfiguration> listRoute = [
    HomeScreenRouteConfiguration(),
    ActivityDetailScreenRouteConfiguration(),
    UserListScreenRouteConfiguration(),
    UserDetailScreenRouteConfiguration(),
  ];

  static Future<T?> pushAndRemoveUntil<T>(
      BuildContext context, PageName pageName,
      {Map<String, dynamic>? arguments}) {
    var config = findConfiguration(pageName);

    return Navigator.of(context).pushAndRemoveUntil<T>(
      getScreenRoute(context, config!, arguments),
      (Route<dynamic> route) => false,
    );
  }

  static Future<T?> pushAndRemoveUntilFirst<T>(
      BuildContext context, PageName pageName,
      {Map<String, dynamic>? arguments}) {
    var config = findConfiguration(pageName);

    return Navigator.of(context).pushAndRemoveUntil<T>(
      getScreenRoute(context, config!, arguments),
      (Route<dynamic> route) => route.isFirst,
    );
  }

  static Future<T?> pushReplacement<T>(BuildContext context, PageName pageName,
      {Map<String, dynamic>? arguments}) {
    var config = findConfiguration(pageName);

    return Navigator.of(context).pushReplacement(
      getScreenRoute(context, config!, arguments),
    );
  }

  static Future<T?> push<T>(BuildContext context, PageName pageName,
      {Map<String, dynamic>? arguments}) {
    var config = findConfiguration(pageName);

    return Navigator.of(context).push(
      getScreenRoute(context, config!, arguments),
    );
  }

  static void popToTop(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  static void pop(BuildContext context, {dynamic object, int times = 1}) {
    for (var i = 0; i < times - 1; i++) {
      Navigator.of(context).pop();
    }
    Navigator.of(context).pop(object);
  }

  static IRouteConfiguration? findConfiguration(PageName pageName) {
    try {
      return listRoute.firstWhere((x) => x.pageName == pageName);
    } catch (err) {
      return null;
    }
  }

  static Route<T> getScreenRoute<T>(
    BuildContext context,
    IRouteConfiguration config,
    Object? arguments,
  ) {
    return MaterialPageRoute(
      builder: (context) => FutureUse<Widget>(
        future: config.getScreen(context),
        widget: LoadingFunction.loadingSquareCircle(context),
        builder: (context, snapshot) {
          return snapshot.data!;
        },
      ),
      settings: RouteSettings(
        name: EnumParser.getString(config.pageName),
        arguments: arguments,
      ),
    );
  }
}
