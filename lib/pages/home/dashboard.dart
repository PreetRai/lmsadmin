import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lmsadmin/model/user_model.dart';
import 'package:lmsadmin/widgets/app_bar.dart';
import 'package:lmsadmin/widgets/app_drawer.dart';
import 'package:lmsadmin/widgets/header.dart';

import '../login/login.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final Widget addbutton = ElevatedButton(
    onPressed: () {},
    child: const Text('Dashboard'),
  );
  User? user = FirebaseAuth.instance.currentUser;
  AdminModel loggedInUser = AdminModel();
  EmpModel loggedinemployee = EmpModel();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("Admin")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = AdminModel.fromMap(value.data());
      setState(() {});
    });

    FirebaseFirestore.instance
        .collection("Employees")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedinemployee = EmpModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        drawer: const AppDrawer(),
        body: FutureBuilder(
            future: checkadmin(loggedinemployee.isAdmin),
            builder: (context, snap) {
              return Center(
                child: Column(
                  children: [
                    Header(
                      headerTitle: 'Dashboard',
                      addButton: addbutton,
                    ),
                    const Text('Welcome'),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              );
            }));
  }

  checkadmin(bool? isAdmin) async {
    if (isAdmin == false) {
      print(isAdmin);
      Fluttertoast.showToast(msg: "You are not an Admin");
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }
}
