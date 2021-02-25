import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_new_instagram/app/pages/login/sign_in_screen.dart';
import 'package:flutter_new_instagram/gen_assets/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((_) => Get.to(SignInScreen()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: SvgPicture.asset(Assets.images.icInstaSplash, fit: BoxFit.fill),
    );
  }
}
