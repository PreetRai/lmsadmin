// ignore_for_file: avoid_web_libraries_in_flutter, unused_import

import 'dart:html';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lmsadmin/pages/contacts.dart';
import 'package:lmsadmin/pages/dashboard.dart';
import 'package:lmsadmin/pages/employees.dart';
import 'package:lmsadmin/pages/home.dart';
import 'package:lmsadmin/pages/login.dart';
import 'package:lmsadmin/pages/opportunities.dart';
import 'package:lmsadmin/pages/settings.dart';
import 'package:lmsadmin/pages/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyCKqKiE9Cnd2s_4s2G3jMuSE6HvpXDXk_Q",
    projectId: "l-con-1c876",
    messagingSenderId: "",
    appId: "1:773400883061:android:906f8c8c6df4dfd695ed3c",
  ));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home:  const Homepage(),
      routes: <String, WidgetBuilder>{
        '/dashboard': (BuildContext context) => const DashBoard(),
        '/employees': (BuildContext context) => const Employeedetails(),
        '/contacts': (BuildContext context) => const Contacts(),
        '/opportunities': (BuildContext context) => const Opportunities(),
        '/settings': (BuildContext context) => const UserSettings(),
        '/Login': (BuildContext context) => const LoginPage(),
        '/Signup': (BuildContext context) => const SignupPage(),
      },
    );
  }
}
