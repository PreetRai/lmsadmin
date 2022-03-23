import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lmsadmin/model/user_model.dart';
import 'package:lmsadmin/pages/contacts/contacts.dart';
import 'package:lmsadmin/pages/contacts/display_contacts_details.dart';
import 'package:uuid/uuid.dart';

import '../../widgets/app_bar.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/header.dart';

class AddProperties extends StatefulWidget {
  const AddProperties({Key? key}) : super(key: key);

  @override
  _AddPropertiesState createState() => _AddPropertiesState();
}

enum Propertycategory { regular, premium }

enum PropertyType { retail, project }

enum PropertySubType { flat, bunglow, renovation }

class _AddPropertiesState extends State<AddProperties> {
  TextEditingController categoryEditingController = TextEditingController();
  TextEditingController propertyTypeEditingController = TextEditingController();
  TextEditingController propertySubtypeEditingController =
      TextEditingController();
  TextEditingController addressOneEditingController = TextEditingController();
  TextEditingController addressTwoEditingController = TextEditingController();
  TextEditingController contractorNameEditingController =
      TextEditingController();
  TextEditingController architectInteriorNameEditingController =
      TextEditingController();
  TextEditingController supervisorNameEditingController =
      TextEditingController();
  TextEditingController contractorNumEditingController =
      TextEditingController();
  TextEditingController archinteriorNumEditingController =
      TextEditingController();
  TextEditingController supervisorNumEditingController =
      TextEditingController();
  TextEditingController propertyDetailsEditingController =
      TextEditingController();
  final _addcontactKey = GlobalKey<FormState>();
  Propertycategory? _category = Propertycategory.regular;

  PropertyType? _type = PropertyType.retail;

  PropertySubType? _subType = PropertySubType.flat;

  @override
  Widget build(BuildContext context) {
    //First name
    final contractorNameField = TextFormField(
        controller: contractorNameEditingController,
        style: const TextStyle(fontSize: 14),
        decoration: const InputDecoration(
            errorStyle: TextStyle(
              fontSize: 9,
            ),
            fillColor: Colors.black12,
            labelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            labelText: 'Contractor Name'),
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
          contractorNameEditingController.text = value!;
        });

//phone
    final contractorPhnEditingController = TextFormField(
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
          labelText: 'Contractor Phone number'),
      keyboardType:
          const TextInputType.numberWithOptions(signed: true, decimal: true),
      controller: contractorNumEditingController,
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
      onSaved: (value) {
        contractorNumEditingController.text = value!;
      },
    );
    //First name
    final archinteriorNameFeild = TextFormField(
        controller: architectInteriorNameEditingController,
        style: const TextStyle(fontSize: 14),
        decoration: const InputDecoration(
            errorStyle: TextStyle(
              fontSize: 9,
            ),
            fillColor: Colors.black12,
            labelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            labelText: 'Architecture/Interior Name'),
        // The validator receives the text that the user has entered.
        validator: (value) {
          RegExp regex = RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("Architecture/Interior Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          architectInteriorNameEditingController.text = value!;
        });

//phone
    final archinteriorNumEditingFeild = TextFormField(
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
          labelText: 'Architecture/Interior Phone number'),
      keyboardType:
          const TextInputType.numberWithOptions(signed: true, decimal: true),
      controller: archinteriorNumEditingController,
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
      onSaved: (value) {
        archinteriorNumEditingController.text = value!;
      },
    );
    //First name
    final supervisorNameField = TextFormField(
        controller: supervisorNameEditingController,
        style: const TextStyle(fontSize: 14),
        decoration: const InputDecoration(
            errorStyle: TextStyle(
              fontSize: 9,
            ),
            fillColor: Colors.black12,
            labelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            labelText: 'Supervisor Name'),
        // The validator receives the text that the user has entered.
        validator: (value) {
          RegExp regex = RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("Supervisor Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          supervisorNameEditingController.text = value!;
        });

//phone
    final supervisorPhnEditingField = TextFormField(
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
          labelText: 'Supervisor Phone number'),
      keyboardType:
          const TextInputType.numberWithOptions(signed: true, decimal: true),
      controller: supervisorNumEditingController,
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
      onSaved: (value) {
        supervisorNumEditingController.text = value!;
      },
    );

    final categoryradiofield = Row(
      children: <Widget>[
        const SizedBox(width: 100, child: Text('Category:')),
        Radio<Propertycategory>(
          value: Propertycategory.regular,
          groupValue: _category,
          onChanged: (Propertycategory? value) {
            setState(() {
              _category = value;
            });
          },
        ),
        const Text('Regular'),
        Radio<Propertycategory>(
          value: Propertycategory.premium,
          groupValue: _category,
          onChanged: (Propertycategory? value) {
            setState(() {
              _category = value;
            });
          },
        ),
        const Text('Premium'),
      ],
    );

    final propertytyperadiofield = Row(
      children: <Widget>[
        const SizedBox(width: 100, child: Text('Property Type:')),
        Radio<PropertyType>(
          value: PropertyType.retail,
          groupValue: _type,
          onChanged: (PropertyType? value) {
            setState(() {
              _type = value;
            });
          },
        ),
        const Text('Retails'),
        Radio<PropertyType>(
          value: PropertyType.project,
          groupValue: _type,
          onChanged: (PropertyType? value) {
            setState(() {
              _type = value;
            });
          },
        ),
        const Text('Project'),
      ],
    );

    final propertysubtyperadiofield = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const SizedBox(width: 100, child: Text('Property Subtype:')),
        Radio<PropertySubType>(
          value: PropertySubType.flat,
          groupValue: _subType,
          onChanged: (PropertySubType? value) {
            setState(() {
              _subType = value;
            });
          },
        ),
        const Text('Flat'),
        Radio<PropertySubType>(
          value: PropertySubType.bunglow,
          groupValue: _subType,
          onChanged: (PropertySubType? value) {
            setState(() {
              _subType = value;
            });
          },
        ),
        const Text('Bunglow'),
        Radio<PropertySubType>(
          value: PropertySubType.renovation,
          groupValue: _subType,
          onChanged: (PropertySubType? value) {
            setState(() {
              _subType = value;
            });
          },
        ),
        const Text('Renovation'),
      ],
    );

    //address
    final addressOneField = TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: 4,
        enabled: true,
        controller: addressOneEditingController,
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
          addressOneEditingController.text = value!;
        });

    //addresstwo
    final addresstwoField = TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: 4,
        enabled: true,
        controller: addressTwoEditingController,
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
          addressTwoEditingController.text = value!;
        });

    //addresstwo
    final propertdetailsField = TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: 4,
        enabled: true,
        controller: propertyDetailsEditingController,
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
            labelText: 'Property Details'),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value!.isEmpty) {
            return ("details cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          propertyDetailsEditingController.text = value!;
        });
    return Scaffold(
        appBar: const CustomAppBar(),
        drawer: const AppDrawer(),
        body: Container(
            color: Colors.black12,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Header(
                headerTitle: 'Property',
                addButton: ElevatedButton(
                  onPressed: () => setState(() {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const Contactsdetails()));
                  }),
                  child: const Text('Show Contacts'),
                ),
              ),
              Flexible(
                child: SizedBox(
                  width: 500,
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              'Add Property',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        Form(
                          key: _addcontactKey,
                          child: Expanded(
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Column(children: [
                                Expanded(
                                  child: SizedBox(
                                    child: ListView(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: categoryradiofield,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: propertytyperadiofield,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: propertysubtyperadiofield,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: addressOneField,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: addresstwoField,
                                        ),
                                        Flex(
                                            direction: Axis.horizontal,
                                            children: [
                                              Flexible(
                                                  child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: contractorNameField,
                                              )),
                                              Flexible(
                                                  child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child:
                                                    contractorPhnEditingController,
                                              ))
                                            ]),
                                        Flex(
                                            direction: Axis.horizontal,
                                            children: [
                                              Flexible(
                                                  child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: archinteriorNameFeild,
                                              )),
                                              Flexible(
                                                  child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child:
                                                    archinteriorNumEditingFeild,
                                              ))
                                            ]),
                                        Flex(
                                            direction: Axis.horizontal,
                                            children: [
                                              Flexible(
                                                  child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: supervisorNameField,
                                              )),
                                              Flexible(
                                                  child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child:
                                                    supervisorPhnEditingField,
                                              ))
                                            ]),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: propertdetailsField,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            addProperties();
                                            Navigator.of(context).pushReplacement(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Contactsdetails()));
                                          },
                                          child: const Text('Add')),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.red),
                                          onPressed: () {
                                            Navigator.of(context).pushReplacement(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Contactsdetails()));
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
                ),
              )
            ])));
  }

  void addProperties() async {
    if (_addcontactKey.currentState!.validate()) {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      String cid = DisplayConDetails.cid.value;
      Uuid uuid = const Uuid();
      String pid = uuid.v4();
      PropertyModel propertyModel = PropertyModel();
      // writing all the values
      propertyModel.cid = cid;
      propertyModel.pid = pid;
      propertyModel.category = _category.toString().split('.').last;
      propertyModel.type = _type.toString().split('.').last;
      propertyModel.subtype = _subType.toString().split('.').last;
      propertyModel.addressone = addressOneEditingController.text;
      propertyModel.addresstwo = addressTwoEditingController.text;
      propertyModel.contractor = contractorNameEditingController.text;
      propertyModel.contractorphn = contractorNumEditingController.text;
      propertyModel.supervisor = supervisorNameEditingController.text;
      propertyModel.supervisorphn = supervisorNumEditingController.text;
      propertyModel.architect = architectInteriorNameEditingController.text;
      propertyModel.architectphn = archinteriorNumEditingController.text;
      propertyModel.details = propertyDetailsEditingController.text;
      await firebaseFirestore
          .collection("Property")
          .doc(pid)
          .set(propertyModel.toMap());
      await firebaseFirestore
          .collection("Contacts")
          .doc(cid)
          .collection("Property")
          .doc(pid)
          .set(propertyModel.toMap());

      Fluttertoast.showToast(msg: "Contact added successfully :) ");
      _addcontactKey.currentState?.reset();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Contactsdetails()));
    }
  }

  getnamecount() async {
    final QuerySnapshot result =
        await FirebaseFirestore.instance.collection('Employees').get();
    final List<DocumentSnapshot> document = result.docs;
    int x = document.length.toInt();

    var employees = [];

    for (var i = 0; i <= x - 1; i++) {
      employees.add(
          '${document.elementAt(i).get('firstName')} ${document.elementAt(i).get('secondName')}');
    }
    return employees.toList();
  }
}
