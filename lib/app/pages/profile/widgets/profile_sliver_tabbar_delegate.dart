import 'package:flutter/material.dart';

class ProfileSliverPersistentHeaderTabBar
    extends SliverPersistentHeaderDelegate {
  Widget child;

  ProfileSliverPersistentHeaderTabBar({this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
