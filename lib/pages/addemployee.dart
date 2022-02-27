import 'package:flutter/material.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
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
