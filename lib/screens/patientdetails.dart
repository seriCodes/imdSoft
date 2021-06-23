import 'package:first_app/models/patient.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'patient_form.dart';
import '../constants/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/patients_cubit.dart';
import '../blocs/internt_cubit.dart';

class PatientDetails extends StatelessWidget {
  // Map<String, Object> routeArgs;
  String id;
  @override
  Widget build(BuildContext context) {
    id = ModalRoute.of(context).settings.arguments;
    // final String name =routeArgs["firstName"]  + " "+ routeArgs["lastName"];

    // print('routeArgs detail');
    // print(routeArgs);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Patient'),
      ),
      body: BlocBuilder<PatientsCubit, PatientsState>(
        builder: (context, state) {
          print("copy id");
          print(id);

          Patient copy = state.patient(id);
          print("copy url dtails");
          print(copy.imageUrl);

              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height,
                  maxWidth: MediaQuery.of(context).size.width,
              
                      ),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        if (copy.imageUrl != null && copy.imageUrl.isNotEmpty)
                          BlocBuilder<InternetCubit, InternetState>(
                            builder: (context, state) {
                              if (state is InternetDisconnected) {
                                return Text(
                                    "Can't present url image without connection");
                              }
              
                              return Expanded(
                                flex: 1,
                                child: FittedBox(
                                    child: Image.network(copy.imageUrl)),
                                //  Placeholder(
                                //   fallbackWidth: 5,
                                //   fallbackHeight: 10,
                                // ),
                              );
                            },
                          ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Color.fromARGB(200, 0, 100, 111),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: RichText(
                              text: TextSpan(
                                  text: '${copy.firstName} ${copy.lastName}'),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color.fromARGB(200, 150, 100, 111),
                            ),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsetsDirectional.all(10),
                            child: Text(
                                'Heart beat is ${copy.hertBeat != null ? copy.hertBeat : "not avialble"}'),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            color: Color.fromARGB(200, 150, 100, 111),
                            padding: EdgeInsetsDirectional.all(10),
                            child: IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                // print("onPressed routeArgs");
                                // print(routeArgs);
              
                                return Navigator.of(context)
                                    .pushNamed(Routes.patientForm,
                                        // arguments: id
                                        arguments: <String, Object>{
                                      //   "firstName": copy.firstName,
                                      //   "lastName": copy.lastName,
                                      //   "hertBeat": copy.hertBeat,
                                      "id": copy.id,
                                      "imageUrl": copy.imageUrl,
                                    });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
          
        },
      ),
    );
  }
}
