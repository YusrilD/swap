import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swap/services/service.dart';
import 'package:swap/views/splashscreen.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: Services.firebaseUserStream,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
