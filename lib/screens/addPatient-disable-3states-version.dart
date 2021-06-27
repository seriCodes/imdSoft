import 'package:flutter/material.dart';
import '../blocs/patients_cubit.dart';
import '../blocs/internt_cubit.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utilities/utilitiesExports.dart' as utilities;

class AddPatient extends StatefulWidget {
// final String key;
  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  final _imageUrlController = TextEditingController();

  TextEditingController _heartbeatController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  bool _isLoading = false;
   bool _isFirstNameLegit = false;
  bool _isLastNameLegit = false;
  bool _isHeartbeatLegit = false;

  final _form_key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

 

  @override
  void dispose() {
    super.dispose();
  }

  void _onLastNameChange(v) {
    print('_onLastNameChange3');
    print(v);
    if (utilities.FormValidators.nameValidator(v) == null) {
      setState(() {
        _isLastNameLegit = true;
      });
    }else{
            setState(() {
        _isLastNameLegit = false;
      });

    }
  }

  void _onFirstNameChange(v) {
    print('_onFirstNameChangee3');

    if (utilities.FormValidators.nameValidator(v) == null) {
      setState(() {
        _isFirstNameLegit = true;
      });
    }else{
            setState(() {
        _isFirstNameLegit = false;
      });
  }
  }
  void _onHeartbeatNameChange(v) {
    print('_onHeartbeatNameChange4');

    if (utilities.FormValidators.heartbeatValidation(v) == null) {
      setState(() {
        _isHeartbeatLegit = true;
      });
    }else{
            setState(() {
        _isHeartbeatLegit = false;
      });
  }
  }
  void _saveForm(Function saver, String hb, String firstName, String lastName,
      BuildContext context) async {
    if (_form_key.currentState.validate()) {
      print('_saveForm');
      _form_key.currentState.save();
      print(_form_key.currentState);
      setState(() {
        _isLoading = true;
      });
      try {
        await saver(heartBeat: hb, firstName: firstName, lastName: lastName);
      } catch (error) {
        print("inside Error");
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('An error occurred!'),
            content: Text('Something went wrong.'),
            actions: <Widget>[
              TextButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Patient"),
        actions: [
          IconButton(
              onPressed: !_isFirstNameLegit
                  ? null
                  : !_isLastNameLegit? null: 
                  !_isHeartbeatLegit? null:
                  () async {
                      String hb = _heartbeatController.text;
                      String firstName = _firstNameController.text;
                      String lastName = _lastNameController.text;
                      await _saveForm(
                          BlocProvider.of<PatientsCubit>(context)
                              .saveNewPatientToDatabase,
                          hb,
                          firstName,
                          lastName,
                          context);
                    },
              icon: Icon(Icons.save))
        ],
      ),
      body: BlocBuilder<InternetCubit, InternetState>(
        builder: (context, state) {
          return state is InternetDisconnected
              ? Center(child: Text("No Connection"))
              : _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                        key: _form_key,
                        child: SingleChildScrollView(
                          child: Container(
                            width: double.infinity,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text('Enter first name'),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: TextFormField(
                                    onChanged: _onFirstNameChange,
                                    decoration:
                                        InputDecoration(labelText: 'name'),
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.name,
                                    validator: (String v) =>
                                        utilities.FormValidators.nameValidator(
                                            v),
                                    onSaved: (String value) {
                                      print(" save first name url");
                                      print(value);
                                    },
                                    controller: _firstNameController,
                                    onFieldSubmitted: (value) {
                                      if (utilities.FormValidators
                                              .nameValidator(value) ==
                                          null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text('name is valid'),
                                            duration:
                                                Duration(milliseconds: 2000),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                                Text('Enter Last name'),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: TextFormField(
                                    onChanged: _onLastNameChange,
                                    decoration:
                                        InputDecoration(labelText: 'Last name'),
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.name,
                                    validator: (String v) =>
                                        utilities.FormValidators.nameValidator(
                                            v),
                                    onSaved: (String value) {
                                      print(" save Last name url");
                                      print(value);
                                    },
                                    controller: _lastNameController,
                                    onFieldSubmitted: (value) {
                                      if (utilities.FormValidators
                                              .nameValidator(value) ==
                                          null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text('Last name is valid'),
                                            duration:
                                                Duration(milliseconds: 2000),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                                Text('Enter Heart beat'),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: TextFormField(
                                    onChanged: _onHeartbeatNameChange,
                                    decoration: InputDecoration(
                                        labelText: 'Number between 0 to 200'),
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.number,
                                    validator: (String v) => utilities
                                        .FormValidators.heartbeatValidation(v),
                                    onSaved: (String value) {
                                      print(" save hb url");
                                      print(value);
                                    },
                                    controller: _heartbeatController,
                                    onFieldSubmitted: (value) {
                                      if (utilities.FormValidators
                                              .heartbeatValidation(value) ==
                                          null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text('heartbeat is valid'),
                                            duration:
                                                Duration(milliseconds: 2000),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                                // Text('Enter image url'),
                                // TextFormField(
                                //   onSaved: (String value) {},
                                //   keyboardType: TextInputType.url,
                                //   controller: _imageUrlController,
                                //   focusNode: _imageUrlFocusNode,
                                //   // validator: (v) => {return null},
                                //   onFieldSubmitted: (value) async {
                                //     print("value onUrlSubmited");
                                //     if (true) {}

                                //     print(value);
                                //     String hb = _heartbeatController.text;
                                //     String firstName = _firstNameController.text;
                                //     String lastName = _lastNameController.text;

                                //     await _saveForm(
                                //         BlocProvider.of<PatientsCubit>(context)
                                //             .saveNewPatientToDatabase,
                                //         hb,
                                //         firstName,
                                //         lastName,
                                //         context);
                                //   },
                                //   textInputAction: TextInputAction.done,
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
        },
      ),
    );
  }
}
