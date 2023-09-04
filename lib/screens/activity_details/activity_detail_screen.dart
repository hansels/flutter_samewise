import 'package:flutter/material.dart';
import 'package:flutter_samewise/basics/screens/base_screen_with_app_bar.dart';
import 'package:flutter_samewise/constants/page_name.dart';
import 'package:flutter_samewise/models/activites.dart';
import 'package:flutter_samewise/screens/activity_details/activity_detail_page.dart';
// import 'package:flutter_samewise/widgets/home_drawer.dart';

class ActivityDetailScreen extends BaseScreenWithAppBar {
  final Activity activity;

  const ActivityDetailScreen({required this.activity, super.key})
      : super(
          PageName.ActivityDetail,
          padding: EdgeInsets.zero,
          scrollable: false,
        );

  @override
  Widget content(BuildContext context) {
    return ActivityDetailPage(
      activity: activity,
    );
  }

  // @override
  // Widget? drawer(BuildContext context) {
  //   return const HomeDrawer(selected: PageName.Home);
  // }

  @override
  Widget? bottomNavigationBar(BuildContext context) {
    return null;
  }

  @override
  AppBar? appBar(BuildContext context) {
    return AppBar();
  }
}
