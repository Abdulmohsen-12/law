
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:law/Screens/home.dart';
import 'package:law/utils/constant.dart';

import 'menu_screen.dart';


class DrawerScreen extends StatefulWidget {
  final Widget place;
  const DrawerScreen({
    required this.place,
    Key? key,
  }) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {

  final zoomDrawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuBackgroundColor: AppColors.blue_light,
      controller: zoomDrawerController,
      menuScreen: const MenuScreen(),
      mainScreen: widget.place,
      borderRadius: 24.0,
      showShadow: true,
      angle: -12.0,
      drawerShadowsBackgroundColor:AppColors.boxbackground,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
    );
  }
}