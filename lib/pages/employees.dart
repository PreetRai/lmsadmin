import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Container(
          color: Colors.black12,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Header(),
              Expanded(
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
              )
            ],
          ),
        ));
  }
}
