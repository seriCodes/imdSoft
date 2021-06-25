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

  // TextEditingController _heartbeatController = TextEditingController();

  final _imageUrlFocusNode = FocusNode();

  final _form_key = GlobalKey<FormState>();

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Patient"),
      ),
      body:   BlocBuilder<InternetCubit, InternetState>(
          builder: (context, state) {
            return state is InternetDisconnected ? Center(child: Text("No Connection")): Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: _form_key,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Text('Enter Heart beat'),
                        SizedBox(
                          width: MediaQuery.of(context).size.width/3,
                          child: TextFormField( 
                             decoration: InputDecoration(
                                labelText: 'Number between 0 to 200'),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                             validator: (String v) => utilities.FormValidators.heartbeatValidation(v),
                            onSaved: (String value) {
                              print(" save hb url");
                              print(value);
                            },
                            onFieldSubmitted: (value) {
                        

                              if (utilities.FormValidators.heartbeatValidation(value) == null) { 
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('heartbeat updated in state '),
                                    duration: Duration(milliseconds: 2000),
                                  ),
                                );
                              }

                             },
                          ),
                        ),
                        Text('Enter image url'),
                        TextFormField( 
                          onSaved: (String value) {
                           },
                          keyboardType: TextInputType.url,
                          controller: _imageUrlController,
                          focusNode: _imageUrlFocusNode,
                          // validator: (v) => {return null},
                          onFieldSubmitted: (value) {
                            print("value onUrlSubmited");
                            if ( true) {
                              
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
                           
                                },
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
