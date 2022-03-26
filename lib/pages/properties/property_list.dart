import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lmsadmin/extentions/string_extension.dart';

import '../contacts/display_contacts_details.dart';
import 'property_tab.dart';
import 'update_property.dart';

class PropertyList extends StatefulWidget {
  const PropertyList({Key? key}) : super(key: key);

  @override
  State<PropertyList> createState() => _PropertyListState();
}

class _PropertyListState extends State<PropertyList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 460,
      child: Expanded(
        child: FutureBuilder(
            future: getpropertycount(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Text('wait.');
                case ConnectionState.waiting:
                  return const Text('wait..');

                case ConnectionState.active:
                  return const Text('wait...');

                case ConnectionState.done:
                  return ListView.builder(
                      itemCount: snapshot.data,
                      itemBuilder: (context, value) {
                        return FutureBuilder(
                            future: getpropertydata(value),
                            builder: (context, AsyncSnapshot<Map> snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.none:
                                  return const Text('data');
                                case ConnectionState.waiting:
                                  return const Card(
                                      child: ListTile(
                                          leading:
                                              CircularProgressIndicator()));

                                case ConnectionState.active:
                                  return const Text('data');
                                case ConnectionState.done:
                                  Map property = snapshot.data!;
                                  return TextButton(
                                    onPressed: () {
                                      PropertTab.pid.value = property['pid'];
                                    },
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Card(
                                          elevation: 5,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Icon(
                                                        Icons.home,
                                                        size: 55,
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(6.0),
                                                            child: Text(
                                                              '${property['category'].toString().toCapitalized()} | ${property['subtype'].toString().toCapitalized()}',
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 8.0),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                const Icon(
                                                                  Icons
                                                                      .circle_outlined,
                                                                  size: 10,
                                                                  color: Colors
                                                                      .blue,
                                                                ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Text(
                                                                  '${property['type']}'
                                                                      .toCapitalized(),
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .blue),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: SizedBox(
                                                                height: 10,
                                                                child:
                                                                    ElevatedButton(
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                                              builder: (context) => UpdateProperty(
                                                                                    cid: property['cid'],
                                                                                    pid: property['pid'],
                                                                                  )));
                                                                          //                                                               Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                                          // builder: (context) =>  UpdateProperty(pid: property['pid'],cid: property['cid'],)));
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          'Edit',
                                                                          style: TextStyle(
                                                                              fontSize: 10,
                                                                              fontWeight: FontWeight.w600),
                                                                        )),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: SizedBox(
                                                                height: 10,
                                                                child:
                                                                    ElevatedButton(
                                                                        style: ElevatedButton.styleFrom(
                                                                            primary: Colors
                                                                                .red),
                                                                        onPressed:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            FirebaseFirestore.instance.collection("Contacts").doc(property['cid']).collection("Property").doc(property['pid']).delete();

                                                                            FirebaseFirestore.instance.collection("Property").doc(property['pid']).delete();
                                                                          });
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          'Delete',
                                                                          style: TextStyle(
                                                                              fontSize: 10,
                                                                              fontWeight: FontWeight.w600),
                                                                        )),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      '${property['addressone']}',
                                                      style: const TextStyle(
                                                          color:
                                                              Colors.blueGrey),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                              }
                            });
                      });
              }
            }),
      ),
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
}
