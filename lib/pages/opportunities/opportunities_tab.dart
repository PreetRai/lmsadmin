// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lmsadmin/model/user_model.dart';
import 'package:lmsadmin/pages/contacts/display_contacts_details.dart';
import 'package:lmsadmin/pages/opportunities/opportunity_list.dart';
import 'package:uuid/uuid.dart';

class OpportunityTab extends StatefulWidget {
  static ValueNotifier<String> oid = ValueNotifier('');
  const OpportunityTab({Key? key}) : super(key: key);

  @override
  State<OpportunityTab> createState() => _OpportunityTab();
}

class _OpportunityTab extends State<OpportunityTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Opportunities:',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              OpportunityList(),
              // Expanded(
              //   child: SizedBox(
              //     child: Card(
              //         elevation: 5,
              //         child: ValueListenableBuilder(
              //             valueListenable: OpportunityTab.pid,
              //             builder:
              //                 (BuildContext context, value, Widget? child) {
              //               var visible = false;
              //               if (value == '') {
              //                 visible = false;
              //               } else {
              //                 visible = true;
              //               }
              //               return Visibility(
              //                 visible: visible,
              //                 replacement: Expanded(
              //                   child: Center(
              //                       child:
              //                           Text('Select a property for details')),
              //                 ),
              //                 child: FutureBuilder(
              //                     future: getproperty(OpportunityTab.pid.value),
              //                     builder: (BuildContext context,
              //                         AsyncSnapshot snapshot) {
              //                       switch (snapshot.connectionState) {
              //                         case ConnectionState.waiting:
              //                           return Center(
              //                               child: const SizedBox(
              //                                   width: 50,
              //                                   height: 50,
              //                                   child:
              //                                       CircularProgressIndicator()));

              //                         default:
              //                       }

              //                       Map details = snapshot.data!;

              //                       return Expanded(
              //                           child: Padding(
              //                         padding: const EdgeInsets.all(8.0),
              //                         child: Flex(
              //                             direction: Axis.vertical,
              //                             children: [
              //                               Flexible(
              //                                 child: ListView(
              //                                   children: [
              //                                     const Align(
              //                                         alignment:
              //                                             Alignment.topLeft,
              //                                         child: Text(
              //                                             'Property Details')),
              //                                     const SizedBox(
              //                                       height: 30,
              //                                     ),
              //                                     Padding(
              //                                       padding: EdgeInsets.all(8),
              //                                       child: Flexible(
              //                                         child: Flex(
              //                                           crossAxisAlignment:
              //                                               CrossAxisAlignment
              //                                                   .start,
              //                                           direction:
              //                                               Axis.horizontal,
              //                                           children: [
              //                                             const Text(
              //                                                 'Category : '),
              //                                             Expanded(
              //                                               child: Text(
              //                                                 '${details['category']}',
              //                                                 softWrap: true,
              //                                               ),
              //                                             )
              //                                           ],
              //                                         ),
              //                                       ),
              //                                     ),
              //                                     Padding(
              //                                       padding: EdgeInsets.all(8),
              //                                       child: Flexible(
              //                                         child: Flex(
              //                                           crossAxisAlignment:
              //                                               CrossAxisAlignment
              //                                                   .start,
              //                                           direction:
              //                                               Axis.horizontal,
              //                                           children: [
              //                                             const Text('Type : '),
              //                                             Text(
              //                                                 '${details['type']}')
              //                                           ],
              //                                         ),
              //                                       ),
              //                                     ),
              //                                     Padding(
              //                                       padding: EdgeInsets.all(8),
              //                                       child: Flexible(
              //                                         child: Flex(
              //                                           crossAxisAlignment:
              //                                               CrossAxisAlignment
              //                                                   .start,
              //                                           direction:
              //                                               Axis.horizontal,
              //                                           children: [
              //                                             const Text(
              //                                                 'Subtype : '),
              //                                             Text(
              //                                                 '${details['subtype']}')
              //                                           ],
              //                                         ),
              //                                       ),
              //                                     ),
              //                                     Padding(
              //                                       padding: EdgeInsets.all(8),
              //                                       child: Flexible(
              //                                         child: Flex(
              //                                           crossAxisAlignment:
              //                                               CrossAxisAlignment
              //                                                   .start,
              //                                           direction:
              //                                               Axis.horizontal,
              //                                           children: [
              //                                             const Text(
              //                                                 'Address Line 1 : '),
              //                                             Text(
              //                                                 '${details['addressone']}')
              //                                           ],
              //                                         ),
              //                                       ),
              //                                     ),
              //                                     Padding(
              //                                       padding: EdgeInsets.all(8),
              //                                       child: Flexible(
              //                                         child: Flex(
              //                                           crossAxisAlignment:
              //                                               CrossAxisAlignment
              //                                                   .start,
              //                                           direction:
              //                                               Axis.horizontal,
              //                                           children: [
              //                                             const Text(
              //                                                 'Address Line 2 : '),
              //                                             Text(
              //                                                 '${details['addresstwo']}')
              //                                           ],
              //                                         ),
              //                                       ),
              //                                     ),
              //                                     Padding(
              //                                       padding: EdgeInsets.all(8),
              //                                       child: Flexible(
              //                                         child: Flex(
              //                                           crossAxisAlignment:
              //                                               CrossAxisAlignment
              //                                                   .start,
              //                                           direction:
              //                                               Axis.horizontal,
              //                                           children: [
              //                                             const Text(
              //                                                 'Contractor : '),
              //                                             Text(
              //                                                 '${details['contractor']}')
              //                                           ],
              //                                         ),
              //                                       ),
              //                                     ),
              //                                     Padding(
              //                                       padding: EdgeInsets.all(8),
              //                                       child: Flexible(
              //                                         child: Flex(
              //                                           crossAxisAlignment:
              //                                               CrossAxisAlignment
              //                                                   .start,
              //                                           direction:
              //                                               Axis.horizontal,
              //                                           children: [
              //                                             const Text(
              //                                                 'Contractor Number : '),
              //                                             Text(
              //                                                 '${details['contractorphn']}'),
              //                                           ],
              //                                         ),
              //                                       ),
              //                                     ),
              //                                     Padding(
              //                                       padding: EdgeInsets.all(8),
              //                                       child: Flexible(
              //                                         child: Flex(
              //                                           crossAxisAlignment:
              //                                               CrossAxisAlignment
              //                                                   .start,
              //                                           direction:
              //                                               Axis.horizontal,
              //                                           children: [
              //                                             const Text(
              //                                                 'Architectutre/Interior : '),
              //                                             Text(
              //                                                 '${details['architect']}'),
              //                                             const SizedBox(
              //                                               width: 10,
              //                                             ),
              //                                           ],
              //                                         ),
              //                                       ),
              //                                     ),
              //                                     Padding(
              //                                       padding: EdgeInsets.all(8),
              //                                       child: Flexible(
              //                                         child: Flex(
              //                                           crossAxisAlignment:
              //                                               CrossAxisAlignment
              //                                                   .start,
              //                                           direction:
              //                                               Axis.horizontal,
              //                                           children: [
              //                                             const Text(
              //                                                 'Architectutre/Interior Number : '),
              //                                             Text(
              //                                                 '${details['architectphn']}'),
              //                                           ],
              //                                         ),
              //                                       ),
              //                                     ),
              //                                     Padding(
              //                                       padding: EdgeInsets.all(8),
              //                                       child: Flexible(
              //                                         child: Flex(
              //                                           crossAxisAlignment:
              //                                               CrossAxisAlignment
              //                                                   .start,
              //                                           direction:
              //                                               Axis.horizontal,
              //                                           children: [
              //                                             const Text(
              //                                                 'Supervisor : '),
              //                                             Text(
              //                                                 '${details['supervisor']}'),
              //                                             const SizedBox(
              //                                               width: 10,
              //                                             ),
              //                                           ],
              //                                         ),
              //                                       ),
              //                                     ),
              //                                     Padding(
              //                                       padding: EdgeInsets.all(8),
              //                                       child: Flexible(
              //                                         child: Flex(
              //                                           crossAxisAlignment:
              //                                               CrossAxisAlignment
              //                                                   .start,
              //                                           direction:
              //                                               Axis.horizontal,
              //                                           children: [
              //                                             const Text(
              //                                                 'Supervisor Number : '),
              //                                             Text(
              //                                                 '${details['supervisorphn']}'),
              //                                           ],
              //                                         ),
              //                                       ),
              //                                     ),
              //                                     Padding(
              //                                       padding: EdgeInsets.all(8),
              //                                       child: Flexible(
              //                                         child: Flex(
              //                                           crossAxisAlignment:
              //                                               CrossAxisAlignment
              //                                                   .start,
              //                                           direction:
              //                                               Axis.horizontal,
              //                                           children: [
              //                                             const Text(
              //                                                 'Property Details : '),
              //                                             Text(
              //                                                 '${details['details']}')
              //                                           ],
              //                                         ),
              //                                       ),
              //                                     ),
              //                                   ],
              //                                 ),
              //                               ),
              //                               Align(
              //                                 alignment: Alignment.bottomRight,
              //                                 child: ElevatedButton(
              //                                   onPressed: () {
              //                                     if (details['oid'] == null ||
              //                                         details['oid'] == '') {
              //                                       createLead(
              //                                           OpportunityTab
              //                                               .pid.value,
              //                                           DisplayConDetails
              //                                               .cid.value);
              //                                       OpportunityTab.pid.value =
              //                                           '';
              //                                     } else {
              //                                       Fluttertoast.showToast(
              //                                           msg: 'Already Exists');
              //                                     }
              //                                   },
              //                                   child:
              //                                       Text('Create Opportunity'),
              //                                 ),
              //                               ),
              //                             ]),
              //                       ));
              //                     }),
              //               );
              //             })),
              //   ),
              // ),
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

  createLead(String? pid, String? cid) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Uuid uuid = Uuid();
    String oid = uuid.v4();
    OpportunityModel opportunityModel = OpportunityModel();
    // writing all the values
    opportunityModel.cid = cid;
    opportunityModel.pid = pid;
    opportunityModel.oid = oid;

    await firebaseFirestore
        .collection('Property')
        .doc(pid)
        .update({'oid': oid});
    await firebaseFirestore
        .collection('Contacts')
        .doc(cid)
        .collection('Property')
        .doc(pid)
        .update({'oid': oid});
    await firebaseFirestore
        .collection("Opportunity")
        .doc(oid)
        .set(opportunityModel.toMap());

    await firebaseFirestore
        .collection("Contacts")
        .doc(cid)
        .collection("Opportunity")
        .doc(oid)
        .set(opportunityModel.toMap());

    await firebaseFirestore
        .collection("Property")
        .doc(pid)
        .collection("Opportunity")
        .doc(oid)
        .set(opportunityModel.toMap());

    Fluttertoast.showToast(msg: "opportunity created");
  }
}
