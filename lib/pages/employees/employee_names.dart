import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EmployeeNames extends StatefulWidget {
  const EmployeeNames({Key? key}) : super(key: key);

  @override
  _EmployeeNamesState createState() => _EmployeeNamesState();
}

class _EmployeeNamesState extends State<EmployeeNames> {
  late ScrollController _controller;
  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener); //the listener for up and down.
    super.initState();
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        //you can do anything here
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        //you can do anything here
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Registered Employees',
              style: TextStyle(fontSize: 15),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _controller,
              itemCount: null,
              itemBuilder: (context, value) {
                return FutureBuilder(
                  future: getdata(value),
                  builder: (context, AsyncSnapshot<Map> snapshot) {
                    Map employee = snapshot.data!;

                    return Card(
                      child: ListTile(
                        onTap: () {},
                        title: Text('${employee['name']}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${employee['email']}',
                              style: const TextStyle(fontSize: 10),
                            ),
                            Text(
                              '${employee['phone']}',
                              style: const TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                        leading: const FlutterLogo(size: 50),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

Future<Map> getdata(int x) async {
  final QuerySnapshot result =
      await FirebaseFirestore.instance.collection('Employees').get();
  final List<DocumentSnapshot> document = result.docs;
  var elementAt = {};
  elementAt['name'] =
      '${document.elementAt(x).get('firstName')} ${document.elementAt(x).get('secondName')}';
  elementAt['email'] = '${document.elementAt(x).get('email')}';
  elementAt['phone'] = '${document.elementAt(x).get('phone')}';

  return elementAt;
}