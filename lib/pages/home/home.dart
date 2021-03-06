// ignore_for_file: avoid_web_libraries_in_flutter, unused_import

import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lmsadmin/pages/home/dashboard.dart';
import 'package:lmsadmin/pages/employees/employees.dart';
import 'package:lmsadmin/pages//login/login.dart';

import '../../widgets/splash_screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snap) {
        switch (snap.connectionState) {
          case ConnectionState.none:
            return const LoginPage();
          case ConnectionState.waiting:
            return const SplashScreen();
          case ConnectionState.done:
            return const DashBoard();
          case ConnectionState.active:
            if (snap.hasData) {
              return const DashBoard();
            }
            return const LoginPage();
        }
      },
    );
  }
}
