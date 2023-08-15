import 'package:flutter_samewise/basics/route_configurations/base_route_configuration.dart';

import 'package:flutter_samewise/constants/page_name.dart';
import 'package:flutter_samewise/functions/double_back_function.dart';
import 'home_screen.dart';

class HomeScreenRouteConfiguration extends BaseRouteConfiguration {
  HomeScreenRouteConfiguration()
      : super(PageName.Home,
            builder: (context) => DoubleBackFunction.use(const HomeScreen()));
}
