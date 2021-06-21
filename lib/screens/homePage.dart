import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/patientItem.dart';

class HomePage extends StatelessWidget {
  const HomePage() : super();

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
        appBar: AppBar(title: Text('My Patients'), actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
         ]),
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: DUMMY_PATIENTS.length,
            itemBuilder: (BuildContext context, int index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(99),
                child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(8),
                    height: 60,
                    color: Colors.blue,
                    child: PatientItem(
                      firstName: DUMMY_PATIENTS[index].firstName,
                      lastName: DUMMY_PATIENTS[index].lastName,
                      hertBeat: DUMMY_PATIENTS[index].hertBeat,
                      id: DUMMY_PATIENTS[index].id.toString(),
                    )),
              );
            })

        // Column(
        //   children: [
        // Expanded(
        // child:
        // ListView.builder(
        //   itemCount: DUMMY_PATIENTS.length,
        //   itemBuilder: (ctx, i) => Text("DUMMY_PATIENTS[i].firstName")
        // )
        // )
        // ],
        // ),

        );
  }
}
