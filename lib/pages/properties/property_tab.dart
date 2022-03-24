// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lmsadmin/pages/contacts/display_contacts_details.dart';
import 'package:lmsadmin/pages/properties/add_properties.dart';
import 'package:lmsadmin/pages/properties/update_property.dart';
import '../../extentions/string_extension.dart';

class PropertTab extends StatefulWidget {
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
            children: [
              SizedBox(
                width: 460,
                child: Expanded(
                  child: FutureBuilder(
                      future: getpropertycount(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
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
                                      builder: (context,
                                          AsyncSnapshot<Map> snapshot) {
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
                                            return Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Card(
                                                  elevation: 5,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
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
                                                                        const EdgeInsets.all(
                                                                            6.0),
                                                                    child: Text(
                                                                      '${property['category'].toString().toCapitalized()} | ${property['subtype'].toString().toCapitalized()}',
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            20,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            8.0),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        const Icon(
                                                                          Icons
                                                                              .circle_outlined,
                                                                          size:
                                                                              10,
                                                                          color:
                                                                              Colors.blue,
                                                                        ),
                                                                        const SizedBox(
                                                                          width:
                                                                              5,
                                                                        ),
                                                                        Text(
                                                                          '${property['type']}'
                                                                              .toCapitalized(),
                                                                          style: const TextStyle(
                                                                              fontSize: 10,
                                                                              color: Colors.blue),
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
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          SizedBox(
                                                                        height:
                                                                            10,
                                                                        child: ElevatedButton(
                                                                            onPressed: () {
                                                                              print(property['cid']);

                                                                              print(property['pid']);
                                                                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                                                  builder: (context) => UpdateProperty(
                                                                                        cid: property['cid'],
                                                                                        pid: property['pid'],
                                                                                      )));
                                                                              //                                                               Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                                              // builder: (context) =>  UpdateProperty(pid: property['pid'],cid: property['cid'],)));
                                                                            },
                                                                            child: const Text(
                                                                              'edit',
                                                                              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                                                                            )),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          SizedBox(
                                                                        height:
                                                                            10,
                                                                        child: ElevatedButton(
                                                                            onPressed: () {},
                                                                            child: const Text(
                                                                              'details',
                                                                              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
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
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Text(
                                                              '${property['addressone']}',
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .blueGrey),
                                                            ),
                                                          )
                                                        ],
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
              ),
              SizedBox(
                width: 350,
                height: 600,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                      elevation: 5,
                      child: Expanded(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  direction: Axis.horizontal,
                                  children: [
                                    const Text('Category : '),
                                    Expanded(
                                      child: Text(
                                        'this is category',
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  direction: Axis.horizontal,
                                  children: [
                                    const Text('Category : '),
                                    Text('this is category')
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Flexible(
                                child: Flex(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  direction: Axis.horizontal,
                                  children: [
                                    const Text('Category : '),
                                    Text('this is category')
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Flexible(
                                child: Flex(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  direction: Axis.horizontal,
                                  children: [
                                    const Text('Category : '),
                                    Text('this is category')
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Flexible(
                                child: Flex(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  direction: Axis.horizontal,
                                  children: [
                                    const Text('Category : '),
                                    Text('this is category')
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Flexible(
                                child: Flex(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  direction: Axis.horizontal,
                                  children: [
                                    const Text('Category : '),
                                    Text('this is category')
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Flexible(
                                child: Flex(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  direction: Axis.horizontal,
                                  children: [
                                    const Text('Category : '),
                                    Text('this is category')
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Flexible(
                                child: Flex(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  direction: Axis.horizontal,
                                  children: [
                                    const Text('Category : '),
                                    Text('this is category')
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Flexible(
                                child: Flex(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  direction: Axis.horizontal,
                                  children: [
                                    const Text('Category : '),
                                    Text('this is category')
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Flexible(
                                child: Flex(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  direction: Axis.horizontal,
                                  children: [
                                    const Text('Category : '),
                                    Text('this is category')
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Flexible(
                                child: Flex(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  direction: Axis.horizontal,
                                  children: [
                                    const Text('Category : '),
                                    Text('this is category')
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Flexible(
                                child: Flex(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  direction: Axis.horizontal,
                                  children: [
                                    const Text('Category : '),
                                    Text('this is category')
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))),
                ),
              )
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
}
