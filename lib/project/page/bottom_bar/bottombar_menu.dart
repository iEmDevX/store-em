import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_test/project/page/bottom_bar/bottombar_wg.dart';

List<BottomNavyBarItem> listMenu = <BottomNavyBarItem>[
  BottomNavyBarItem(
    title: Text('HOME', style: TextStyle(fontWeight: FontWeight.w100)),
    // child: Icon(Icons.home),
    child: SvgPicture.asset(
      'assets/images/bottombar_icon/home.svg',
      color: Colors.blue,
    ),
  ),
  BottomNavyBarItem(
    title: Text('DELIVERY', style: TextStyle(fontWeight: FontWeight.w100)),
    // child: Icon(Icons.local_shipping),
    child: SvgPicture.asset(
      'assets/images/bottombar_icon/rocket.svg',
      color: Colors.blue,
    ),
  ),
  BottomNavyBarItem(
    title: Text('SHOPING', style: TextStyle(fontWeight: FontWeight.w100)),
    child: Badge(
      badgeColor: Colors.red,
      position: BadgePosition.topRight(right: -2),
      badgeContent: Text(
        '9',
        style: TextStyle(
          color: Colors.white,
          fontSize: 8,
        ),
      ),
      // child: Icon(Icons.shopping_cart),
      child: SvgPicture.asset(
        'assets/images/bottombar_icon/cart.svg',
        color: Colors.blue,
      ),
    ),
  ),
  BottomNavyBarItem(
    title: Text('SETTING', style: TextStyle(fontWeight: FontWeight.w100)),
    // child: Icon(Icons.settings),
    child: SvgPicture.asset(
      'assets/images/bottombar_icon/cog.svg',
      color: Colors.blue,
    ),
  ),
];
