library patients_cubit;

import 'package:bloc/bloc.dart';

import '../models/patient.dart';
import '../dummy_data.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/routes.dart';

part 'patients_state.dart';

class PatientsCubit extends Cubit<PatientsState> {
  PatientsCubit() : super(PatientsState(DUMMY_PATIENTS));

  void saveHeartBeat(String value, String id) {
    List<Patient> newList = state.patients;
    Patient result = newList.firstWhere((element) => element.id == id);

    result.hertBeat = int.parse(value);
    emit(PatientsState(newList));
  }

  void saveUrlImage(String value, String id) {
    List<Patient> newList = state.patients;
    Patient result = newList.firstWhere((element) => element.id == id);
    result.imageUrl = value;
    emit(PatientsState(newList));
  }

  void saveStoredImage(String value, String id) {
    print("saveStoredImage");
    List<Patient> newList = state.patients;
    Patient result = newList.firstWhere((element) => element.id == id);
    result.storedImage = value;
    emit(PatientsState(newList));
  }

  int getItemIndex(String id) {
    int result = state.patients.indexWhere((element) => element.id == id);

    return result;
  }

//  static  Future<String>  saveNewPatientToDatabase({String heartBeat}) async{
  Future<String> saveNewPatientToDatabase(
      {String heartBeat, String firstName, String lastName}) async {
    final url = Uri.parse(Routes.dataBase + Routes.collections["patients"]);
    try {
      // final result<http.Response> = await http.post(url, body: json.encode(
      final result = await http.post(url,
          body: json.encode({
            "firstName": firstName,
            "lastName": lastName,
            "hertBeat": heartBeat.toString(),
            // storedImage
          }));
          if(result.statusCode!=200){
            throw (result.body);
          }
      final patient = new Patient(
        id: result.body,
        firstName: firstName,
        lastName: lastName,
        hertBeat: int.parse(heartBeat),
        // storedImage
        imageUrl: "",
        storedImage: "",
      );
      List<Patient> newList = state.patients;

      newList.add(patient);
      emit(PatientsState(newList));
     } catch (error) {
      print("error in cubit");
      throw (error);
    }
  }
}
