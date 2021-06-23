import 'dart:io';
import 'package:first_app/models/patient.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart' as path;
import '../constants/routes.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/patients_cubit.dart';

class ImageInput extends StatefulWidget {
  ImageInput({Key key}) : super(key: key);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  bool _isInit = false;
  File _storedImage;
  Future<void> _takePicture(Function stateUpdater, String id) async {
    print("_takePicture");
    final imageFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 500,
      maxHeight: MediaQuery.of(context).size.height - 50,
    );
    if (imageFile == null) {
      return;
    }
    stateUpdater(imageFile.path,id);
    setState(() {
      _storedImage = File(imageFile.path);
    });
    final appdir = await syspath.getApplicationDocumentsDirectory();
    print('appdir');
    print(appdir);

    final fileName = path.basename(imageFile.path);
    print('fileName');
    print(fileName);

    final SavedImage = await _storedImage.copy('${appdir.path}/$fileName');
    print('SavedImage');
    print(SavedImage);
  }
  // @override
  // void didChangeDependencies() {
  //   if (!_isInit) {

  //   }
  //   final patientId =
  //         ModalRoute.of(context).settings.arguments as Map<String, Object>;

  //     print(' _ImageInputState didChangeDependencies routeArgs');
  //     print(patientId);

  // }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Text(
        "Add image",
      )),
      body: BlocBuilder<PatientsCubit, PatientsState>(
        builder: (context, state) {
          Patient copy = state.patient(routeArgs["id"]);
          print("Add image .storedImage!=null");
          print(copy);
          print(copy.storedImage);

          if (copy.storedImage != null && copy.storedImage.isNotEmpty) {
            print("copy.storedImage!=null");
            _storedImage = File(copy.storedImage);
          }
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height,
              maxWidth: MediaQuery.of(context).size.width
              ),
              child: Column(
              
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Center(
                              child: IconButton(
                                  onPressed: () {
                                    _takePicture(
                                        BlocProvider.of<PatientsCubit>(context)
                                            .saveStoredImage,copy.id);
                                  },
                                  icon: Icon(Icons.camera_alt_outlined))
                                  ),

                          _storedImage != null
                              ? Flexible(
                                child: Image.file(
                                    _storedImage,
                                    fit: BoxFit.cover,
                                  ),
                              )
                              : Text("Take an image"),
                        
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
