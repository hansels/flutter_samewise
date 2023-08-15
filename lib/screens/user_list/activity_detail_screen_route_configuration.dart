import 'package:flutter_samewise/basics/route_configurations/base_route_configuration.dart';

import 'package:flutter_samewise/constants/page_name.dart';
import 'activity_detail_screen.dart';

class ActivityDetailScreenRouteConfiguration extends BaseRouteConfiguration {
  ActivityDetailScreenRouteConfiguration()
      : super(PageName.ActivityDetail,
            builder: (context) => const ActivityDetailScreen());
}
