import 'package:flutter/material.dart';
import 'package:flutter_samewise/basics/screens/base_screen_with_app_bar.dart';
import 'package:flutter_samewise/constants/page_name.dart';
import 'package:flutter_samewise/screens/user_list/user_list_page.dart';
// import 'package:flutter_samewise/widgets/home_drawer.dart';

class UserListScreen extends BaseScreenWithAppBar {
  const UserListScreen({super.key})
      : super(
          PageName.UserList,
          padding: EdgeInsets.zero,
          scrollable: false,
        );

  @override
  Widget content(BuildContext context) {
    return const UserListPage();
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
