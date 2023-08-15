import 'package:flutter/material.dart';
import 'package:flutter_samewise/basics/screens/base_screen.dart';
import 'package:flutter_samewise/constants/page_name.dart';
import 'package:flutter_samewise/screens/home/home_page.dart';
// import 'package:flutter_samewise/widgets/home_drawer.dart';

class HomeScreen extends BaseScreen {
  const HomeScreen({super.key})
      : super(
          PageName.Home,
          padding: EdgeInsets.zero,
          scrollable: false,
        );

  @override
  Widget content(BuildContext context) {
    return const HomePage();
  }

  // @override
  // Widget? drawer(BuildContext context) {
  //   return const HomeDrawer(selected: PageName.Home);
  // }

  @override
  Widget? bottomNavigationBar(BuildContext context) {
    return null;
  }
}
