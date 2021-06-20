import 'package:flutter/material.dart';
import '../dummy_data.dart';

final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];

class HomePage extends StatelessWidget {
  const HomePage() : super();

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
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
                  child: Row(children: [
                    Text(
                      '${DUMMY_PATIENTS[index].firstName} ${DUMMY_PATIENTS[index].lastName}',
                      style: appTheme.textTheme.bodyText1,
                      // Color:Colors.blue,
                      // Color.fromRGBO(0,0,0,1)
                    ),
                    Spacer(),
                    Text(
                      '${DUMMY_PATIENTS[index].hertBeat != null ? DUMMY_PATIENTS[index].hertBeat : "No heart beat data"}',
                      style: appTheme.textTheme.bodyText2,
                      // TextStyle(
                      // appTheme.textTheme.bodyText1
                      // fontWeight: FontWeight.w600,
                      // color: appTheme.textTheme.bodyText1.color,
                      // fontSize: 18.5
                      // ),
                    ),
                  ]),
                ),
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
