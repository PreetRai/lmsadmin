import 'package:flutter/material.dart';
import 'package:lmsadmin/pages/add_employee.dart';
import 'package:lmsadmin/widgets/app_drawer.dart';
import 'package:lmsadmin/widgets/header.dart';
import '../widgets/app_bar.dart';

class Employeedetails extends StatefulWidget {
  const Employeedetails({
    Key? key,
  }) : super(key: key);

  @override
  _EmployeedetailsState createState() => _EmployeedetailsState();
}

class _EmployeedetailsState extends State<Employeedetails> {
  String buttonText = 'Add Employees';
  bool isVisible = true;
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
                headerTitle: 'Employees',
                addButton: ElevatedButton(
                  onPressed: () => setState(() {
                    if (isVisible == false) {
                      isVisible = !isVisible;
                      buttonText = 'Add Employee';
                    } else {
                      isVisible = !isVisible;
                      buttonText = 'Show Employees';
                    }
                  }),
                  child: Text(buttonText),
                ),
              ),
              Visibility(
                visible: isVisible,
                replacement: const AddEmployee(),
                child: Expanded(
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
                                'Registered Employees',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                  itemCount: 10,
                                  itemBuilder:
                                      (BuildContext context, int index) {
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
                        ),
                      ),
                      Flexible(
                        flex: 3,
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
        ));
  }
}
