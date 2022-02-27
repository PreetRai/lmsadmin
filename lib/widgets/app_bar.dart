import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      title: Row(
        children: const [
          Padding(
              padding: EdgeInsets.all(8.0),
              child: FlutterLogo(
                size: 30,
              )),
          Text('L-con'),
        ],
      ),
      actions: const [
        Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.notifications)),
      ],
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }
}
