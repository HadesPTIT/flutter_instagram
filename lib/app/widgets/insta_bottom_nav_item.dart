import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_instagram/gen_assets/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tuple/tuple.dart';

class InstaBottomNavItem extends StatelessWidget {
  final Tuple2<String, String> icon;
  final VoidCallback onPress;
  final bool isSelected;

  InstaBottomNavItem(this.icon, this.isSelected, {this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: this.onPress,
      child: Container(
        child: Padding(
            padding: EdgeInsets.all(8.0),
            child: icon.item1 == null
                ? _selfPicture(isSelected)
                : SvgPicture.asset(
                    isSelected ? icon.item2 : icon.item1,
                    color: Colors.black,
                  )),
      ),
    );
  }

  Widget _selfPicture(bool isSelected) {
    return CircleAvatar(
      radius: 14,
      backgroundColor: Colors.black,
      child: Padding(
        padding: isSelected ? EdgeInsets.all(1.0) : EdgeInsets.all(0),
        child: CircleAvatar(
          backgroundImage: Assets.images.imagesSample,
          radius: 14,
        ),
      ),
    );
  }
}
