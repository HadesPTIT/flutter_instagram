import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_instagram/app/blocs/auth/auth_bloc.dart';
import 'package:flutter_new_instagram/app/pages/login/login_screen.dart';
import 'package:flutter_new_instagram/app/pages/main_screen.dart';
import 'package:flutter_new_instagram/gen_assets/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.authenticated) {
            Navigator.of(context).pushNamed(MainScreen.routeName);
          } else {
            Navigator.of(context).pushNamed(LoginScreen.routeName);
          }
        },
        child: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child:
              SvgPicture.asset(Assets.images.icInstaSplash, fit: BoxFit.fill),
        ),
      ),
    );
  }
}
