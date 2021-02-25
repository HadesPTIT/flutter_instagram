import 'package:flutter/material.dart';
import 'package:flutter_new_instagram/app/pages/main_screen.dart';
import 'package:flutter_new_instagram/gen_assets/assets.gen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
              Color.fromARGB(255, 64, 93, 230),
              Color.fromARGB(255, 131, 58, 180),
              Color.fromARGB(255, 193, 53, 132),
            ])),
        child: Column(
          children: [
            Expanded(
                child: Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.images.icInstagram,
                      fit: BoxFit.fill,
                      color: Colors.white,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16.0, left: 40, right: 40),
                      child: Text(
                          'Sign up to see photos & videos from your friends',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(color: Colors.white, fontSize: 17),
                          textAlign: TextAlign.center),
                    ),
                  ],
                )),
                flex: 4),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Email or username',
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: Divider.createBorderSide(context)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: Divider.createBorderSide(context)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: Divider.createBorderSide(context)),
                          filled: true,
                          contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                      SizedBox(height: 14.0),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Password',
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: Divider.createBorderSide(context)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: Divider.createBorderSide(context)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: Divider.createBorderSide(context)),
                          filled: true,
                          contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                      SizedBox(height: 14.0),
                      RaisedButton(
                        padding: const EdgeInsets.all(14.0),
                        textColor: Colors.white,
                        color: Colors.blue,
                        onPressed: () => {Get.to(MainScreen())},
                        child: Text(
                          "Log In",
                          style: TextStyle(color: Colors.white, fontSize: 15.0),
                        ),
                      ),
                      SizedBox(height: 14.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Forgot your login details? ',
                              style: TextStyle(color: Colors.black54)),
                          Text(
                            'Get help logging in.',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(height: 14.0),
                      Row(
                        children: [
                          Spacer(flex: 1),
                          Expanded(
                              child: Container(
                                height: 0.5,
                                color: Colors.grey,
                              ),
                              flex: 2),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('OR',
                                style: TextStyle(color: Colors.white70)),
                          ),
                          Expanded(
                              child: Container(
                                height: 0.5,
                                color: Colors.grey,
                              ),
                              flex: 2),
                          Spacer(flex: 1),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      RaisedButton(
                        padding: const EdgeInsets.all(14.0),
                        textColor: Colors.white,
                        color: Colors.blue,
                        onPressed: () => {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Assets.images.icFacebook,
                              color: Colors.white,
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(width: 10),
                            Text("Log in as @Hades")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                flex: 6),
            Container(
              color: Colors.white10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.white24,
                    height: 0.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? ",
                            style: TextStyle(color: Colors.black54)),
                        Text(
                          'Sign up.',
                          style: TextStyle(
                              color: Colors.white54,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
