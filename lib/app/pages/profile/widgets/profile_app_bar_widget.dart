import 'package:flutter/material.dart';
import 'package:flutter_new_instagram/gen_assets/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileAppBarWidget extends StatefulWidget {
  final Function onShowMenu;

  const ProfileAppBarWidget({Key key, this.onShowMenu}) : super(key: key);

  @override
  _ProfileAppBarWidgetState createState() => _ProfileAppBarWidgetState();
}

class _ProfileAppBarWidgetState extends State<ProfileAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        pinned: true, delegate: ProfileAppBarDelegate(widget.onShowMenu));
  }
}

class ProfileAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Function onShowMenu;

  ProfileAppBarDelegate(this.onShowMenu);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Container(
        padding: const EdgeInsets.only(left: 16),
        color: Colors.white,
        // decoration: BoxDecoration(boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     offset: Offset(0, 2),
        //   )
        // ], color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.center,
              child: Row(
                children: [
                  Text('Hades',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  Icon(Icons.keyboard_arrow_down, size: 20),
                  Text('•', style: TextStyle(color: Colors.red, fontSize: 35))
                ],
              ),
            ),
            Row(
              children: [
                SvgPicture.asset(Assets.images.icProfileAdd,
                    width: 20, height: 20),
                IconButton(icon: Icon(Icons.menu), onPressed: onShowMenu),
              ],
            )
          ],
        ),
      ),
    );
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
