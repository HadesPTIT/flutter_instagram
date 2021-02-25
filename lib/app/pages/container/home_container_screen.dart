import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_new_instagram/app/pages/activity/activity_screen.dart';
import 'package:flutter_new_instagram/app/pages/explore/explore_screen.dart';
import 'package:flutter_new_instagram/app/pages/home/home_screen.dart';
import 'package:flutter_new_instagram/app/pages/message/message_screen.dart';
import 'package:flutter_new_instagram/app/pages/post/post_screen.dart';
import 'package:flutter_new_instagram/app/pages/profile/profile_screen.dart';
import 'package:flutter_new_instagram/app/widgets/insta_bottom_nav_item.dart';
import 'package:flutter_new_instagram/gen_assets/assets.gen.dart';
import 'package:tuple/tuple.dart';

class HomeContainerScreen extends StatefulWidget {
  @override
  _HomeContainerScreenState createState() => _HomeContainerScreenState();
}

class _HomeContainerScreenState extends State<HomeContainerScreen> {
  PageController _pageController = PageController(initialPage: 0);
  int _selectedIndex = 0;

  List<Tuple2<String, String>> tabsIcons = [
    Tuple2(Assets.images.icHome, Assets.images.icHomeSelected),
    Tuple2(Assets.images.icSearch, Assets.images.icSearchSelected),
    Tuple2(Assets.images.icCreatePost, Assets.images.icCreatePost),
    Tuple2(Assets.images.icFavorite, Assets.images.icFavoriteSelected),
    Tuple2(null, null),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          HomeScreen(),
          ExploreScreen(),
          PostScreen(),
          ActivityScreen(),
          ProfileScreen()
        ],
      ),
      bottomNavigationBar: Material(
        elevation: 4,
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                border: Border(top: Divider.createBorderSide(context))),
            height: 50,
            child: Row(
              children: [
                Expanded(
                    child: InstaBottomNavItem(tabsIcons[0], 0 == _selectedIndex,
                        onPress: () {
                  setState(() {
                    _selectedIndex = 0;
                    _pageController.jumpToPage(0);
                  });
                })),
                Expanded(
                  child: InstaBottomNavItem(tabsIcons[1], 1 == _selectedIndex,
                      onPress: () {
                    setState(() {
                      _selectedIndex = 1;
                      _pageController.jumpToPage(1);
                    });
                  }),
                ),
                Expanded(
                    child: InstaBottomNavItem(tabsIcons[2], 2 == _selectedIndex,
                        onPress: () {
                  _selectedIndex = 2;
                  _pageController.jumpToPage(2);
                })),
                Expanded(
                    child: InstaBottomNavItem(tabsIcons[3], 3 == _selectedIndex,
                        onPress: () {
                  setState(() {
                    _selectedIndex = 3;
                    _pageController.jumpToPage(3);
                  });
                })),
                Expanded(
                    child: InstaBottomNavItem(tabsIcons[4], 4 == _selectedIndex,
                        onPress: () {
                  setState(() {
                    _selectedIndex = 4;
                    _pageController.jumpToPage(4);
                  });
                })),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
