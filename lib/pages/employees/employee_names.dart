import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EmployeeNames extends StatefulWidget {
  const EmployeeNames({Key? key}) : super(key: key);

  @override
  _EmployeeNamesState createState() => _EmployeeNamesState();
}

class _EmployeeNamesState extends State<EmployeeNames> {
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    int? getcout() {
      int? size;
      FirebaseFirestore.instance
          .collection("Employees")
          .get()
          .then((value) => {size = value.size});
      return size;
    }

    int? x = getcout();

    @override
    void initState() {
      super.initState();

      _scrollController.addListener(() {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          print('Page reached end of page');
          setState(() {});
          getcout();
        }
      });
    }

    return
    
    
     Flexible(
       flex:1,
       child: Column(
         children: [
            const  Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Registered Employees',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
           Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: x,
                itemBuilder: (context, value) {
                  return FutureBuilder(
                      future: getdata(value),
                      builder: (context, AsyncSnapshot<Map> snapshot) {
                        Map employee = snapshot.data!;
     
                        return Card(
                          child: ListTile(
                            onTap: () {
                      
                            },
                            title: Text('${employee['name']}'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${employee['email']}',
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  '${employee['phone']}',
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                            leading: const FlutterLogo(size: 50),
                          ),
                        );
                      });
                }),
         ),
         ],
       ),
     );
  }
}

Future<Map> getdata(int x) async {
  final QuerySnapshot result =
      await FirebaseFirestore.instance.collection('Employees').get();
  final List<DocumentSnapshot> document = result.docs;
  var elementAt = {};
  elementAt['name'] =
      '${document.elementAt(x).get('firstName')} ${document.elementAt(x).get('secondName')}';
  elementAt['email'] = '${document.elementAt(x).get('email')}';
  elementAt['phone'] = '${document.elementAt(x).get('phone')}';

  return elementAt;
}
