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
          Header(headerTitle: 'Contacts', addButton: addbutton),
        ],
      ),
    );
  }
}
