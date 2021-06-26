import 'dart:ffi';

import 'package:first_app/models/patient.dart';
import 'package:flutter/material.dart';
import '../blocs/patients_cubit.dart';
import 'dart:convert';
import '../constants/routes.dart';

import '../widgets/patientItem.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage() : super();


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
bool _isDataEmitted=false;
// 
  bool _isInit=false;
  void initState() {

// await BlocProvider.of<PatientsCubit>(context).fetchDataFromDataBase();
    
    super.initState();
  
  }

    @override
void didChangeDependencies() async{
  if(!_isInit){
    await BlocProvider.of<PatientsCubit>(context).fetchDataFromDataBase();
      setState(() {
      _isDataEmitted=true;
        _isInit=true; 
    }); 
  }
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Patients'),
          actions: [
            IconButton(
                onPressed: () async {
                  return Navigator.of(context).pushNamed(
                    Routes.addPatient,
                  );
                },
                icon: Icon(Icons.add))
          ],
        ),
        body:!_isDataEmitted ? Center(child: CircularProgressIndicator()):BlocBuilder<PatientsCubit, PatientsState>(
          builder: (context, state) {
            List<Patient> copy = state.patients;
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
        ));
  }
}
