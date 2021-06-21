import 'package:flutter/material.dart';

class PatientForm extends StatefulWidget {
  PatientForm({Key  key}) : super(key: key);
    static const routeName = '/patient-form';



  @override
  _PatientFormState createState() => _PatientFormState();
}

class _PatientFormState extends State<PatientForm> {
  final _imageUrlController= TextEditingController();
    TextEditingController _controller;
    final  _imageUrlFocusNode=FocusNode();


@override
void initState() {
_imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }
void _updateImageUrl(){
  print("_updateImageUrl");
  if(!_imageUrlFocusNode.hasFocus){
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

  @override
  Widget build(BuildContext context) {
    print("measure");
    return Scaffold(
      appBar: AppBar(title: Text("Edit patient")),
      body: Padding(
        padding: const EdgeInsets.only(bottom:0.0 ),
        child: Form(
           child: SingleChildScrollView(
             child: Column(children: <Widget>[
               Text('Enter Heart beat'),
               TextFormField(
                 decoration: InputDecoration(
                 labelText:'Enter heart beat between 0 to 200'),
                 textInputAction: TextInputAction.done,
                 keyboardType: TextInputType.number,
                 onFieldSubmitted: (value){
                   print(value);
                 },
                 
                 ),
                Text('Enter image url'),
    
                 TextFormField(
                  keyboardType: TextInputType.url,
                  controller:_imageUrlController,
                  
                  focusNode: _imageUrlFocusNode,
                  
                   onFieldSubmitted: (value){
                   print(value);
                 },),
                 if(!_imageUrlController.text.isEmpty)                
                      FittedBox(
                     child:Image.network(
                    //  "https://miro.medium.com/max/784/1*XWOy4cdViEBAPKqZi48ojQ.png",
                     _imageUrlController.text,
                   fit:BoxFit.cover,
                   )
                   ),
                 
                 
             ],),
           ),
        ),
      ),
    );
  }
}