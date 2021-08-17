import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swap/views/auth/login.dart';
import 'package:swap/views/file_director.dart';
import 'package:swap/views/main/main_screen.dart';
import 'package:swap/views/source/assets_app.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FileDirector(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User firebaseUser = Provider.of<User>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        AssetsApp.splashscreenImg,
        fit: BoxFit.cover,
      ),
    );
  }
}
