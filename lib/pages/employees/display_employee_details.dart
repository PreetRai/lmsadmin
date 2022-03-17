import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DisplayEmpDetails extends StatefulWidget {
  static ValueNotifier<String> uid = ValueNotifier('');
  const DisplayEmpDetails({
    Key? key,
  }) : super(key: key);

  @override
  _DisplayEmpDetailsState createState() => _DisplayEmpDetailsState();
}

class _DisplayEmpDetailsState extends State<DisplayEmpDetails> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 6,
      child: Card(
        color: Colors.white,
        child: Center(
          child: ValueListenableBuilder(
            valueListenable: DisplayEmpDetails.uid,
            builder: (BuildContext context, String newValue, Widget? child) {
              if (newValue == '') {
                return Text('Select an Employee fo the details');
              }
              return FutureBuilder(
                future: getuser(newValue),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const CircularProgressIndicator();
                    default:
                      Map details = snapshot.data!;
                      return Text('${details['email']}');
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Future<Map> getuser(String newValue) async {
    var collection = FirebaseFirestore.instance.collection('Employees');
    var docSnapshot = await collection.doc(newValue).get();
    Map<dynamic, dynamic> data = docSnapshot.data()!;

    return data;
  }
}
