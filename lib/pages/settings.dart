import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({Key? key}) : super(key: key);

  @override
  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: const CustomAppBar(), body: Container());
  }
}
