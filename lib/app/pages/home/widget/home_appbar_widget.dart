import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_instagram/app/pages/camera/camera_screen.dart';
import 'package:flutter_new_instagram/app/pages/message/message_screen.dart';
import 'package:flutter_new_instagram/gen_assets/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBarWidget();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 1,
      child: Row(
        children: [
          IconButton(
              icon: SvgPicture.asset(
                Assets.images.icCameraV2,
                color: Colors.black,
                width: 24,
                height: 24,
              ),
              onPressed: () async {
                List<CameraDescription> cameras = [];
                cameras = await availableCameras();
                Get.to(CameraScreen(cameras));
              }),
          Expanded(
              child: Container(
            child: SvgPicture.asset(Assets.images.logoInsta),
          )),
          IconButton(
              icon: SvgPicture.asset(Assets.images.icMesenger,
                  width: 25,
                  height: 25,
                  color: Colors.black),
              onPressed: () => Get.to(MessageScreen()))
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(400);
}
