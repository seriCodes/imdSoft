import 'package:first_app/constants/connections.dart';
import 'package:flutter/material.dart';
import '../models/patient.dart';
import '../dummy_data.dart';
import './image_input.dart';
import '../constants/routes.dart';
import '../blocs/patients_cubit.dart';
import '../blocs/internt_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class PatientForm extends StatefulWidget {
  @override
  _PatientFormState createState() => _PatientFormState();
}

class _PatientFormState extends State<PatientForm> {
  final _imageUrlController = TextEditingController();
  TextEditingController _heartbeatController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form_key = GlobalKey<FormState>();
  bool _isInit = false;
  Patient _initValues;

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_isInit) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, Object>;

      print('didChangeDependencies routeArgs');
      print(routeArgs);

      // bool test(element) {
      //   print(element.id);
      //   return element.id == routeArgs["id"];
      // }  ;
      //! get the patioens from the bloc
      // _initValues = DUMMY_PATIENTS.firstWhere(test);
      // ;
      // _imageUrlController.text = _initValues.imageUrl;
      _imageUrlController.text = routeArgs["imageUrl"];
    }
    print(_initValues);
    _isInit = true;

    super.didChangeDependencies();
  }

  void _updateImageUrl() {
    print("_updateImageUrl");
    if (!_imageUrlController.text.endsWith(".png") &&
        !_imageUrlController.text.endsWith(".jpg") &&
        !_imageUrlController.text.endsWith(".jpeg") &&
        !_imageUrlController.text.isEmpty &&
        !_imageUrlController.text.startsWith('http')) {
      return;
    }
    if (!_imageUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _imageUrlController.dispose();
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  void _saveForm() {
    if (_form_key.currentState.validate()) {
      print('_saveForm');
      _form_key.currentState.save();
      print(_form_key.currentState);
    }
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    print("routeArgs build");
    print(routeArgs);

    print("measure");
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit patient"),
      ),
      body: BlocBuilder<InternetCubit, InternetState>(
        builder: (context, state) {
          if(state is InternetDisconnected){
            return Center(child: Text("No connection"));
          }
          return BlocBuilder<PatientsCubit, PatientsState>(
            builder: (context, state) {
              Patient copy = state.patient(routeArgs["id"]);

              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: _form_key,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Text('Enter Heart beat'),
                        SizedBox(
                          width: MediaQuery.of(context).size.width/7,
                          child: TextFormField(
                            
                            initialValue: copy.hertBeat == null
                                ? ""
                                : copy.hertBeat.toString(),
                            decoration: InputDecoration(
                                labelText: 'Enter heart beat between 0 to 200'),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            // controller: _heartbeatController,
                            validator: (String v) => heartbeatValidation(v),
                            onSaved: (String value) {
                              print(" save hb url");
                              print(value);
                            },
                            onFieldSubmitted: (value) {
                              // final a = BlocProvider.of<InternetCubit>(context).state;
                              // print("watch<InternetCubit>().state is InternetDisconnected");
                              // print(a);
                              //         ScaffoldMessenger.of(context).showSnackBar(
                              //         SnackBar(
                              //   content: Text('some'),
                              //   duration: Duration(milliseconds: 2000),
                              // ),
                              //       );

                              // if (context.watch<InternetCubit>().state
                              //     is InternetDisconnected) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(
                              //       content: Text('No internet! No State update'),
                              //       duration: Duration(milliseconds: 2000),
                              //     ),
                              //   );
                              //   return;
                              // }

                              if (heartbeatValidation(value) == null) {
                                BlocProvider.of<PatientsCubit>(context)
                                    .saveHeartBeat(value, copy.id);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('heartbeat updated in state '),
                                    duration: Duration(milliseconds: 2000),
                                  ),
                                );
                              }

                              // context.read<PatientsCubit>().
                            },
                          ),
                        ),
                        Text('Enter image url'),
                        TextFormField(
                          // enabled:false,
                          onSaved: (String value) {
                            print(" save image url");
                            print(value);
                          },
                          keyboardType: TextInputType.url,
                          controller: _imageUrlController,
                          focusNode: _imageUrlFocusNode,
                          validator: (v) => urlValidator(v),
                          onFieldSubmitted: (value) {
                            print("value onUrlSubmited");
                            if (urlValidator(value) == null) {
                              BlocProvider.of<PatientsCubit>(context)
                                  .saveUrlImage(value, copy.id);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('URL updated in state '),
                                  duration: Duration(milliseconds: 2000),
                                ),
                              );
                            }

                            print(value);
                            _saveForm();
                          },
                          textInputAction: TextInputAction.done,
                        ),
                        if (!_imageUrlController.text.isEmpty &&
                            (_imageUrlController.text.startsWith('http')))
                          BlocBuilder<InternetCubit, InternetState>(
                            builder: (context, state) {
                              if (state is InternetDisconnected) {
                                return Text(
                                    "Can't present url image without connection");
                              }
                              return FittedBox(
                                  child: Image.network(
                                _imageUrlController.text,
                                fit: BoxFit.cover,
                              ));
                            },
                          ),
                        TextButton.icon(
                            label: Text("Take a picture page"),
                            icon: const Icon(Icons.camera_front),
                            onPressed: () {
                              Navigator.of(context).pushReplacementNamed(
                                Routes.imageInput,
                                arguments: <String, Object>{
                                  "id": copy.id,
                                },
                                // copy.id,
                              );
                            }),
                        //                     BlocListener<PatientsCubit, PatientsState>(
                        //                       listener: (context, state) {
                        //                         // final internetState =  context.watch<InternetCubit>().state;
                        //                         final internetState =
                        //                             BlocProvider.of<InternetCubit>(context).state;
                        //                         print('BlocListener<PatientsCubit332');

                        // //  final heartbeatState =  context.select<PatientsCubit>().state.patients[index].hertBeat;
                        // // String result = "dsd";
                        //                         print('internetState');
                        //                         print(internetState);

                        // // if(internetState is InternetConnected && internetState.connectionType== ConnectionType.Wifi){
                        //                         ScaffoldMessenger.of(context).showSnackBar(
                        //                           SnackBar(
                        //                             content: Text('Wifi!'),
                        //                             duration: Duration(milliseconds: 2000),
                        //                           ),
                        //                         );

                        // // }
                        // // if(internetState is InternetConnected && internetState.connectionType== ConnectionType.Mobile){
                        // // // return  Text("mobile");
                        // // }
                        // // if(internetState is InternetDisconnected  ){
                        // // // return  Text("no internt");
                        // // }
                        // // if(internetState is InternetLoading  ){
                        // // // return  CircularProgressIndicator();
                        // // }
                        //                         // return  Text("default");
                        //                       },
                        //                       child: Container(),
                        //                     )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  String heartbeatValidation(value) {
    print('validator hb');
    int hb;
    try {
      hb = int.parse(value);
    } catch (e) {
      print(e);
      return "Please enter a number";
    }
    if (hb < 200 && hb > -1) {
      return null;
    } else {
      return "Please enter VALID a number";
    }
  }

  // void onUrlSubmited(value) {
  //   print("value onUrlSubmited");
  //   print(value);
  //   _saveForm();
  // }

  String urlValidator(value) {
    print('validator img');
    print(value);
    if (!value.isEmpty && !value.startsWith('http')
        // && !value.startsWith('https')
        ) {
      return "please enter valid url";
    }
    if (!value.endsWith(".png") &&
        !value.endsWith(".jpg") &&
        !value.endsWith(".jpeg")) {
      print('jpg');
      return "please enter png, jpg or jpeg url";
    }
    print("before url null");
    return null;
  }
}
