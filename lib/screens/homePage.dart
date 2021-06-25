import 'package:first_app/models/patient.dart';
import 'package:flutter/material.dart';
 import '../blocs/patients_cubit.dart';
import 'dart:convert';
import '../constants/routes.dart';

import '../widgets/patientItem.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
class HomePage extends StatelessWidget {
  const HomePage() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('My Patients'),
        actions: [IconButton(onPressed:() async {
 final url= Uri.parse("https://flutter-study-ceef3-default-rtdb.europe-west1.firebasedatabase.app/patients.json");

final result = await http.post(url,body:json.encode("777"));
print("result12345");

print(result.body);
// http.Client().post(url,body:{"test":"test2"});
               return Navigator.of(context).pushNamed( 
               Routes.addPatient,
                );

        }, icon:Icon(Icons.add)  
        )], ),
        
        body: BlocBuilder<PatientsCubit, PatientsState>(
          builder: (context, state) {
            List<Patient> copy= state.patients ;
            print("copy[2].id.toString()");
            print(copy[2].id.toString());
            return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: state.patients.length,
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(99),
                    child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(8),
                        height: 60,
                        color: Colors.blue,
                        child: PatientItem(
                          firstName: copy[index].firstName,
                          lastName: copy[index].lastName,
                          hertBeat: copy[index].hertBeat,
                          id: copy[index].id.toString(),
                          imageUrl: copy[index].imageUrl,
                        )),
                  );
                });
          },
        )

        );
  }
}
