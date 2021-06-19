import 'package:flutter/material.dart';
import '../dummy_data.dart';

final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];


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
    return Container(
      // padding: const EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      height: 80,
      color: Colors.blue,
      child: Center(child: Text('Entry ${index}')),
    );
  }
)


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
