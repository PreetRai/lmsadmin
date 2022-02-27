import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/app_drawer.dart';
import '../widgets/header.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({Key? key}) : super(key: key);

  @override
  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  final Widget addbutton = ElevatedButton(
    onPressed: () {},
    child: const Text('Add Contacts'),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Header(
            headerTitle: 'Settings',
            addButton: addbutton,
          )
        ],
      ),
    );
  }
}
