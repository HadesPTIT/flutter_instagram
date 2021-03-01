import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_instagram/app/blocs/auth/auth_bloc.dart';
import 'package:flutter_new_instagram/app/blocs/insta_cubit_observer.dart';
import 'package:flutter_new_instagram/app/config/insta_router.dart';
import 'package:flutter_new_instagram/app/pages/splash/splash_screen.dart';
import 'package:flutter_new_instagram/app/repositories/auth/auth_repository.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  EquatableConfig.stringify = kDebugMode;
  Bloc.observer = InstaCubitObserver();

  runApp(InstaApplication());
}

class InstaApplication extends StatefulWidget {
  @override
  _InstaApplicationState createState() => _InstaApplicationState();
}

class _InstaApplicationState extends State<InstaApplication> {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AuthRepository>(
              create: (context) => AuthRepositoryImpl())
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(
                create: (context) =>
                    AuthBloc(authRepository: AuthRepositoryImpl()))
          ],
          child: GetMaterialApp(
            title: 'Flutter Instagram',
            debugShowCheckedModeBanner: false,
            onGenerateRoute: InstaRouter.onGenerateRoute,
            initialRoute: SplashScreen.routeName,
          ),
        ));
  }
}
