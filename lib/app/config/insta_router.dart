import 'package:flutter/material.dart';
import 'package:flutter_new_instagram/app/pages/login/login_screen.dart';
import 'package:flutter_new_instagram/app/pages/main_screen.dart';
import 'package:flutter_new_instagram/app/pages/signup/signup_screen.dart';
import 'package:flutter_new_instagram/app/pages/splash/splash_screen.dart';
import 'dart:developer' as developer;

class InstaRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    developer.log('>>>> Route: ${settings.name}');
    switch (settings.name) {
      case SplashScreen.routeName:
        return SplashScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case SignupScreen.routeName:
        return SignupScreen.route();
      case MainScreen.routeName:
        return MainScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong!'),
        ),
      ),
    );
  }
}
