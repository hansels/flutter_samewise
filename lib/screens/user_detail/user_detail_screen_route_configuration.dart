import 'package:flutter_samewise/basics/route_configurations/base_route_configuration.dart';

import 'package:flutter_samewise/constants/page_name.dart';
import 'user_detail_screen.dart';

class UserDetailScreenRouteConfiguration extends BaseRouteConfiguration {
  UserDetailScreenRouteConfiguration()
      : super(PageName.UserDetail,
            builder: (context) => const UserDetailScreen());
}
