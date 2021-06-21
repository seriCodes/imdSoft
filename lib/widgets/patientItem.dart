import 'package:first_app/screens/patientdetails.dart';
import 'package:flutter/material.dart';
class PatientItem extends StatelessWidget {
  final String firstName;
  final String lastName;
  final int hertBeat;
  final String id;

  PatientItem({this.firstName, this.lastName, this.hertBeat, this.id});

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

    return GestureDetector(
      onTap: (){
               return Navigator.of(context).pushNamed( 
                //  context, 
                PatientDetails.routeName,
       arguments: <String, Object>{
     "firstName":firstName,
    "lastName": lastName,
    "hertBeat":hertBeat,
    "id":id
    },

               );
 

      },
      behavior: HitTestBehavior.opaque,
      child: Row(key: ValueKey(id), children: [
        Text(
          '${firstName} ${lastName}',
          style: appTheme.textTheme.bodyText1,
        ),
        Spacer(),
        Text(
          '${hertBeat != null ? hertBeat : "No heart beat data"}',
          style: appTheme.textTheme.bodyText2,
        ),
      ]),
    );
  }
}
