import 'package:flutter/material.dart';
import 'package:flutter_samewise/configs/configs.dart';

class NormalListTile extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final bool selected;
  final void Function()? onTap;

  const NormalListTile(
      {super.key, this.leading, this.title, this.onTap, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.horizontal(right: Radius.circular(30)),
        child: Container(
          color: selected ? Configs.primaryColor : Colors.transparent,
          child: ListTile(
            selected: selected,
            leading: leading,
            title: title,
            onTap: onTap,
            minLeadingWidth: 35,
            selectedColor: Configs.secondaryColor,
          ),
        ),
      ),
    );
  }
}
