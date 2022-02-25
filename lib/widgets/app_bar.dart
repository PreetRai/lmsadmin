import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lmsadmin/fonts/my_flutter_app_icons.dart';

import 'package:lmsadmin/pages/contacts.dart';
import 'package:lmsadmin/pages/dashboard.dart';
import 'package:lmsadmin/pages/employees.dart';
import 'package:lmsadmin/pages/opportunities.dart';

import '../pages/dashboard.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: FlutterLogo(
            size: 30,
          )),
      title: const Text('L-con'),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const DashBoard()));
            },
            child: const Text(
              'Dashboard',
              style: TextStyle(color: Colors.white),
            )),
        TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const Employeedetails()));
            },
            child: const Text(
              'Employees',
              style: TextStyle(color: Colors.white),
            )),
        TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const Contacts()));
            },
            child: const Text(
              'Contacts',
              style: TextStyle(color: Colors.white),
            )),
        TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const Opportunities()));
            },
            child: const Text(
              'Opportunities',
              style: TextStyle(color: Colors.white),
            )),
        const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(MyFlutterApp.notification)),
        const Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.person)),
      ],
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }
}
