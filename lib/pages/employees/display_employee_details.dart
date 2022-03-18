import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lmsadmin/pages/employees/update_employee.dart';

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
        child: Expanded(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: ValueListenableBuilder(
              valueListenable: DisplayEmpDetails.uid,
              builder: (BuildContext context, String newValue, Widget? child) {
                if (newValue == '') {
                  return const Center(
                      child: Text('Select an Employee fo the details'));
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
                        return Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  elevation: 10,
                                  child: SizedBox(
                                    width: 300,
                                    height: 500,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: Padding(
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
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              '${details['firstName']} ${details['secondName']}',
                                              style:
                                                  const TextStyle(fontSize: 20),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:
                                                Text('${details['jobtitle']}'),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text('Date of joining : ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(
                                                    '${details['joiningdate']}'),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text('Email : ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Flexible(
                                                  child: SizedBox(
                                                      width: 130,
                                                      child: Align(
                                                        alignment: Alignment
                                                            .bottomRight,
                                                        child: Text(
                                                          '${details['email']}',
                                                        ),
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text('Mobile no. : ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text('${details['phone']}'),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text('Address : ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text('${details['address']}'),
                                              ],
                                            ),
                                          ),
                                          const Expanded(child: SizedBox()),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: ElevatedButton(
                                                      onPressed: () {
                                                        String uid =
                                                            details['uid'];
                                                        Navigator.of(context)
                                                            .pushReplacement(
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            Updateemployeedetails(
                                                                              uid: uid,
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
                                                      onPressed: () {},
                                                      child:
                                                          const Text('Delete')),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
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
    var collection = FirebaseFirestore.instance.collection('Employees');
    var docSnapshot = await collection.doc(newValue).get();
    Map<dynamic, dynamic> data = docSnapshot.data()!;

    return data;
  }
}
