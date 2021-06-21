import 'package:flutter/material.dart';

class Measuremant extends StatefulWidget {
  Measuremant({Key  key}) : super(key: key);

  @override
  _MeasuremantState createState() => _MeasuremantState();
}

class _MeasuremantState extends State<Measuremant> {
  final _imageUrlController= TextEditingController();

@override
void dispose() {
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("measure");
    return Padding(
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
    );
  }
}