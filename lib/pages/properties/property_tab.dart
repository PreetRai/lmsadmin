// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lmsadmin/pages/contacts/display_contacts_details.dart';
import 'package:lmsadmin/pages/properties/add_properties.dart';
import 'package:lmsadmin/pages/properties/property_list.dart';
import 'package:lmsadmin/pages/properties/update_property.dart';
import '../../extentions/string_extension.dart';

class PropertTab extends StatefulWidget {
  static ValueNotifier<String> pid = ValueNotifier('');
  const PropertTab({Key? key}) : super(key: key);

  @override
  State<PropertTab> createState() => _PropertTabState();
}

class _PropertTabState extends State<PropertTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const AddProperties()));
                  },
                  child: const Text('Add Property')),
            )),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Properties:',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PropertyList(),
              Expanded(
                child: SizedBox(
                  child: Card(
                      elevation: 5,
                      child: ValueListenableBuilder(
                          valueListenable: PropertTab.pid,
                          builder:
                              (BuildContext context, value, Widget? child) {
                            var visible = false;
                            if (value == '') {
                              visible = false;
                            } else {
                              visible = true;
                            }
                            return Visibility(
                              visible: visible,
                              replacement: Expanded(
                                child: Center(
                                    child:
                                        Text('Select a property for details')),
                              ),
                              child: FutureBuilder(
                                  future: getproperty(PropertTab.pid.value),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    switch (snapshot.connectionState) {
                                      case ConnectionState.waiting:
                                        return Center(
                                            child: const SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator()));

                                      default:
                                    }

                                    Map details = snapshot.data!;
                                    return Expanded(
                                        child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListView(
                                        children: [
                                          const Align(
                                              alignment: Alignment.topLeft,
                                              child: Text('Property Details')),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Flexible(
                                              child: Flex(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                direction: Axis.horizontal,
                                                children: [
                                                  const Text('Category : '),
                                                  Expanded(
                                                    child: Text(
                                                      '${details['category']}',
                                                      softWrap: true,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Flexible(
                                              child: Flex(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                direction: Axis.horizontal,
                                                children: [
                                                  const Text('Type : '),
                                                  Text('${details['type']}')
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Flexible(
                                              child: Flex(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                direction: Axis.horizontal,
                                                children: [
                                                  const Text('Subtype : '),
                                                  Text('${details['subtype']}')
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Flexible(
                                              child: Flex(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                direction: Axis.horizontal,
                                                children: [
                                                  const Text(
                                                      'Address Line 1 : '),
                                                  Text(
                                                      '${details['addressone']}')
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Flexible(
                                              child: Flex(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                direction: Axis.horizontal,
                                                children: [
                                                  const Text(
                                                      'Address Line 2 : '),
                                                  Text(
                                                      '${details['addresstwo']}')
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Flexible(
                                              child: Flex(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                direction: Axis.horizontal,
                                                children: [
                                                  const Text('Contractor : '),
                                                  Text(
                                                      '${details['contractor']}')
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Flexible(
                                              child: Flex(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                direction: Axis.horizontal,
                                                children: [
                                                  const Text(
                                                      'Contractor Number : '),
                                                  Text(
                                                      '${details['contractorphn']}'),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Flexible(
                                              child: Flex(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                direction: Axis.horizontal,
                                                children: [
                                                  const Text(
                                                      'Architectutre/Interior : '),
                                                  Text(
                                                      '${details['architect']}'),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Flexible(
                                              child: Flex(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                direction: Axis.horizontal,
                                                children: [
                                                  const Text(
                                                      'Architectutre/Interior Number : '),
                                                  Text(
                                                      '${details['architectphn']}'),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Flexible(
                                              child: Flex(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                direction: Axis.horizontal,
                                                children: [
                                                  const Text('Supervisor : '),
                                                  Text(
                                                      '${details['supervisor']}'),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Flexible(
                                              child: Flex(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                direction: Axis.horizontal,
                                                children: [
                                                  const Text(
                                                      'Supervisor Number : '),
                                                  Text(
                                                      '${details['supervisorphn']}'),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Flexible(
                                              child: Flex(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                direction: Axis.horizontal,
                                                children: [
                                                  const Text(
                                                      'Property Details : '),
                                                  Text('${details['details']}')
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ));
                                  }),
                            );
                          })),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  getpropertycount() async {
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('Contacts')
        .doc(DisplayConDetails.cid.value)
        .collection('Property')
        .get();
    final List<DocumentSnapshot> document = result.docs;
    int x = document.length.toInt();
    return x;
  }

  Future<Map> getpropertydata(int snap) async {
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('Contacts')
        .doc(DisplayConDetails.cid.value)
        .collection('Property')
        .get();
    final List<DocumentSnapshot> document = result.docs;
    var elementAt = {};

    elementAt['category'] = '${document.elementAt(snap).get('category')}';
    elementAt['pid'] = '${document.elementAt(snap).get('pid')}';
    elementAt['cid'] = '${document.elementAt(snap).get('cid')}';
    elementAt['type'] = '${document.elementAt(snap).get('type')}';
    elementAt['subtype'] = '${document.elementAt(snap).get('subtype')}';
    elementAt['addressone'] = '${document.elementAt(snap).get('addressone')}';
    return elementAt;
  }

  getproperty(String? pid) async {
    var collection = FirebaseFirestore.instance.collection('Property');
    var docSnapshot = await collection.doc(pid).get();
    Map<dynamic, dynamic> data = docSnapshot.data()!;
    return data;
  }
}
