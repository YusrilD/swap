import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swap/views/auth/login.dart';
import 'package:swap/views/main/main_screen.dart';

class FileDirector extends StatefulWidget {
  @override
  _FileDirectorState createState() => _FileDirectorState();
}

class _FileDirectorState extends State<FileDirector> {
  @override
  Widget build(BuildContext context) {
    User firebaseUser = Provider.of<User>(context);
    return (firebaseUser == null) ? LoginPage() : MainScreen(firebaseUser);
  }
}
