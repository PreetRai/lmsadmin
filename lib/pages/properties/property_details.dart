import 'package:flutter/material.dart';

import '../../widgets/tab_bar.dart';

class PropertyDeatials extends StatefulWidget {
  const PropertyDeatials({Key? key}) : super(key: key);

  @override
  State<PropertyDeatials> createState() => _PropertyDeatialsState();
}

class _PropertyDeatialsState extends State<PropertyDeatials> {
  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Card(
        elevation: 10,
        child: Expanded(child: TabBarAndTabViews()),
      ),
    );
  }
}
