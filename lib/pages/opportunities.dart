import 'package:flutter/material.dart';
import 'package:lmsadmin/widgets/app_drawer.dart';

import '../widgets/app_bar.dart';
import '../widgets/header.dart';

class Opportunities extends StatefulWidget {
  const Opportunities({Key? key}) : super(key: key);

  @override
  _OpportunitiesState createState() => _OpportunitiesState();
}

class _OpportunitiesState extends State<Opportunities> {
  final Widget addbutton = ElevatedButton(
    onPressed: () {},
    child: const Text('Add Opportunities'),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Header(
            headerTitle: 'opportunities',
            addButton: addbutton,
          )
        ],
      ),
    );
  }
}
