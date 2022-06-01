import 'package:chathai/extends_page_homeManu/dashboard_in_home.dart';
import 'package:chathai/extends_page_homeManu/e_wallat.dart';
import 'package:chathai/extends_page_homeManu/manu_in_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarView.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/motiontabbar.dart';

class homeMenu extends StatefulWidget {
  final String uid;
  homeMenu({Key key, @required this.uid}) : super(key: key);

  @override
  _homeMenuState createState() => _homeMenuState(uid);
}

final auth = FirebaseAuth.instance;

class _homeMenuState extends State<homeMenu> with TickerProviderStateMixin {
  final String uid;
  _homeMenuState(this.uid);

  MotionTabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = MotionTabController(initialIndex: 1, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: MotionTabBar(
          labels: ["Point", "Home", "Dashboard"],
          initialSelectedTab: "Home",
          tabIconColor: Colors.black,
          tabSelectedColor: Colors.deepOrange,
          onTabItemSelected: (int value) {
            print(value);
            setState(() {
              _tabController.index = value;
            });
          },
          icons: [Icons.monetization_on, Icons.home, Icons.menu],
          textStyle: TextStyle(color: Colors.deepOrange),
        ),
        body: MotionTabBarView(
          controller: _tabController,
          children: <Widget>[
            Container(
              color: Colors.grey[200],
              child: eWallat(),
            ),
            Container(
              color: Colors.grey[200],
              child: menuInHome(),
            ),
            Container(
              color: Colors.grey[200],
              child: dashboard(),
            ),
          ],
        ));
  }
}
