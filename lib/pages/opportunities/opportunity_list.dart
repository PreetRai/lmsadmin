import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lmsadmin/extentions/string_extension.dart';
import 'package:lmsadmin/pages/opportunities/opportunities_tab.dart';

import '../contacts/display_contacts_details.dart';

class OpportunityList extends StatefulWidget {
  const OpportunityList({Key? key}) : super(key: key);

  @override
  State<OpportunityList> createState() => _OpportunityListState();
}

class _OpportunityListState extends State<OpportunityList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 700,
      child: Expanded(
        child: FutureBuilder(
            future: getopportunitycount(),
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
                            future: getopportunitydata(value),
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
                                  Map opportunity = snapshot.data!;
                                  return TextButton(
                                    onPressed: () {
                                      //   PropertTab.pid.value = property['pid'];
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
                                                              '${opportunity['firstName'].toString().toCapitalized()} ${opportunity['secondName'].toString().toCapitalized()} | ${opportunity['category'].toString().toCapitalized()}',
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
                                                                  '${opportunity['type']}'
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
                                                                        style: ElevatedButton.styleFrom(
                                                                            primary: Colors
                                                                                .red),
                                                                        onPressed:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            FirebaseFirestore.instance.collection("Opportunity").doc(opportunity['oid']).delete();

                                                                            OpportunityTab.oid.value =
                                                                                "";
                                                                            FirebaseFirestore.instance.collection("Property").doc(opportunity['pid']).update({
                                                                              'oid': null
                                                                            });
                                                                            FirebaseFirestore.instance.collection("Contacts").doc(opportunity['cid']).collection("Property").doc(opportunity['pid']).update({
                                                                              'oid': null
                                                                            });
                                                                            FirebaseFirestore.instance.collection("Contacts").doc(opportunity['cid']).collection("Opportunity").doc(opportunity['oid']).delete();
                                                                            FirebaseFirestore.instance.collection("Opportunity").doc(opportunity['oid']).collection('Opportunity').get().then((value) {
                                                                              for (DocumentSnapshot ds in value.docs) {
                                                                                ds.reference.delete();
                                                                              }
                                                                            });
                                                                            FirebaseFirestore.instance.collection("Contacts").doc(opportunity['cid']).collection('Opportunity').get().then((value) {
                                                                              for (DocumentSnapshot ds in value.docs) {
                                                                                ds.reference.delete();
                                                                              }
                                                                            });
                                                                            FirebaseFirestore.instance.collection("Property").doc(opportunity['pid']).collection('Opportunity').get().then((value) {
                                                                              for (DocumentSnapshot ds in value.docs) {
                                                                                ds.reference.delete();
                                                                              }
                                                                            });
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
                                                      '${opportunity['addressone']}',
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

  // getpropertycount() async {
  //   final QuerySnapshot result = await FirebaseFirestore.instance
  //       .collection('Contacts')
  //       .doc(DisplayConDetails.cid.value)
  //       .collection('Property')
  //       .get();
  //   final List<DocumentSnapshot> document = result.docs;
  //   int x = document.length.toInt();
  //   return x;
  // }

  getopportunitycount() async {
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('Contacts')
        .doc(DisplayConDetails.cid.value)
        .collection('Opportunity')
        .get();
    final List<DocumentSnapshot> document = result.docs;
    int x = document.length.toInt();
    return x;
  }

  Future<Map> getopportunitydata(int snap) async {
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('Contacts')
        .doc(DisplayConDetails.cid.value)
        .collection('Property')
        .get();
    final List<DocumentSnapshot> document = result.docs;
    var elementAt = {};
    elementAt['pid'] = '${document.elementAt(snap).get('pid')}';
    elementAt['cid'] = '${document.elementAt(snap).get('cid')}';

    final DocumentSnapshot<Map<String, dynamic>> opportunitycontacts =
        await FirebaseFirestore.instance
            .collection('Contacts')
            .doc(elementAt['cid'])
            .get();

    final DocumentSnapshot<Map<String, dynamic>> opportunityproperty =
        await FirebaseFirestore.instance
            .collection('Property')
            .doc(elementAt['pid'])
            .get();

    var opportunity = {};
    opportunity.addEntries(opportunitycontacts.data()!.entries);
    opportunity.addEntries(opportunityproperty.data()!.entries);
    return opportunity;
  }
}
