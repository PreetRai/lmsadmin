import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lmsadmin/pages/employees/display_employee_details.dart';

import '../../widgets/search.dart';

class EmployeeNames extends StatefulWidget {
  static ValueNotifier<String> refresh = ValueNotifier('');
  const EmployeeNames({Key? key}) : super(key: key);

  @override
  _EmployeeNamesState createState() => _EmployeeNamesState();
}

class _EmployeeNamesState extends State<EmployeeNames> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searctexteditingcontroller = TextEditingController();
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
          SearchInput(
              textController: searctexteditingcontroller, hintText: "Search"),
          Expanded(
            child: ValueListenableBuilder(
                valueListenable: EmployeeNames.refresh,
                builder: (BuildContext context, String value, Widget? child) {
                  return FutureBuilder(
                    future: getcount(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return Column(
                              children: [CircularProgressIndicator()]);
                        case ConnectionState.waiting:
                          return Column(
                              children: [CircularProgressIndicator()]);

                        case ConnectionState.active:
                          return Column(
                              children: [CircularProgressIndicator()]);
                        case ConnectionState.done:
                          return ListView.builder(
                            itemCount: snapshot.data,
                            itemBuilder: (context, value) {
                              return FutureBuilder(
                                  future: getdata(value),
                                  builder:
                                      (context, AsyncSnapshot<Map> snapshot) {
                                    switch (snapshot.connectionState) {
                                      case ConnectionState.none:
                                        return const Text('data');
                                      case ConnectionState.waiting:
                                        return const Card(
                                            child: ListTile(
                                                leading:
                                                    CircularProgressIndicator()));
                                      case ConnectionState.active:
                                        Map employee = snapshot.data!;
                                        return Card(
                                          child: ListTile(
                                            onTap: () {
                                              DisplayEmpDetails.uid.value =
                                                  employee['uid'].toString();
                                            },
                                            title: Text('${employee['name']}'),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${employee['email']}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                                Text(
                                                  '${employee['phone']}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                )
                                              ],
                                            ),
                                            leading:
                                                const FlutterLogo(size: 50),
                                          ),
                                        );
                                      case ConnectionState.done:
                                        Map employee = snapshot.data!;
                                        return Card(
                                          child: ListTile(
                                            onTap: () {
                                              DisplayEmpDetails.uid.value =
                                                  employee['uid'].toString();
                                            },
                                            title: Text('${employee['name']}'),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${employee['email']}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                                Text(
                                                  '${employee['phone']}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                )
                                              ],
                                            ),
                                            leading:
                                                const FlutterLogo(size: 50),
                                          ),
                                        );
                                    }
                                  });
                            },
                          );
                      }
                    },
                  );
                }),
          ),
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

  elementAt['uid'] = '${document.elementAt(x).get('uid')}';
  return elementAt;
}

Future<int> getcount() async {
  final QuerySnapshot result =
      await FirebaseFirestore.instance.collection('Employees').get();
  final List<DocumentSnapshot> document = result.docs;
  int x = document.length.toInt();
  return x;
}
