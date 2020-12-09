import 'package:fiyaka/core/constant/palette.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({
    Key key,
    this.title,
    this.actions,
    this.leading,
    this.iconColor = Palette.appBarIconColor,
    this.backgroundColor = Palette.transparent,
  }) : super(key: key);

  final String title;
  final List<Widget> actions;
  final Widget leading;
  final Color backgroundColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      automaticallyImplyLeading: leading == null,
      backgroundColor: backgroundColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: iconColor,
      ),
      centerTitle: true,
      title: Text(
        title ?? 'No Title',
        style: Palette.appBarTextStyle,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}
