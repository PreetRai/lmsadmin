import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  final String headerTitle;
  const Header({Key? key, required this.headerTitle}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 75,
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          margin: const EdgeInsets.all(0),
          color: Colors.white,
          elevation: 2,
          child: Text(widget.headerTitle),
        ));
  }
}
