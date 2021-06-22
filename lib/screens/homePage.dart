import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../blocs/patients_cubit.dart';

import '../widgets/patientItem.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('My Patients'), actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
        ]),
        body: BlocBuilder<PatientsCubit, PatientsState>(
          builder: (context, state) {
            // state.
           int one= state.printSomeState;
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
                          firstName: state.patients[index].firstName,
                          lastName: state.patients[index].lastName,
                          hertBeat: state.patients[index].hertBeat,
                          id: state.patients[index].id.toString(),
                          imageUrl: state.patients[index].imageUrl,
                        )),
                  );
                });
          },
        )

        );
  }
}
