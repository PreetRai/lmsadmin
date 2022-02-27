import 'package:flutter/material.dart';

class AddContacts extends StatefulWidget {
  const AddContacts({Key? key}) : super(key: key);

  @override
  _AddContactsState createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [Text("data"), Text('data')],
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
                child: Text('add contacts'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
