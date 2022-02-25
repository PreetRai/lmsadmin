import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: const CustomAppBar(), body: Container());
  }
}
