

 library patients_cubit;
 import 'package:bloc/bloc.dart';

import '../models/patient.dart';
import '../dummy_data.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

 part 'patients_state.dart';

  class PatientsCubit extends Cubit<PatientsState> {

  PatientsCubit() : super(PatientsState(DUMMY_PATIENTS));

 
  void saveHeartBeat (String value, String id){
List<Patient> newList= state.patients;
Patient result =newList.firstWhere((element) => element.id==id);

 result.hertBeat=int.parse(value);
 emit (PatientsState(newList));
}

   void saveUrlImage (String value, String id){
List<Patient> newList= state.patients;
Patient result =newList.firstWhere((element) => element.id==id);
 result.imageUrl=value;
 emit (PatientsState(newList));
}
  void saveStoredImage (String value, String id){
    print("saveStoredImage");
List<Patient> newList= state.patients;
Patient result =newList.firstWhere((element) => element.id==id);
 result.storedImage=value;
 emit (PatientsState(newList));
}
int getItemIndex(String id){
       int result =state.patients.indexWhere((element) => element.id==id);
  
return result ;

}
 
//  static  Future<String>  saveNewPatientToDatabase({String heartBeat}) async{
   Future<String>  saveNewPatientToDatabase({String heartBeat,String firstName,String lastName }) async{
   final url = Uri.parse(
                    "https://flutter-study-ceef3-default-rtdb.europe-west1.firebasedatabase.app/patients.json");
                final result = await http.post(url, body: json.encode(
                  {
                       "firstName":firstName,
                      "lastName":lastName,
                      "hertBeat":heartBeat.toString(),
                      // storedImage
                    }
                ));
                print("result12345");
                    final patient= new Patient(
                      id:result.body,
                      firstName: firstName,
                      lastName:lastName,
                      hertBeat:int.parse(heartBeat),
                      // storedImage
                      imageUrl:"",
                      storedImage:"",
                    );
                print(result.body);
                // return  http.post(url, body: json.encode(heartBeat));
                print("result12345");
                // return result;
                List<Patient> newList= state.patients;
newList.add(patient);
 emit (PatientsState(newList));

                return Future((){return "result.body";});
   }

 
  }

