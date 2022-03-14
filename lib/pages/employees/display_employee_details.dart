import 'package:flutter/material.dart';

class DisplayEmpDetails extends StatefulWidget {
  const DisplayEmpDetails({Key? key}) : super(key: key);

  @override
  _DisplayEmpDetailsState createState() => _DisplayEmpDetailsState();
}

class _DisplayEmpDetailsState extends State<DisplayEmpDetails> {
  @override
  Widget build(BuildContext context) {
    return const Flexible(
      flex: 3,
      child: Card(
        color: Colors.white,
        child: Center(
          child: Text('data'),
        ),
      ),
    );
  }
}
