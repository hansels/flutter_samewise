import 'package:flutter_samewise/basics/route_configurations/base_route_configuration.dart';

import 'package:flutter_samewise/constants/page_name.dart';
import 'user_list_screen.dart';

class UserListScreenRouteConfiguration extends BaseRouteConfiguration {
  UserListScreenRouteConfiguration()
      : super(PageName.UserList, builder: (context) => const UserListScreen());
}
