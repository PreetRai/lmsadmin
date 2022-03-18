import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lmsadmin/pages/employees/employees.dart';
import 'package:lmsadmin/widgets/app_drawer.dart';
import 'package:lmsadmin/widgets/header.dart';
import '../../model/user_model.dart';
import '../../widgets/app_bar.dart';

class Updateemployeedetails extends StatefulWidget {
  final String uid;
  const Updateemployeedetails({Key? key, required this.uid}) : super(key: key);

  @override
  _UpdateemployeedetailsState createState() => _UpdateemployeedetailsState();
}

class _UpdateemployeedetailsState extends State<Updateemployeedetails> {
  DateTime selectedDate = DateTime.now();
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  final _empformKey = GlobalKey<FormState>();
  final firstNameEditingController = TextEditingController();

  final uidEditingController = TextEditingController();
  final secondNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final mobileeditingController = TextEditingController();
  final addressEdititngController = TextEditingController();
  final phoneEdititngController = TextEditingController();
  final jobtitleEditingController = TextEditingController();

  final dateEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    getuser(widget.uid);
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

    //Jobtitle
    final jobtitle = TextFormField(
      controller: jobtitleEditingController,
      style: const TextStyle(fontSize: 14),
      decoration: const InputDecoration(
          errorStyle: TextStyle(
            fontSize: 9,
          ),
          fillColor: Colors.black12,
          labelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          labelText: 'Job Title'),
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value!.isEmpty) {
          return ("Jobtitle Name cannot be Empty");
        }
        return null;
      },
      onSaved: (value) {
        jobtitleEditingController.text = value!;
      },
    );

    //email field
    final emailEMPField = TextFormField(
      enabled: true,
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
    final addressField = TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: 4,
        enabled: true,
        controller: addressEdititngController,
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
            labelText: 'Address'),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value!.isEmpty) {
            return ("address cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          addressEdititngController.text = value!;
        });
    final submitEmp = ElevatedButton(
        onPressed: () {
          updateemp(uidEditingController.text);
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const Employeedetails()));
        },
        child: const Text('Update'));
    return Scaffold(
        appBar: const CustomAppBar(),
        drawer: const AppDrawer(),
        body: Container(
          color: Colors.black12,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Header(
                headerTitle: 'Employees',
                addButton: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const Employeedetails()));
                  },
                  child: const Text('Show Employes'),
                ),
              ),
              Expanded(
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
                                  'Update Employees',
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
                                  child:
                                      Flex(direction: Axis.vertical, children: [
                                    Flex(
                                      direction: Axis.horizontal,
                                      children: [
                                        Flexible(
                                            flex: 1,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8),
                                              child: firstNameField,
                                            )),
                                        Flexible(
                                            flex: 1,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
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
                                            flex: 1,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8),
                                              child: jobtitle,
                                            )),
                                        Flexible(
                                            flex: 1,
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8),
                                                child: TextFormField(
                                                  controller:
                                                      dateEditingController,
                                                  style: const TextStyle(
                                                      fontSize: 14),
                                                  decoration:
                                                      const InputDecoration(
                                                          errorStyle: TextStyle(
                                                            fontSize: 9,
                                                          ),
                                                          fillColor:
                                                              Colors.black12,
                                                          labelStyle: TextStyle(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          labelText:
                                                              'Select Date'),
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return ("Second Name cannot be Empty");
                                                    }
                                                    return null;
                                                  },
                                                  onSaved: (value) {
                                                    dateEditingController.text =
                                                        value!;
                                                  },
                                                  onTap: () {
                                                    _selectDate(context);
                                                  },
                                                  readOnly: true,
                                                ))),
                                        Flexible(flex: 1, child: Container()),
                                      ],
                                    ),
                                    Flex(
                                      direction: Axis.horizontal,
                                      children: [
                                        Flexible(flex: 2, child: emailEMPField),
                                        Flexible(
                                            flex: 1,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: phonenum,
                                            ))
                                      ],
                                    ),
                                    addressField,
                                    Expanded(child: Container()),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: submitEmp,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.red),
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const Employeedetails()));
                                              },
                                              child: const Text('Cancel')),
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
              )
            ],
          ),
        ));
  }

  void updateemp(String uid) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    EmpModel employeeModel = EmpModel();
    employeeModel.email = emailEditingController.text;
    employeeModel.uid = uid;
    employeeModel.firstName = firstNameEditingController.text;
    employeeModel.secondName = secondNameEditingController.text;
    employeeModel.address = addressEdititngController.text;
    employeeModel.joiningDate = dateEditingController.text;
    employeeModel.jobTile = jobtitleEditingController.text;
    employeeModel.phone = phoneEdititngController.text;
    employeeModel.isAdmin = false;
    await firebaseFirestore
        .collection("Employees")
        .doc(uid)
        .set(employeeModel.toMap());
    Fluttertoast.showToast(msg: "Employee updated successfully :) ");
    _empformKey.currentState?.reset();
    firstNameEditingController.clear();
    secondNameEditingController.clear();
    dateEditingController.clear();
    jobtitleEditingController.clear();
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1990),
      lastDate: DateTime(3000),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;

        dateEditingController.text =
            "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
      });
    }
  }

  Future<Map> getuser(String newValue) async {
    var collection = FirebaseFirestore.instance.collection('Employees');
    var docSnapshot = await collection.doc(newValue).get();
    Map<dynamic, dynamic> data = docSnapshot.data()!;
    firstNameEditingController.text = data['firstName'];
    secondNameEditingController.text = data['secondName'];
    jobtitleEditingController.text = data['jobtitle'];
    dateEditingController.text = data['joiningdate'];
    emailEditingController.text = data['email'];
    phoneEdititngController.text = data['phone'];
    addressEdititngController.text = data['address'];
    uidEditingController.text = data['uid'];
    return data;
  }
}
