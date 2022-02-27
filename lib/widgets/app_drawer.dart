import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';
import '../pages/contacts.dart';
import '../pages/dashboard.dart';
import '../pages/employees.dart';
import '../pages/login.dart';
import '../pages/opportunities.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration:
                            const BoxDecoration(color: Colors.transparent),
                        width: 80,
                        height: 80,
                        child: FittedBox(
                            child: Image.asset(
                          'assets/images/jh.png',
                          fit: BoxFit.fill,
                        )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              '${loggedInUser.firstName} ${loggedInUser.secondName}',
                              style: const TextStyle(fontSize: 20)),
                          Text(
                            '${loggedInUser.email}',
                            style: const TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w100),
                            textScaleFactor: 0.8,
                          )
                        ],
                      )
                    ],
                  )),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const DashBoard()));
                            },
                            child: const Text(
                              'Dashboard',
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Employeedetails()));
                            },
                            child: const Text(
                              'Employees',
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const Contacts()));
                            },
                            child: const Text(
                              'Contacts',
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Opportunities()));
                            },
                            child: const Text(
                              'Opportunities',
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 200,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        logout(context);
                      },
                      child: const Text('Logout'))),
            )
          ],
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}
