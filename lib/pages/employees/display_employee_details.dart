import 'package:flutter/material.dart';

class DisplayEmpDetails extends StatefulWidget {
  const DisplayEmpDetails({Key? key}) : super(key: key);

  @override
  _DisplayEmpDetailsState createState() => _DisplayEmpDetailsState();
}

class _DisplayEmpDetailsState extends State<DisplayEmpDetails> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Card(
        color: Colors.white,
        child: Center(
          child: Row(
            children: [
              Flexible(
                flex: 3,
                child: Column(
                  children: [
                    SizedBox(
                      height: 90,
                      child: Image.asset(
                        'assets/images/jh.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
              const Flexible(flex: 1, child: Text('data'))
            ],
          ),
        ),
      ),
    );
  }
}
