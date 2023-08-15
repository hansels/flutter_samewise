import 'package:flutter/material.dart';
import 'package:flutter_samewise/constants/page_name.dart';

abstract class IRouteConfiguration {
  Future<Widget> getScreen(BuildContext context);
  PageName? pageName;
}
