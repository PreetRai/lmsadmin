import 'package:flutter/material.dart';
import 'package:lmsadmin/pages/properties/add_properties.dart';

class PropertTab extends StatefulWidget {
  const PropertTab({Key? key}) : super(key: key);

  @override
  State<PropertTab> createState() => _PropertTabState();
}

class _PropertTabState extends State<PropertTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const AddProperties()));
                  },
                  child: const Text('Add Property')),
            )),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Properties:',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Expanded(
          child: SizedBox(
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, snap) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                        width: 400,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.home,
                                          size: 40,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Regular| Flat',
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Icon(
                                                  Icons.circle_outlined,
                                                  size: 10,
                                                  color: Colors.blue,
                                                ),
                                                Text(
                                                  'Retail',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.blue),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                height: 10,
                                                child: ElevatedButton(
                                                    onPressed: () {},
                                                    child: const Text(
                                                      'edit',
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    )),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: SizedBox(
                                                  height: 10,
                                                  child: ElevatedButton(
                                                      onPressed: () {},
                                                      child: const Text(
                                                        'details',
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Text(
                                      '9532 Homestead rd, Rajkot',
                                      style: TextStyle(color: Colors.blueGrey),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
                  );
                }),
          ),
        )
      ],
    );
  }
}
