import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lmsadmin/pages/contacts/update_contacts.dart';

class DisplayConDetails extends StatefulWidget {
  static ValueNotifier<String> cid = ValueNotifier('');
  const DisplayConDetails({
    Key? key,
  }) : super(key: key);

  @override
  _DisplayConDetailsState createState() => _DisplayConDetailsState();
}

class _DisplayConDetailsState extends State<DisplayConDetails> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 6,
      child: Card(
        color: Colors.white,
        child: Expanded(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: ValueListenableBuilder(
              valueListenable: DisplayConDetails.cid,
              builder: (BuildContext context, String newValue, Widget? child) {
                if (newValue == '') {
                  return const Center(
                      child: Text('Select a Contact for the details'));
                }
                return FutureBuilder(
                  future: getuser(newValue),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const Center(
                          child: SizedBox(
                              height: 50,
                              width: 50,
                              child: CircularProgressIndicator()),
                        );
                      default:
                        Map details = snapshot.data!;
                        var employeename;
                        if (details['employee'] == null) {
                          employeename = 'none';
                        } else {
                          employeename = details['employeename'];
                        }
                        return Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  elevation: 10,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SizedBox(
                                                height: 90,
                                                child: Image.asset(
                                                  'assets/images/jh.png',
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    '${details['firstName']} ${details['secondName']}',
                                                    style: const TextStyle(
                                                        fontSize: 20),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text('Email :- ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Flexible(
                                            child: SizedBox(
                                                child: Text(
                                              '${details['email']}',
                                            )),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text('Mobile no. :- ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('${details['phone']}'),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text('Address Line 1:- ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Flexible(
                                              child: SizedBox(
                                                  width: 150,
                                                  child: Text(
                                                      '${details['addressone']}'))),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text('Address Line 2:- ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Flexible(
                                              child: SizedBox(
                                                  width: 150,
                                                  child: Text(
                                                      '${details['addresstwo']}'))),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text('Contact By:- ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Flexible(
                                              child: SizedBox(
                                                  width: 150,
                                                  child: Text(
                                                      '${details['contactby']}'))),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text('Employee :- ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Flexible(
                                              child: SizedBox(
                                                  width: 150,
                                                  child:
                                                      Text('${employeename}'))),
                                        ),
                                        const Expanded(child: SizedBox()),
                                        SizedBox(
                                          width: 300,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: ElevatedButton(
                                                    onPressed: () {
                                                      String cid =
                                                          details['cid'];
                                                      Navigator.of(context)
                                                          .pushReplacement(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          UpdateContact(
                                                                            cid:
                                                                                cid,
                                                                          )));
                                                    },
                                                    child:
                                                        const Text('Update')),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            primary:
                                                                Colors.red),
                                                    onPressed: () {
                                                      setState(() {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "Contacts")
                                                            .doc(details['cid'])
                                                            .delete();
                                                        DisplayConDetails
                                                            .cid.value = "";
                                                      });
                                                    },
                                                    child:
                                                        const Text('Delete')),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Expanded(
                                child: SizedBox(
                                  height: double.infinity,
                                  child: Card(
                                    elevation: 10,
                                    child: Center(child: Text('data')),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                    }
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<Map> getuser(String newValue) async {
    var collection = FirebaseFirestore.instance.collection('Contacts');
    var docSnapshot = await collection.doc(newValue).get();
    Map<dynamic, dynamic> data = docSnapshot.data()!;

    return data;
  }
}
