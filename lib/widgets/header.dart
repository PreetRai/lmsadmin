import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  final String headerTitle;
  final Widget addButton;
  const Header({Key? key, required this.headerTitle, required this.addButton})
      : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          margin: const EdgeInsets.all(0),
          color: Colors.white,
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.headerTitle,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              Visibility(
                visible: checkpagetitle(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: widget.addButton,
                ),
              )
            ],
          ),
        ));
  }

  bool checkpagetitle() {
    bool flag = false;
    if (widget.headerTitle == 'Dashboard') {
      return flag;
    }
    return flag = true;
  }
}
