import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lmsadmin/pages/contacts/display_contacts_details.dart';

import '../../widgets/search.dart';

class ContactNames extends StatefulWidget {
  static ValueNotifier<String> refresh = ValueNotifier('');
  const ContactNames({Key? key}) : super(key: key);

  @override
  _ContactNamesState createState() => _ContactNamesState();
}

class _ContactNamesState extends State<ContactNames> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searctexteditingcontroller = TextEditingController();
    return Flexible(
      flex: 1,
      child: Column(
        children: [
          SearchInput(
              textController: searctexteditingcontroller, hintText: "Search"),
          Expanded(
            child: ValueListenableBuilder(
                valueListenable: DisplayConDetails.cid,
                builder: (BuildContext context, String value, Widget? child) {
                  return FutureBuilder(
                    future: getcount(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return const Text('fetching...');
                        case ConnectionState.waiting:
                          return const Text('fetching...');

                        case ConnectionState.active:

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
                                        Map contacts = snapshot.data!;
                                        return Card(
                                          child: ListTile(
                                            onTap: () {
                                              DisplayConDetails.cid.value =
                                                  contacts['cid'].toString();
                                            },
                                            title: Text('${contacts['name']}'),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${contacts['email']}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                                Text(
                                                  '${contacts['phone']}',
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
                                        Map contacts = snapshot.data!;
                                        return Card(
                                          child: ListTile(
                                            onTap: () {
                                              DisplayConDetails.cid.value =
                                                  contacts['cid'].toString();
                                            },
                                            title: Text('${contacts['name']}'),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${contacts['email']}',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                                Text(
                                                  '${contacts['phone']}',
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
      await FirebaseFirestore.instance.collection('Contacts').get();
  final List<DocumentSnapshot> document = result.docs;
  var elementAt = {};
  elementAt['name'] =
      '${document.elementAt(x).get('firstName')} ${document.elementAt(x).get('secondName')}';
  elementAt['email'] = '${document.elementAt(x).get('email')}';
  elementAt['phone'] = '${document.elementAt(x).get('phone')}';

  elementAt['cid'] = '${document.elementAt(x).get('cid')}';
  return elementAt;
}

Future<int> getcount() async {
  final QuerySnapshot result =
      await FirebaseFirestore.instance.collection('Contacts').get();
  final List<DocumentSnapshot> document = result.docs;
  int x = document.length.toInt();
  return x;
}
