import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  String date = "";
  DateTime selectedDate = DateTime.now();
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  final _empformKey = GlobalKey<FormState>();
  final firstNameEditingController = TextEditingController();
  final secondNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final jobtitleController = TextEditingController();
  final mobileeditingController = TextEditingController();
  final addressEdititngController = TextEditingController();
  final phoneEdititngController = TextEditingController();
  final jobtitleEditingController = TextEditingController();

  final dateEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
    final Jobtitle = TextFormField(
      controller: jobtitleController,
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
        jobtitleController.text = value!;
      },
    );
    DateTime selectedDate = DateTime.now();

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
    final phonenum = InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {
        print(number.phoneNumber);
      },
      onInputValidated: (bool value) {
        print(value);
      },
      spaceBetweenSelectorAndTextField: 0,
      selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.DIALOG, showFlags: false),
      inputDecoration: const InputDecoration(
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
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.disabled,
      selectorTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 10,
      ),
      initialValue: number,
      textFieldController: phoneEdititngController,
      formatInput: false,
      keyboardType:
          const TextInputType.numberWithOptions(signed: true, decimal: true),
      onSaved: (PhoneNumber number) {
        print('On Saved: $number');
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
          RegExp regex = RegExp(r'^.{,}$');
          if (value!.isEmpty) {
            return ("address cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Address");
          }
          return null;
        },
        onSaved: (value) {
          addressEdititngController.text = value!;
        });
    final submitEmp =
        ElevatedButton(onPressed: () {}, child: const Text('ADD'));

    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Unregistered Employees',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            title: const Text('data'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [Text("data"), Text('data')],
                            ),
                            leading: const FlutterLogo(size: 50),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
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
                        'Add Employees',
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
                        padding: const EdgeInsets.all(20),
                        child: Flex(direction: Axis.vertical, children: [
                          Flex(
                            direction: Axis.horizontal,
                            children: [
                              Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: firstNameField,
                                  )),
                              Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8),
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
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Jobtitle,
                                  )),
                              Flexible(
                                  flex: 1,
                                  child: Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: TextFormField( 
                                        controller: dateEditingController,
                                        style: const TextStyle(fontSize: 14),
                                        decoration: const InputDecoration(
                                            errorStyle: TextStyle(
                                              fontSize: 9,
                                            ),
                                            fillColor: Colors.black12,
                                            labelStyle: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                            labelText: 'Select Date'),
                                        // The validator receives the text that the user has entered.
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
                                    padding: const EdgeInsets.all(8.0),
                                    child: phonenum,
                                  ))
                            ],
                          ),
                          addressField,
                          Expanded(child: Container()),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: submitEmp)
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
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;

        dateEditingController.text =
            "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
      });
    }
  }
}
