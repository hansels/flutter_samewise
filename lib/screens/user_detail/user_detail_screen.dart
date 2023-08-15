import 'package:flutter/material.dart';
import 'package:flutter_samewise/basics/screens/base_screen_with_app_bar.dart';
import 'package:flutter_samewise/constants/page_name.dart';
import 'package:flutter_samewise/screens/user_detail/user_detail_page.dart';

class UserDetailScreen extends BaseScreenWithAppBar {
  const UserDetailScreen({super.key})
      : super(
          PageName.UserDetail,
          padding: EdgeInsets.zero,
          scrollable: false,
        );

  @override
  Widget content(BuildContext context) {
    return const UserDetailPage();
  }

  @override
  Widget? bottomNavigationBar(BuildContext context) {
    return null;
  }

  @override
  AppBar? appBar(BuildContext context) {
    return AppBar();
  }
}
