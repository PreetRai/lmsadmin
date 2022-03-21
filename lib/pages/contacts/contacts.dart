import 'package:flutter/material.dart';
import 'package:lmsadmin/pages/contacts/add_contacts.dart';
import 'package:lmsadmin/pages/contacts/display_contacts.dart';
import 'package:lmsadmin/pages/contacts/display_contacts_details.dart';
import 'package:lmsadmin/widgets/app_drawer.dart';
import 'package:lmsadmin/widgets/header.dart';
import '../../widgets/app_bar.dart';

class Contactsdetails extends StatefulWidget {
  const Contactsdetails({
    Key? key,
  }) : super(key: key);

  @override
  _ContactsdetailsState createState() => _ContactsdetailsState();
}

class _ContactsdetailsState extends State<Contactsdetails> {
  String buttonText = 'Add Contacts';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        drawer: const AppDrawer(),
        body: Container(
          color: Colors.black12,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Header(
                headerTitle: 'Contacts',
                addButton: ElevatedButton(
                  onPressed: () => setState(() {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const AddContacts()));
                  }),
                  child:const Text('Add Contacts'),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    ContactNames(),
                    DisplayConDetails(),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
