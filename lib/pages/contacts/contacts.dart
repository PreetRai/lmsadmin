import 'package:flutter/material.dart';
import 'package:lmsadmin/pages/contacts/add_contacts.dart';
import 'package:lmsadmin/widgets/header.dart';

import '../../widgets/app_bar.dart';
import '../../widgets/app_drawer.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  String buttonText = 'Add Contacts';
  bool isVisible = true;
  final Widget addbutton = ElevatedButton(
    onPressed: () {},
    child: const Text('Add Contacts'),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      body: Container(
        color: Colors.black12,
        child: Column(
          children: [
            Header(
              headerTitle: 'Contacts',
              addButton: ElevatedButton(
                onPressed: () => setState(() {
                  if (isVisible == false) {
                    isVisible = !isVisible;
                    buttonText = 'Add Contacts';
                  } else {
                    isVisible = !isVisible;
                    buttonText = 'Show Contacts';
                  }
                }),
                child: Text(buttonText),
              ),
            ),
            Visibility(
              visible: isVisible,
              replacement: const AddContacts(),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 300,
                      height: double.infinity,
                      child: Expanded(
                          child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                                itemCount: 10,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                    child: ListTile(
                                      title: const Text('data'),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text("data"),
                                          Text('data')
                                        ],
                                      ),
                                      leading: const FlutterLogo(size: 50),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      )),
                    ),
                    const Expanded(
                      child: Card(
                        color: Colors.white,
                        child: Center(
                          child: Text('Select a Contact to get the details'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
