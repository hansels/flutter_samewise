import 'package:flutter/material.dart';
import 'package:flutter_samewise/basics/route_configurations/base_route_configuration.dart';

import 'package:flutter_samewise/constants/page_name.dart';
import 'activity_detail_screen.dart';

class ActivityDetailScreenRouteConfiguration extends BaseRouteConfiguration {
  ActivityDetailScreenRouteConfiguration()
      : super(
          PageName.ActivityDetail,
        );
  @override
  Future<Widget> getScreen(BuildContext context) async {
    Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return ActivityDetailScreen(activity: args['activity']);
  }
}
