import 'package:flutter/material.dart';
import 'package:flutter_samewise/constants/page_name.dart';
import 'package:flutter_samewise/functions/routes.dart';
import 'package:flutter_samewise/widgets/normal_list_tile.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeDrawer extends StatelessWidget {
  final PageName? selected;

  const HomeDrawer({super.key, this.selected});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Drawer(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                NormalListTile(
                  leading: const Icon(FontAwesomeIcons.house),
                  title: const Text("Home", style: TextStyle(fontSize: 16.0)),
                  onTap: () => getNavigation(context, PageName.Home),
                  selected: selected == PageName.Home,
                ),
                NormalListTile(
                  leading: const Icon(FontAwesomeIcons.userLarge),
                  title: const Text("Daftar", style: TextStyle(fontSize: 16.0)),
                  onTap: () => getNavigation(context, PageName.UserList),
                  selected: selected == PageName.UserList,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getNavigation(BuildContext context, PageName pageName) {
    selected == pageName
        ? Routes.pop(context)
        : Routes.pushReplacement(context, pageName);
  }
}
