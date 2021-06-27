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
          Color boxColor = Colors.blue;
          Color textColor = Colors.white;

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
                    SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height,
                          maxWidth: MediaQuery.of(context).size.width,
                        ),
                        child: Container(
                          width: double.infinity,
                          // padding: const EdgeInsets.all(10.0),
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
                                    );
                                  },
                                ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: boxColor,
                                  ),
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  padding: EdgeInsetsDirectional.all(10),
                                  child: Center(
                                    child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(color: textColor),
                                          text: '${copy.firstName} ${copy.lastName}'),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 1.2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: boxColor,
                                  ),
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  padding: EdgeInsetsDirectional.all(10),
                                  child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(color: textColor),
                                          children: <TextSpan>[
                                        TextSpan(
                                            text: "Patien Details \n\n",
                                            style: TextStyle(fontSize: 19)),
                                        TextSpan(
                                            text:
                                                '\r\r\r Heart beat is ${copy.hertBeat != null ? copy.hertBeat : "not avialble"}'),
                                      ])),
                                ),
                              ),
                              
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  color: textColor,
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
