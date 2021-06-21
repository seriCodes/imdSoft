import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'patient_form.dart';
class PatientDetails extends StatelessWidget {
  static const routeName = '/patient-detail';
  final String firstName;
  final String lastName;
  final int hertBeat;
  final String id;
    TextEditingController _controller;

    PatientDetails(
      {Key key, this.firstName, this.lastName, this.hertBeat, this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    // final String name =routeArgs["firstName"]  + " "+ routeArgs["lastName"];

    print('routeArgs');
    print(routeArgs);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Patient'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Placeholder(
                fallbackWidth: 5,
                fallbackHeight: 10,
              ),
            ),

            Expanded(
              flex: 1,
              child: Container(
                color: Color.fromARGB(200, 150, 100, 111),
                margin: EdgeInsets.symmetric(vertical: 10),
                child:
                    Text('${routeArgs["firstName"]} ${routeArgs["lastName"]}'),
              ),
            ),
              Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                color: Color.fromARGB(200, 150, 100, 111),
                padding: EdgeInsetsDirectional.all(10),
                child: Text('Heart beat is ${routeArgs["hertBeat"] !=null? routeArgs["hertBeat"] : "not avialble" }'
                    ),
              ),
            ),          
              Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                color: Color.fromARGB(200, 150, 100, 111),
                padding: EdgeInsetsDirectional.all(10),
                child: Measuremant(),
                //  Form(
          // validator: EmailValidator(errorText: 'enter a valid email address')
            // child:
            
//             TextFormField(
//               decoration: const InputDecoration(
//               icon: Icon(Icons.medication),
//               hintText: 'Enter heart beat between 0 to 200',
//               // labelText: 'Name *',
//   ),
//     onSaved: (String value) {
//       print("value");  
//       print(value); 

// },
//   validator: (String value) {
//     return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
//   },


//               keyboardType: TextInputType.numberWithOptions(),
//         //  validator: EmailValidator(errorText: 'enter a valid email address')
//          )
//                 )

    //       controller: _controller,
    //       onSubmitted:(String value){
    //       print("Thanks");
    // print(value);
// _controller='';
// },
// inputFormatters: FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                

//   decoration: InputDecoration(
//         hintText:"Only numbers between 1 to 200", 
//         icon: Icon(Icons.medication)
//     )
// ,
// expands: true,
                // ),
              ),
            ), 
            
            ],
        ),
      ),
    );
  }
}
