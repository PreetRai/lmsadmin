import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lmsadmin/model/user_model.dart';
import 'package:lmsadmin/pages/contacts/contacts.dart';

import '../../widgets/app_bar.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/header.dart';

class UpdateContact extends StatefulWidget {
  final String cid;
  const UpdateContact({Key? key, required this.cid}) : super(key: key);

  @override
  _UpdateContact createState() => _UpdateContact();
}

class _UpdateContact extends State<UpdateContact> {
  String? errorMessage;
  final _empformKey = GlobalKey<FormState>();
  final cidEditingController = TextEditingController();
  final firstNameEditingController = TextEditingController();
  final secondNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final mobileeditingController = TextEditingController();
  final addressoneEdititngController = TextEditingController();

  final addresstwoEdititngController = TextEditingController();
  final phoneEdititngController = TextEditingController();

  // Initial Selected Value
  String? contactbydropdownvalue;

  // List of items in our dropdown menu
  var contactbyitems = [
    'Walk-in',
    'Refference',
    'Scanning',
  ];
  // ignore: prefer_typing_uninitialized_variables
  var selectedName = null;
  String? employeenamesvalue;

  bool visible = false;
  @override
  Widget build(BuildContext context) {
    getuser(widget.cid);
    //First name
    final firstNameField = TextFormField(
        controller: firstNameEditingController,
        style: const TextStyle(fontSize: 14),
        decoration: const InputDecoration(
            errorStyle: TextStyle(
              fontSize: 9,
            ),
            fillColor: Colors.black12,
            labelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            labelText: 'First Name'),
        // The validator receives the text that the user has entered.
        validator: (value) {
          RegExp regex = RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("First Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          secondNameEditingController.text = value!;
        });

    //second name field
    final secondNameField = TextFormField(
      controller: secondNameEditingController,
      style: const TextStyle(fontSize: 14),
      decoration: const InputDecoration(
          errorStyle: TextStyle(
            fontSize: 9,
          ),
          fillColor: Colors.black12,
          labelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          labelText: 'Second Name'),
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value!.isEmpty) {
          return ("Second Name cannot be Empty");
        }
        return null;
      },
      onSaved: (value) {
        secondNameEditingController.text = value!;
      },
    );

    //email field
    final emailEMPField = TextFormField(
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
          errorStyle: TextStyle(
            fontSize: 9,
          ),
          suffixIcon: Icon(Icons.email),
          fillColor: Colors.black12,
          labelStyle: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
          labelText: 'Email'),
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return 'Please Enter a valid email';
        }
        return null;
      },
    );
//phone
    final phonenum = TextFormField(
      decoration: const InputDecoration(
          errorStyle: TextStyle(
            fontSize: 9,
          ),
          suffixIcon: Icon(Icons.call),
          fillColor: Colors.black12,
          labelStyle: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
          labelText: 'Phone number'),
      keyboardType:
          const TextInputType.numberWithOptions(signed: true, decimal: true),
      controller: phoneEdititngController,
      validator: (value) {
        RegExp regex = RegExp(r'^.{10,}$');
        if (value!.isEmpty) {
          return ("Phone Number cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Phone number(Min. 10 Character)");
        }
        return null;
      },
    );

    //address
    final addressoneField = TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: 4,
        enabled: true,
        controller: addressoneEdititngController,
        style: const TextStyle(fontSize: 14),
        decoration: const InputDecoration(
            errorStyle: TextStyle(
              fontSize: 9,
            ),
            suffixIcon: Icon(Icons.location_city),
            fillColor: Colors.black12,
            labelStyle: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
            labelText: 'Address line 1'),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value!.isEmpty) {
            return ("address cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          addressoneEdititngController.text = value!;
        });

    //addresstwo
    final addresstwoField = TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: 4,
        enabled: true,
        controller: addresstwoEdititngController,
        style: const TextStyle(fontSize: 14),
        decoration: const InputDecoration(
            errorStyle: TextStyle(
              fontSize: 9,
            ),
            suffixIcon: Icon(Icons.location_city),
            fillColor: Colors.black12,
            labelStyle: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
            labelText: 'Address Line 2'),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value!.isEmpty) {
            return ("address cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          addresstwoEdititngController.text = value!;
        });

    final submitEmp = ElevatedButton(
        onPressed: () {
          updatecontacts(cidEditingController.text);
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const Contactsdetails()));
        },
        child: const Text('Update'));
    // Initial Selected Value

    return Scaffold(
        appBar: const CustomAppBar(),
        drawer: const AppDrawer(),
        body: Container(
            color: Colors.black12,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Header(
                headerTitle: 'Contacts',
                addButton: ElevatedButton(
                  onPressed: () => setState(() {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const Contactsdetails()));
                  }),
                  child: const Text('Show Contacts'),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: 1000,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Card(
                          color: Colors.white,
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Text(
                                    'Add Contacts',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              Form(
                                key: _empformKey,
                                child: Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Flex(
                                        direction: Axis.vertical,
                                        children: [
                                          Flex(
                                            direction: Axis.horizontal,
                                            children: [
                                              Flexible(
                                                  flex: 1,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 8),
                                                    child: firstNameField,
                                                  )),
                                              Flexible(
                                                  flex: 1,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 8),
                                                    child: secondNameField,
                                                  )),
                                              Flexible(
                                                flex: 1,
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: SizedBox(
                                                    height: 90,
                                                    child: Image.asset(
                                                      'assets/images/jh.png',
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Flex(
                                            direction: Axis.horizontal,
                                            children: [
                                              Flexible(
                                                  flex: 1, child: Container()),
                                            ],
                                          ),
                                          Flex(
                                            direction: Axis.horizontal,
                                            children: [
                                              Flexible(
                                                  flex: 2,
                                                  child: emailEMPField),
                                              Flexible(
                                                  flex: 1,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: phonenum,
                                                  ))
                                            ],
                                          ),
                                          addressoneField,
                                          addresstwoField,
                                          Row(children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child:
                                                        Text('Contact By : '),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: DropdownButton(
                                                      style: const TextStyle(
                                                          fontSize: 15),
                                                      hint: const Text(
                                                          'Select Contact by'),
                                                      value:
                                                          contactbydropdownvalue,
                                                      icon: const Icon(Icons
                                                          .keyboard_arrow_down),
                                                      items: contactbyitems
                                                          .map((String items) {
                                                        return DropdownMenuItem(
                                                          value: items,
                                                          child: Text(items),
                                                        );
                                                      }).toList(),
                                                      onChanged:
                                                          (String? newValue) {
                                                        setState(() {
                                                          contactbydropdownvalue =
                                                              newValue!;
                                                          if (newValue ==
                                                              'Refference') {
                                                            visible = true;
                                                          } else {
                                                            visible = false;
                                                          }
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Visibility(
                                              visible: visible,
                                              child:
                                                  StreamBuilder<QuerySnapshot>(
                                                      stream: FirebaseFirestore
                                                          .instance
                                                          .collection(
                                                              "Employees")
                                                          .snapshots(),
                                                      builder:
                                                          (context, snapshot) {
                                                        int x = snapshot
                                                            .data!.docs.length;
                                                        if (!snapshot.hasData) {
                                                          return const CircularProgressIndicator();
                                                        } else {
                                                          switch (snapshot
                                                              .connectionState) {
                                                            case ConnectionState
                                                                .waiting:
                                                              return const CircularProgressIndicator();

                                                            default:
                                                              List<DropdownMenuItem>
                                                                  employeNamesItems =
                                                                  [];
                                                              for (int i = 0;
                                                                  i < x;
                                                                  i++) {
                                                                DocumentSnapshot
                                                                    snap =
                                                                    snapshot
                                                                        .data!
                                                                        .docs[i];

                                                                employeNamesItems
                                                                    .add(
                                                                        DropdownMenuItem(
                                                                  child: Text(
                                                                    "${snap['firstName']} ${snap['secondName']}",
                                                                  ),
                                                                  value:
                                                                      "${snap['uid']}",
                                                                ));
                                                              }
                                                              return Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Row(
                                                                      children: [
                                                                        const Padding(
                                                                          padding:
                                                                              EdgeInsets.all(8.0),
                                                                          child:
                                                                              Text('Employee : '),
                                                                        ),
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              DropdownButton<dynamic>(
                                                                            style:
                                                                                const TextStyle(fontSize: 15),
                                                                            hint:
                                                                                const Text('Select Employee'),
                                                                            icon:
                                                                                const Icon(Icons.keyboard_arrow_down),
                                                                            items:
                                                                                employeNamesItems,
                                                                            onChanged:
                                                                                (employename) {
                                                                              setState(() {
                                                                                selectedName = employename;
                                                                              });
                                                                            },
                                                                            value:
                                                                                selectedName,
                                                                          ),
                                                                        )
                                                                      ]));
                                                          }
                                                        }
                                                      }),
                                            ),
                                          ]),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: submitEmp,
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
                                                      // Navigator.of(context)
                                                      //     .pushReplacement(
                                                      //         MaterialPageRoute(
                                                      //             builder:
                                                      //                 (context) =>
                                                      //                     const Employeedetails()));
                                                      // print(_auth
                                                      //     .currentUser!.email);
                                                      getnamecount();
                                                    },
                                                    child:
                                                        const Text('Cancel')),
                                              )
                                            ],
                                          )
                                        ]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ])));
  }

  void updatecontacts(String cid) async {
    if (_empformKey.currentState!.validate()) {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      ContactsModel contactsModel = ContactsModel();
      // writing all the values

      var result = await FirebaseFirestore.instance
          .collection('Employees')
          .doc(selectedName)
          .get();

      if (selectedName == null) {
        contactsModel.employee = null;

        contactsModel.employeename = 'None';
      } else {
        contactsModel.employee = selectedName;

        contactsModel.employeename =
            '${result['firstName']} ${result['secondName']}';
      }

      contactsModel.contactby = contactbydropdownvalue;

      contactsModel.employee = selectedName;

      contactsModel.cid = cid;
      contactsModel.email = emailEditingController.text;
      contactsModel.firstName = firstNameEditingController.text;
      contactsModel.secondName = secondNameEditingController.text;
      contactsModel.addressone = addressoneEdititngController.text;
      contactsModel.addresstwo = addresstwoEdititngController.text;
      contactsModel.phone = phoneEdititngController.text;
      await firebaseFirestore
          .collection("Contacts")
          .doc(cid)
          .set(contactsModel.toMap());

      Fluttertoast.showToast(msg: "Contact Updated successfully :) ");
      _empformKey.currentState?.reset();
    }
  }

  getnamecount() async {
    final QuerySnapshot result =
        await FirebaseFirestore.instance.collection('Contacts').get();
    final List<DocumentSnapshot> document = result.docs;
    int x = document.length.toInt();

    var employees = [];

    for (var i = 0; i <= x - 1; i++) {
      employees.add(
          '${document.elementAt(i).get('firstName')} ${document.elementAt(i).get('secondName')}');
    }
    return employees.toList();
  }

  Future<Map> getuser(String newValue) async {
    var collection = FirebaseFirestore.instance.collection('Contacts');
    var docSnapshot = await collection.doc(newValue).get();
    Map<dynamic, dynamic> data = docSnapshot.data()!;
    firstNameEditingController.text = data['firstName'];
    secondNameEditingController.text = data['secondName'];
    emailEditingController.text = data['email'];
    phoneEdititngController.text = data['phone'];

    addressoneEdititngController.text = data['addressone'];

    addresstwoEdititngController.text = data['addresstwo'];

    cidEditingController.text = data['cid'];

    return data;
  }
}
