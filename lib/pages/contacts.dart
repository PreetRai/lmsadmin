import 'package:flutter/material.dart';
import 'package:lmsadmin/widgets/header.dart';

import '../widgets/app_bar.dart';
import '../widgets/app_drawer.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      body: Column(
        children: const [Header(headerTitle: 'Contacts')],
      ),
    );
  }
}
