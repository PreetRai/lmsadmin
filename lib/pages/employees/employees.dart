import 'package:flutter/material.dart';
import 'package:lmsadmin/pages/employees/add_employee.dart';
import 'package:lmsadmin/pages/employees/display_employee_details.dart';
import 'package:lmsadmin/widgets/app_drawer.dart';
import 'package:lmsadmin/widgets/header.dart';
import '../../widgets/app_bar.dart';
import 'employee_names.dart';

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
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const AddEmployee()));
                  }),
                  child: Text('Add Employees'),
                ),
              ),
              Visibility(
                visible: isVisible,
                replacement: const AddEmployee(),
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      EmployeeNames(),
                      DisplayEmpDetails(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
