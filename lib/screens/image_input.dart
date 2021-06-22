import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart' as path;
import '../constants/routes.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;

class ImageInput extends StatefulWidget {
 
  ImageInput({Key  key}) : super(key: key);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
    bool _isInit = false;
    File _storedImage;
Future <void> _takePicture() async {
  print("_takePicture");
   final imageFile= await  ImagePicker().getImage(source: ImageSource.camera,
  maxWidth: 500,
  maxHeight:MediaQuery. of(context). size. height-50,
  ); 
  if(imageFile==null){
return;
  }
  setState(() {
    _storedImage=File( imageFile.path);
  });
   final appdir=await syspath.getApplicationDocumentsDirectory();
    print('appdir');
    print(appdir);

  final fileName = path.basename(imageFile.path);
    print('fileName');
    print(fileName);

  final SavedImage= await _storedImage.copy('${appdir.path}/$fileName');
  print('SavedImage');
    print(SavedImage);

}
  @override
  void didChangeDependencies() {
    if (!_isInit) {

    }      final patientId =
          ModalRoute.of(context).settings.arguments as Map<String, Object>;

      print(' _ImageInputState didChangeDependencies routeArgs');
      print(patientId);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Add image",)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery. of(context). size. width,
              height: MediaQuery. of(context). size. height,
              child: Expanded(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center ,
                         children: [
                            _storedImage!=null? Image.file(_storedImage, fit: BoxFit.cover,) :Text("Take an image"),
      
                           
                           Center(
                             child: IconButton(onPressed: (){
                     _takePicture();
                             }, icon: Icon(Icons.camera_alt_outlined))
                           ),
                         ],
                      
                     ),
                  
                 
              ),
            ),
           ],
      
        ),
      ),
    );
  }
}